from datetime import datetime
import random

from django.contrib.auth import authenticate, login
from django.contrib.auth.signals import user_login_failed, user_logged_in, user_logged_out
from django.contrib import messages
from django.dispatch import receiver
from django.shortcuts import render, redirect
from django.http import HttpResponse

from .models import User, Form, SubForm_historia_personal, SubForm_antecedentes_g_o, SubForm_historia_familiar, \
    Clinic, Patient, Identidad_etnica, Prueba_genetica, Parentesco
from .forms import RegistrationForm, SubForm_historia_personal_Form, SubForm_antecedentes_g_o_Form, \
    SubForm_historia_familiar_Form

from .Clients import ClientFactory


def index(request):
    if not request.user.is_authenticated:
        if request.method == 'GET':
            return render(request, 'index/index.html')

    else:
        error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')

@receiver(user_login_failed)
def user_login_failed_callback(sender, credentials, **kwargs):
    print("login failed", sender)
    message = "Login fallido con credenciales: {}".format(credentials)
    return HttpResponse(status=412, content=message)
"""
@receiver(user_logged_in)
def user_logged_in_callback(sender, request, user, credentials, **kwargs):
    print("login success", sender)
    message = "Se logueo correctamente el usuario: {}".format(credentials)
    return HttpResponse(status=202, content=message)

@receiver(user_logged_out)
def user_logged_out_callback(sender, credentials, **kwargs):
    print("login out", sender)
    message = "Se deslogueo correctamente el usuario: {}".format(credentials)
    return HttpResponse(status=202, content=message)
"""

#client = ClientFactory.get_client(request)


def error_page(request, status, message):
    return render(request, 'index/error.html', {'message': message}, status=status)


def registration(request):

    list_clinics_db = Clinic.objects.all().values()
    list_clinics = []
    for element in list_clinics_db:
        list_clinics += [(element['id'], element['name'])]

    if not request.user.is_authenticated:
        print('lol')
        if request.method == 'POST':
            print('verificando')
            form = RegistrationForm(request.POST)

            if form.is_valid():
                print("Creando cuenta...")
                if User.objects.filter(email=request.POST['correo_electronico']):
                    #messages.error(request, 'Correo asociado a una cuenta distinta.')
                    print("Correo ya existe")
                    return redirect('/patients/')

                new_user = User.objects.create_user(request.POST['correo_electronico'], request.POST['correo_electronico'], request.POST['contrasena'])
                new_user.firstname = request.POST['nombre']
                new_user.save()

                indice = [element[0] for element in list_clinics].index(int(request.POST['clinica']))
                print(list_clinics_db[indice]['name'])

                new_user.profile.clinic = Clinic.objects.filter(pk=int(request.POST['clinica'])).get()
                new_user.save()

                user = authenticate(username=new_user.username, password=request.POST['contrasena'])
                if user is not None:
                    login(request, user)

                print("Usuario creado.")
                return redirect('/patients/')

            else:
                print(form.errors)
                return error_page(request, 400, 'Error en la información recibida.')

        if request.method == 'GET':
            form = RegistrationForm(list_clinics=list_clinics)

            context = {'form': form}
            return render(request, 'index/register.html', context)

    else:
        print(request.user.username)
        return error_page(request, 400, 'Ya existe un usuario logueado.')



def pacientes(request):

    if request.user.is_authenticated:
        if request.method == 'GET':
            list_patients_db = Patient.objects.all().values()
            list_patients = []
            date = datetime.today().strftime("%d/%m/%y")

            for patient in list_patients_db:
                patient_dict = {}

                patient_dict['id'] = patient['id_patient']
                patient_dict['first_date'] = patient['created_at'].strftime("%d/%m/%y %H:%M:%S")
                patient_dict['last_date'] = patient['created_at'].strftime("%d/%m/%y %H:%M:%S")
                patient_dict['form_quantity'] = 25

                list_patients += [patient_dict]

            context = {'username': request.user.username, 'user_id': request.user.pk, 'current_date': date, 'list_patients' : list_patients}
            return render(request, 'index/pacientes.html', context)

    else:
        return error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')



