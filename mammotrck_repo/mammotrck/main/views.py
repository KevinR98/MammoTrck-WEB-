from datetime import datetime
import random

from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import user_passes_test, login_required

from django.contrib.auth.models import User, Group
from django.contrib.auth.signals import user_login_failed, user_logged_in, user_logged_out
from django.contrib import messages
from django.dispatch import receiver
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.views.decorators.cache import never_cache

from .models import User, Form, SubForm_historia_personal, SubForm_antecedentes_g_o, SubForm_historia_familiar, \
    Clinic, Patient, Identidad_etnica, Prueba_genetica, Parentesco
from .forms import RegistrationForm, SubForm_historia_personal_Form, SubForm_antecedentes_g_o_Form, \
    SubForm_historia_familiar_Form

from .Clients import ClientFactory

@login_required
def index(request):
    return redirect('/patients/')

@receiver(user_login_failed)
def user_login_failed_callback(sender, credentials, **kwargs):
    print("login failed", sender)
    message = "Login fallido con credenciales: {}".format(credentials)
    return HttpResponse(status=412, content=message)


#client = ClientFactory.get_client(request)


def error_page(request, status, message):
    return render(request, 'index/error.html', {'message': message, 'status': status}, status=status)


def registration(request):

    if not request.user.is_authenticated:
        if request.method == 'POST':
            form = RegistrationForm(request.POST)

            if form.is_valid():
                print("Creando cuenta...")

                if User.objects.filter(email=request.POST['correo_electronico']):
                    print("Correo ya existe")
                    return redirect('/patients/')

                new_user = User.objects.create_user(request.POST['correo_electronico'], request.POST['correo_electronico'], request.POST['contrasena'])
                new_user.firstname = request.POST['nombre']
                new_user.save()

                new_user.profile.clinic = Clinic.objects.filter(pk=int(request.POST['clinica'])).get()

                rol = request.POST['rol']
                if rol == '0':
                    grupo = Group.objects.get(name='asistente')
                    print("Rol seleccionado: asistente")

                elif rol == '1':
                    grupo = Group.objects.get(name='medico')
                    print("Rol seleccionado: medico")

                else:
                    grupo = Group.objects.get(name='admin')
                    print("Rol seleccionado: admin")
                    new_user.is_staff = True
                    new_user.is_superuser = True

                grupo.user_set.add(new_user)
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
            form = RegistrationForm()

            context = {'form': form}
            return render(request, 'index/register.html', context)

    else:
        return redirect('/patients/')


@login_required
def pacientes(request):

    if request.method == 'GET':
        list_patients_db = Patient.objects.all().values()
        list_patients = []
        date = datetime.today().strftime("%d/%m/%y")

        for patient in list_patients_db:
            form_list = list(Form.objects.filter(id_patient=patient['id_patient']).exclude(submitted_at=None).exclude(habilitado=False).order_by('submitted_at').values())
            quantity_form = len(form_list)

            if quantity_form != 0:
                print("ultimo ", form_list[0], "\n")
                print("ultimo ", form_list[-1], "\n")

            patient_dict = {}

            patient_dict['id'] = patient['id_patient']
            if quantity_form != 0:
                patient_dict['first_date'] = form_list[0]['submitted_at'].strftime("%d/%m/%y %H:%M:%S")
                patient_dict['last_date'] = form_list[-1]['submitted_at'].strftime("%d/%m/%y %H:%M:%S")

            patient_dict['form_quantity'] = quantity_form

            list_patients += [patient_dict]

        context = {'username': request.user.username, 'user_id': request.user.pk, 'current_date': date, 'list_patients' : list_patients}
        return render(request, 'index/pacientes.html', context)



@login_required
def lista_formularios(request):
    print(request)
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
                if form['submitted_at']:
                    form_dict['date_created'] = form['submitted_at'].strftime("%d/%m/%y %H:%M:%S")
                form_dict['state_form'] = estado

                list_forms += [form_dict]

        context = {'patient_id':patient.id_patient,
                   'patient_name':patient.name ,
                   'username': request.user.username,
                   'user_id': request.user.pk,
                   'current_date': date,
                    'list_forms': list_forms,
                    'id_patient':patient.id_patient}

        return render(request, 'index/formularios.html', context)