def lista_formularios(request):
    if request.user.is_authenticated:
        if request.method == 'GET':
            list_forms_db = Form.objects.filter(id_patient=request.GET['id_patient']).values()
            patient = Patient.objects.get(id_patient=request.GET['id_patient'])
            date = datetime.today().strftime("%d/%m/%y")

            list_forms = []
            for form in list_forms_db:
                if form['habilitado']:

                    estado = False
                    if form['submitted_at'] != None:
                        estado = True

                    form_dict = {}
                    form_dict['id'] = form['id_form']
                    form_dict['date_created'] = form['created_at'].strftime("%d/%m/%y %H:%M:%S")
                    form_dict['state_form'] = estado

                    list_forms += [form_dict]

            context = {'patient_id':patient.id_patient,
                       'patient_name':patient.name ,
                       'username': request.user.username,
                       'user_id': request.user.pk,
                       'current_date': date,
                        'list_forms': list_forms}

            return render(request, 'index/formularios.html', context)


    else:
        return error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')


def deshabilitar_formulario(request):
    if request.user.is_authenticated:
        form = Form.objects.get(id_form=request.GET['id_form'])

        form.habilitado = False;
        form.save()

        return redirect('/forms/?id_patient='+request.GET['id_patient'])

    else:
        error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')


def agregar_formulario(request):
    if request.user.is_authenticated:
        patient = Patient.objects.get(id_patient=request.GET['id_patient'])

        clinic_name = request.user.profile.clinic.acronym
        id = clinic_name + str(random.randint(0, 1000))
        while Form.objects.filter(id_form=id):
            id = clinic_name + str(random.randint(0, 100))


        new_form = Form.objects.create(id_form=id, id_patient=patient)
        new_form.habilitado = True
        new_form.save()

        return redirect('/forms/?id_patient='+request.GET['id_patient'])

    else:
        error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')

def formulario(request):
    if request.user.is_authenticated:
        if request.method == 'GET':

            patient = Patient.objects.get(id_patient=request.GET['id_patient'])
            form = Form.objects.get(id_form=request.GET['id_form'])
            date = datetime.today().strftime("%d/%m/%y")

            print(request.GET['id_patient'])

            titulo_form = 'Formulario '
            if form.submitted_at != None:
                titulo_form += "Registrado: " + form.submitted_at.strftime("%d/%m/%y")
            else:
                titulo_form += "No Registrado"

            subform_hist_per = SubForm_historia_personal_Form(id_subform=form.subform_hist_per.pk)
            subform_ant_g_o = SubForm_antecedentes_g_o_Form(id_subform=form.subform_ant_g_o.pk)
            subform_hist_fam = SubForm_historia_familiar_Form(id_subform=form.subform_hist_fam.pk)


            context = {'patient_id': patient.id_patient,
                       'form_id': form.id_form,
                       'titulo_form': titulo_form,
                       'patient_name': patient.name,
                       'username': request.user.username,
                       'user_id': request.user.pk,
                       'current_date': date,
                       'subform_h': subform_hist_per,
                       'subform_a': subform_ant_g_o,
                       'subform_hf': subform_hist_fam
                       }

            return render(request, 'index/formulario.html', context)

    else:
        error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')


def guardar_subform_personal_Form(request):
    print("lol")
    if request.user.is_authenticated:
        if request.method == 'POST':

            subform_Form = SubForm_historia_personal_Form(request.POST)

            if subform_Form.is_valid():
                print("Guardando cambios personal...")

                form = Form.objects.get(id_form=request.GET['id_form'])

                subform = form.subform_hist_per

                subform.nombre = request.POST["nombre"]
                subform.clinic = Clinic.objects.filter(pk=int(request.POST['hospital'])).get()
                subform.cedula = request.POST["cedula"]
                subform.fecha_de_nacimiento = request.POST["fecha_nacimiento"]
                subform.nacionalidad = request.POST["nacionalidad"]
                subform.identidad_etnica = Identidad_etnica.objects.filter(pk=request.POST["identidad_etnica"]).get()
                subform.identidad_etnica_otro = request.POST["otra_identidad"]
                subform.peso = request.POST["peso_kg"]
                subform.talla = request.POST["talla_m"]
                subform.imc = request.POST["imc"]
                subform.fuma = request.POST["fumador"]
                subform.fuma_edad = request.POST["edad_fumo"]
                subform.fuma_actualmente = request.POST["fuma_actuamente"]
                subform.fuma_cuanto = request.POST["tiempo_fumando"]
                subform.bebidas = request.POST["bebe_alcohol"]
                subform.bebidas_cuanto = request.POST["frecuencia"]
                subform.bebidas_cuanto_otro = request.POST["bebe_frecuencia"]
                subform.actividad_fisica = request.POST["actividades_fisicas"]
                subform.actividad_fisica_cuanto = request.POST["minutos_actividad_fisica"]
                subform.consume_alimentos_con_grasa = request.POST["alimentos_con_grasa"]
                subform.consume_veg_frut_gram = request.POST["consume_vegetales_frts_grns"]
                subform.diabetes = request.POST["diabetes"]
                subform.toma_medicamento_tamoxifeno = request.POST["toma_tamoxifeno"]
                subform.cuanto_tamoxifeno = request.POST["cuanto_tiempo_tamoxifeno"]
                subform.toma_medicamento_anastrozol = request.POST["toma_anastrozol"]
                subform.cuanto_anastrozol = request.POST["cuanto_tiempo_anastrozol"]
                subform.toma_medicamento_metformina = request.POST["toma_metformina"]
                subform.cuanto_metformina = request.POST["cuanto_tiempo_metformina"]
                subform.toma_medicamento_bifosfonatos = request.POST["toma_bifosfonatos"]
                subform.cuanto_bifosfonatos = request.POST["cuanto_tiempo_bisfofonatos"]
                subform.toma_medicamento_aspirina = request.POST["toma_aspirinas"]
                subform.cuanto_aspirina = request.POST["cuanto_tiempo_aspirinas"]
                subform.radiacion = request.POST["tratamiento_torax"]

                subform.save()
                print("Cambios personal guardados")

            else:
                print(subform_Form.errors)
                return error_page(request, 400, 'Hubo un fallo en el request.')

            return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])

    else:
        return error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')