@login_required
def deshabilitar_formulario(request):
    if is_roles(request.user, ["admin", "medico"]):
        form = Form.objects.get(id_form=request.GET['id_form'])

        form.habilitado = False;
        form.save()

        return redirect('/forms/?id_patient='+request.GET['id_patient'])

    else:
        return error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')

@login_required
def agregar_formulario(request):
    if is_roles(request.user, ["admin", "medico"]):
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
        return error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')

@login_required
@never_cache
def formulario(request):

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


@login_required
def guardar_subform_personal_Form(request):
    if is_roles(request.user, ["admin", "medico"]):
        if request.method == 'POST':

            subform_Form = SubForm_historia_personal_Form(request.POST)

            if subform_Form.is_valid():
                print("Guardando cambios personal...")

                form = Form.objects.get(id_form=request.GET['id_form'])

                subform = form.subform_hist_per

                subform.nombre = subform_Form.cleaned_data.get("nombre")
                subform.clinic = Clinic.objects.filter(pk=int(subform_Form.cleaned_data.get("hospital"))).get()
                subform.cedula = subform_Form.cleaned_data.get("cedula")
                subform.fecha_de_nacimiento = subform_Form.cleaned_data.get("fecha_nacimiento")
                subform.nacionalidad = subform_Form.cleaned_data.get("nacionalidad")
                subform.identidad_etnica = Identidad_etnica.objects.filter(pk=int(subform_Form.cleaned_data.get("identidad_etnica"))).get()
                subform.identidad_etnica_otro = subform_Form.cleaned_data.get("otra_identidad")
                subform.peso = subform_Form.cleaned_data.get("peso_kg")
                subform.talla = subform_Form.cleaned_data.get("talla_m")
                subform.imc = subform_Form.cleaned_data.get("imc")
                subform.fuma = subform_Form.cleaned_data.get("fumador")
                subform.fuma_edad = subform_Form.cleaned_data.get("edad_fumo")
                subform.fuma_actualmente = subform_Form.cleaned_data.get("fuma_actuamente")
                subform.fuma_cuanto = subform_Form.cleaned_data.get("tiempo_fumando")
                subform.bebidas = subform_Form.cleaned_data.get("bebe_alcohol")
                subform.bebidas_cuanto = subform_Form.cleaned_data.get("frecuencia")
                subform.bebidas_cuanto_otro = subform_Form.cleaned_data.get("bebe_frecuencia")
                subform.actividad_fisica = subform_Form.cleaned_data.get("actividades_fisicas")
                subform.actividad_fisica_cuanto = subform_Form.cleaned_data.get("minutos_actividad_fisica")
                subform.consume_alimentos_con_grasa = subform_Form.cleaned_data.get("alimentos_con_grasa")
                subform.consume_veg_frut_gram = subform_Form.cleaned_data.get("consume_vegetales_frts_grns")
                subform.diabetes = subform_Form.cleaned_data.get("diabetes")
                subform.toma_medicamento_tamoxifeno = subform_Form.cleaned_data.get("toma_tamoxifeno")
                subform.cuanto_tamoxifeno = subform_Form.cleaned_data.get("cuanto_tiempo_tamoxifeno")
                subform.toma_medicamento_anastrozol = subform_Form.cleaned_data.get("toma_anastrozol")
                subform.cuanto_anastrozol = subform_Form.cleaned_data.get("cuanto_tiempo_anastrozol")
                subform.toma_medicamento_metformina = subform_Form.cleaned_data.get("toma_metformina")
                subform.cuanto_metformina = subform_Form.cleaned_data.get("cuanto_tiempo_metformina")
                subform.toma_medicamento_bifosfonatos = subform_Form.cleaned_data.get("toma_bifosfonatos")
                subform.cuanto_bifosfonatos = subform_Form.cleaned_data.get("cuanto_tiempo_bisfofonatos")
                subform.toma_medicamento_aspirina = subform_Form.cleaned_data.get("toma_aspirinas")
                subform.cuanto_aspirina = subform_Form.cleaned_data.get("cuanto_tiempo_aspirinas")
                subform.radiacion = subform_Form.cleaned_data.get("tratamiento_torax")

                subform.save()
                print("Cambios personal guardados")

            else:
                print(subform_Form.errors)
                return error_page(request, 400, 'Hubo un fallo en el request.')

            return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])
    else:
        return error_page(request, 400, 'Usuario no tiene permisos para acceder a la pagina.')