def guardar_subForm_antecedentes_g_o(request):

    if request.user.is_authenticated:
        if request.method == 'POST':

            subform_Form = SubForm_antecedentes_g_o_Form(request.POST)

            if subform_Form.is_valid():
                print("Guardando cambios antecedentes...")

                form = Form.objects.get(id_form=request.GET['id_form'])
                subform = form.subform_ant_g_o

                subform.manopausa_aplica = request.POST["menopausia"]
                subform.edad_menstruacion = request.POST["edad_menstruacion"]
                subform.edad_manopausa = request.POST["edad_menopausaia"]

                subform.parto_cantidad = request.POST["cantidad_partos"]

                if request.POST["cantidad_partos"] == '0':
                    subform.parto_aplica = '0'
                else:
                    subform.parto_aplica = '1'

                subform.edad_ult_hijo = request.POST["edad_ultimo_hijo"]

                subform.lactancia_aplica = request.POST["lactancia_ult_hijo"]

                subform.lactancia_tiempo = request.POST["tiempo_lactancia"]

                subform.anticonceptivos_aplica = request.POST["anticonceptivos_orales"]
                subform.anticonceptivos_cuanto = request.POST["tiempo_tomo"]
                subform.anticonceptivos_ult_vez = request.POST["ultima_vez_uso"]


                subform.terapia_hormonal_aplica = request.POST["terapia_hormonal"]

                subform.terapia = request.POST["tipo_terapia"]
                subform.cuanto_tiempo_terapia = request.POST["tiempo_uso"]


                subform.biopsia_aplica = request.POST["biopsia_mama"]
                subform.biopsia_cuantas = request.POST["numero_biopsia"]
                subform.biopsia_resultado = request.POST["resultado"]

                subform.save()
                print("Cambios antecedentes guardados")

            else:
                print(subform_Form.errors)
                return error_page(request, 400, 'Hubo un fallo en el request.')

            return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])

    else:
        return error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')


def guardar_subForm_historia_familiar(request):
    if request.user.is_authenticated:
        if request.method == 'POST':

            subform_Form = SubForm_historia_familiar_Form(request.POST)

            if subform_Form.is_valid():
                print("Guardando historia familiar...")

                form = Form.objects.get(id_form=request.GET['id_form'])
                subform = form.subform_hist_fam

                subform.prueba_genetica = request.POST["pruebas_geneticas"]

                #subform.prueba_genetica_resultado = request.POST["resultado"]

                subform.bebidas_cuanto_otro = request.POST["otro_resultado"]
                subform.familiares_mama = request.POST["familiares"]

                #subform.parentesco = request.POST["parentesco"]

                subform.familiares_cancer = request.POST["familiares_otro"]

                subform.familiares_cancer_tipo = request.POST["tipo"]
                subform.familiares_cancer_parentezco = request.POST["parentesco_tipo"]


                subform.save()
                print("Cambios historia guardados")


            else:
                print(subform_Form.errors)
                return error_page(request, 400, 'Hubo un fallo en el request.')

            return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])

    else:
        return error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')



def linea_de_tiempo(request):
    render(request, 'index/pagina.html')

def reportes_clinicos(request):
    render(request, 'index/pagina.html')

def informacion(request):
    render(request, 'index/pagina.html')