@login_required
def guardar_subForm_antecedentes_g_o(request):

    if is_roles(request.user, ["admin", "medico"]):
        if request.method == 'POST':

            subform_Form = SubForm_antecedentes_g_o_Form(request.POST)

            if subform_Form.is_valid():
                print("Guardando cambios antecedentes...")

                form = Form.objects.get(id_form=request.GET['id_form'])
                subform = form.subform_ant_g_o

                subform.manopausa_aplica = subform_Form.cleaned_data.get("menopausia")
                subform.edad_menstruacion = subform_Form.cleaned_data.get("edad_menstruacion")
                subform.edad_manopausa = subform_Form.cleaned_data.get("edad_menopausaia")

                subform.parto_cantidad = subform_Form.cleaned_data.get("cantidad_partos")
                if subform_Form.cleaned_data.get("cantidad_partos"):
                    if subform_Form.cleaned_data.get("cantidad_partos") == '0':
                        subform.parto_aplica = False
                    else:
                        subform.parto_aplica = True

                subform.edad_ult_hijo = subform_Form.cleaned_data.get("edad_ultimo_hijo")

                subform.lactancia_aplica = subform_Form.cleaned_data.get("lactancia_ult_hijo")

                subform.lactancia_tiempo = subform_Form.cleaned_data.get("tiempo_lactancia")

                subform.anticonceptivos_aplica = subform_Form.cleaned_data.get("anticonceptivos_orales")
                subform.anticonceptivos_cuanto = subform_Form.cleaned_data.get("tiempo_tomo")
                subform.anticonceptivos_ult_vez = subform_Form.cleaned_data.get("ultima_vez_uso")


                subform.terapia_hormonal_aplica = subform_Form.cleaned_data.get("terapia_hormonal")

                subform.terapia = subform_Form.cleaned_data.get("tipo_terapia")
                subform.cuanto_tiempo_terapia = subform_Form.cleaned_data.get("tiempo_uso")


                subform.biopsia_aplica = subform_Form.cleaned_data.get("biopsia_mama")
                subform.biopsia_cuantas = subform_Form.cleaned_data.get("numero_biopsia")
                subform.biopsia_resultado = subform_Form.cleaned_data.get("resultado")

                subform.save()
                print("Cambios antecedentes guardados")

            else:
                print(subform_Form.errors)
                return error_page(request, 400, 'Hubo un fallo en el request.')

            return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])

    else:
        return error_page(request, 400, 'Usuario no tiene permisos para acceder a la pagina.')


@login_required
def guardar_subForm_historia_familiar(request):
    if is_roles(request.user, ["admin", "medico"]):
        if request.method == 'POST':

            subform_Form = SubForm_historia_familiar_Form(request.POST)

            if subform_Form.is_valid():
                print("Guardando historia familiar...")

                form = Form.objects.get(id_form=request.GET['id_form'])
                subform = form.subform_hist_fam

                subform.prueba_genetica = subform_Form.cleaned_data.get("pruebas_geneticas")

                subform.prueba_genetica_resultado.clear()
                for element in subform_Form.cleaned_data.get('resultado'):
                    subform.prueba_genetica_resultado.add(element)

                subform.prueba_genetica_otro = subform_Form.cleaned_data.get("otro_resultado")
                subform.familiares_mama = subform_Form.cleaned_data.get("familiares")

                subform.parentesco.clear()
                for element in subform_Form.cleaned_data.get('parentesco'):
                    subform.parentesco.add(element)

                subform.familiares_cancer = subform_Form.cleaned_data.get("familiares_otro")

                subform.familiares_cancer_tipo = subform_Form.cleaned_data.get("tipo")
                subform.familiares_cancer_parentesco = subform_Form.cleaned_data.get("parentesco_tipo")


                subform.save()


                print("Cambios historia guardados")


            else:
                print(subform_Form.errors)
                return error_page(request, 400, 'Hubo un fallo en el request.')

            return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])

    else:
        return error_page(request, 400, 'Usuario no tiene permisos para acceder a la pagina.')



def is_roles(user, roles):
    for role in roles:
        if user.groups.filter(name=role).exists():
            return True
    return False

def linea_de_tiempo(request):
    render(request, 'index/pagina.html')

def reportes_clinicos(request):
    render(request, 'index/pagina.html')

def informacion(request):
    render(request, 'index/pagina.html')
