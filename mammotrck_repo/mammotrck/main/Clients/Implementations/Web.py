import csv
import io
import json
import types
from datetime import datetime
import random

from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import user_passes_test, login_required
from django.core import serializers
from django.db.models import ManyToManyField
from django.utils.decorators import method_decorator

from django.contrib.auth.models import User, Group
from django.contrib.auth.signals import user_login_failed, user_logged_in, user_logged_out
from django.contrib import messages
from django.dispatch import receiver
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.views.decorators.cache import never_cache
from django.views import View

from ... import models
from ...models import User, Form, SubForm_historia_personal, SubForm_antecedentes_g_o, SubForm_historia_familiar, \
    Clinic, Patient, Identidad_etnica, Prueba_genetica, Parentesco, Report, Mamografia
from ...forms import RegistrationForm, SubForm_historia_personal_Form, SubForm_antecedentes_g_o_Form, \
    SubForm_historia_familiar_Form, ReportForm, ROLES, NATIONALITIES, FRECUENCIA_BEBE, DIABETES, TIPO_TERAPIA


class web_client(View):
    def __init__(self):
        self.name = "web"


    @method_decorator(login_required)
    def index(self, request):
        if request.method == 'GET':

            reporte = ReportForm()

            date = datetime.today().strftime("%d/%m/%y")

            context = {'username': request.user.username, 'user_id': request.user.pk, 'current_date': date, 'reporte_form': reporte}

            return render(request, 'index/index.html', context)


    def error_page(self, request, status, message):
        return render(request, 'index/error.html', {'message': message, 'status': status}, status=status)

    def is_roles(self, user, roles):
        for role in roles:
            if user.groups.filter(name=role).exists():
                return True
        return False



    def registration(self, request):

        if not request.user.is_authenticated:
            if request.method == 'POST':
                form = RegistrationForm(request.POST)

                if form.is_valid():
                    print("Creando cuenta...")

                    if User.objects.filter(email=request.POST['correo_electronico']):
                        print("Correo ya existe")
                        return redirect('/registration/')

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
                    return redirect('/')

                else:
                    print(form.errors)
                    return self.error_page(request, 400, 'Error en la información recibida.')

            if request.method == 'GET':
                form = RegistrationForm()

                context = {'form': form}
                return render(request, 'index/register.html', context)

        else:
            return redirect('/')


    @method_decorator(login_required)
    def pacientes(self, request):

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
            return render(request, 'index/components/component_pacientes.html', context)


    @method_decorator(login_required)
    def lista_formularios(self, request):

        if request.method == 'GET':
            list_forms_db = Form.objects.filter(id_patient=request.GET['id_patient']).values()
            patient = Patient.objects.get(id_patient=request.GET['id_patient'])
            date = datetime.today().strftime("%d/%m/%y")

            list_forms = []
            list_forms_unreported = ""
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

                    reporte = Report.objects.filter(formulario=form['id_form']).values()
                    if(not reporte):
                        list_forms_unreported += (str(form['id_form']) + ",")

            list_forms_unreported = list_forms_unreported[:-1]
            print(list_forms_unreported)

            context = {'patient_id':patient.id_patient,
                       'patient_name':patient.name ,
                       'username': request.user.username,
                       'user_id': request.user.pk,
                       'current_date': date,
                        'list_forms': list_forms,
                        'list_forms_unreported': list_forms_unreported}

            return render(request, 'index/components/component_formularios.html', context)


    @method_decorator(login_required)
    def deshabilitar_formulario(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
            form = Form.objects.get(id_form=request.GET['id_form'])

            form.habilitado = False;
            form.save()

            return redirect('/forms/?id_patient='+request.GET['id_patient'])

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')


    @method_decorator(login_required)
    def agregar_formulario(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
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
            return self.error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')


    @method_decorator(login_required)
    @method_decorator(never_cache)
    def formulario(self, request):

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

            """
            #Print fields of form
            a = json.loads(serializers.serialize('json', [form.subform_hist_per]))
            b = json.loads(serializers.serialize('json', [form.subform_hist_fam]))
            c = json.loads(serializers.serialize('json', [form.subform_ant_g_o]))
            lista = [('historia_personal' , a), ('historial_familiar', b), ('antecedentes_gineco_obstetricos', c)]
            for name, subform in lista:

                subform = subform[0].get('fields')
                for key in subform:
                    value = subform.get(key)
                    if isinstance(value, list):
                        if not len(value):
                            value = "_"
                        else:
                            temp = ""
                            for i in value:
                                temp += str(i) + "_"
                            value = temp

                    print(name, ',', key, ',', value)
            """

            context = {'patient_id': patient.id_patient,
                       'form_id': form.id_form,
                       'titulo_form': titulo_form,
                       'patient_name': patient.name,
                       'username': request.user.username,
                       'user_id': request.user.pk,
                       'current_date': date,
                       'subform_h': subform_hist_per,
                       'subform_a': subform_ant_g_o,
                       'subform_hf': subform_hist_fam}

            return render(request, 'index/components/component_formulario.html', context)

        if request.method == 'POST':
            request.POST['subform_h_filter']



    @method_decorator(login_required)
    def guardar_subform_personal_Form(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
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
                    return self.error_page(request, 400, 'Hubo un fallo en el request.')

                return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])
        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para acceder a la pagina.')


    @method_decorator(login_required)
    def guardar_subForm_antecedentes_g_o(self, request):

        if self.is_roles(request.user, ["admin", "medico"]):
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
                    return self.error_page(request, 400, 'Hubo un fallo en el request.')

                return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para acceder a la pagina.')


    @method_decorator(login_required)
    def guardar_subForm_historia_familiar(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
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
                    return self.error_page(request, 400, 'Hubo un fallo en el request.')

                return redirect('/form/?id_patient=' + request.GET['id_patient'] + '&id_form=' + request.GET['id_form'])

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para acceder a la pagina.')

    @method_decorator(login_required)
    def reportes_clinicos(self, request):
        if request.method == 'GET':
            list_forms_db = Form.objects.filter(id_patient=request.GET['id_patient']).values()
            patient = Patient.objects.get(id_patient=request.GET['id_patient'])
            date = datetime.today().strftime("%d/%m/%y")

            list_reports = []
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

                    reporte = Report.objects.filter(formulario=form['id_form']).values()
                    if(reporte):

                        user = User.objects.get(id=reporte[0]['user_id'])
                        reporte_dict = {}
                        reporte_dict['formulario_id'] = reporte[0]['formulario_id']
                        reporte_dict['contenido'] = reporte[0]['contenido']
                        reporte_dict['date'] = reporte[0]['updated_at'].strftime("%d/%m/%y %H:%M:%S")
                        reporte_dict['user'] = user.username
                        list_reports += [reporte_dict]


            context = {'patient_id':patient.id_patient,
                       'patient_name':patient.name ,
                       'username': request.user.username,
                       'user_id': request.user.pk,
                       'current_date': date,
                        'list_reports': list_reports}

            return render(request, 'index/components/component_reportes.html', context)


    @method_decorator(login_required)
    def agregar_reporte(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
            if request.method == 'POST':

                formulario = Form.objects.get(id_form=request.POST['formulario'])
                new_report = Report.objects.create(formulario=formulario , contenido=request.POST['contenido'], user=User.objects.get(username=request.user.username))


                new_report.save()

                return redirect('/')

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')

    @method_decorator(login_required)
    def editar_reporte(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
            if request.method == 'POST':

                formulario = Form.objects.get(id_form=request.POST['id_formulario'])
                reporte = Report.objects.get(formulario=formulario)

                reporte.contenido = request.POST['contenido']


                reporte.save()

                return redirect('/')

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')

    @method_decorator(login_required)
    def borrar_reporte(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
            if request.method == 'GET':

                formulario = Form.objects.get(id_form=request.GET['id_formulario'])
                reporte = Report.objects.get(formulario=formulario)

                reporte.delete()

                return redirect('/')

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')


    @method_decorator(login_required)
    @method_decorator(never_cache)
    def lista_imagenes(self, request):

        if request.method == 'GET':

            list_imagenes_db = Mamografia.objects.filter(form=request.GET['id_form']).values()
            list_imagenes = []
            for imagen in list_imagenes_db:
                temp = {}
                temp["url"] = imagen["url_imagen"]
                temp["id"] = imagen["id"]
                list_imagenes += [temp]


            context = {'form_id': request.GET['id_form'],
                       'username': request.user.username,
                       'user_id': request.user.pk,
                       'list_imagenes': list_imagenes
                       }

            return render(request, 'index/components/component_imagenes.html', context)



    @method_decorator(login_required)
    def guardar_imagenes(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
            if request.method == 'POST':

                files = request.FILES
                form = Form.objects.get(id_form=request.POST['drop_form_id'])

                for file in files:


                    steps = 0
                    exito = False
                    guardada = False

                    upload_name = datetime.today().strftime("%d_%m_%y_%H_%M_%S_%f")[:-2] + "_" + files[file].name

                    while steps < 5 and not exito:

                        try:

                            if guardada == False:
                                blob = settings.FIREBASE_BUCKET.blob(upload_name)
                                blob.upload_from_file(file_obj=files[file], content_type=files[file].content_type)
                                guardada = True

                            blob.make_public()
                            url = blob.public_url

                            new_mamografia = Mamografia(url_imagen=url, form=form, filename=upload_name)

                            new_mamografia.save()

                            exito = True

                        except:
                            steps += 1

                    if not exito:
                        return self.error_page(request, 500, "No se pudo establecer conexión con la base de datos para imágenes después de 5 intentos realizados")



                return redirect('/')

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')


    @method_decorator(login_required)
    def borrar_imagenes(self, request):
        if self.is_roles(request.user, ["admin", "medico"]):
            if request.method == 'GET':

                formulario = Form.objects.get(id_form=request.GET['id_formulario'])
                mamografia = Mamografia.objects.get(id=request.GET['id_imagen'])

                blob = settings.FIREBASE_BUCKET.delete_blob(mamografia.filename)


                mamografia.delete()

                return redirect('/')

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')


    @method_decorator(login_required)
    def linea_de_tiempo(self, request):
        if request.method == 'GET':
            patient = Patient.objects.get(id_patient=request.GET['id_patient'])
            date = datetime.today().strftime("%d/%m/%y")

            context = {'patient_id':patient.id_patient,
                       'patient_name':patient.name,
                       'username': request.user.username,
                       'user_id': request.user.pk,
                       'current_date': date}


            if 'fecha_inicio' in request.GET and 'fecha_fin' in request.GET:
                date_start = datetime.strptime(request.GET['fecha_inicio'], '%Y-%m-%d')
                date_end = datetime.strptime(request.GET['fecha_fin'], '%Y-%m-%d')

                context_aux = {'changes': []}
                forms = Form.objects.exclude(submitted_at=None).filter(id_patient=request.GET['id_patient'], submitted_at__range=[date_start, date_end]).order_by('-submitted_at')
                forms = list(forms)

                if len(forms) == 0:
                    context.update({'no_findings': True})
                else:
                    i = 0
                    while i < len(forms)-1:
                        form_act = forms[i]
                        form_next = forms[i+1]
                        print("anterior: ", form_act.submitted_at, "siguiente: ", form_next.submitted_at)

                        subform_fam = (form_act.subform_hist_fam, form_next.subform_hist_fam)
                        subform_ant = (form_act.subform_ant_g_o, form_next.subform_ant_g_o)
                        subform_per = (form_act.subform_hist_per, form_next.subform_hist_per)

                        subforms = [('subf_form_C', subform_fam), ('subf_form_B', subform_ant), ('subf_form_A', subform_per)]
                        ignore = ['id', 'pk', 'created_at', 'updated_at', 'form']
                        fecha = form_act.submitted_at
                        fecha = fecha.strftime("%d/%m/%y")
                        form_dict = {
                                'id_form': form_act.id_form,
                                'date_submitted': fecha,
                                'first': False,
                                'subf_form_A': {},
                                'subf_form_B': {},
                                'subf_form_C': {},
                        }

                        for subform_key, subform in subforms:
                            values_list = json.loads(serializers.serialize('json', subform))

                            fields_ant = values_list[0].get('fields')
                            fields_sig = values_list[1].get('fields')

                            changes = []
                            for key in fields_ant:
                                if key not in ignore:
                                    elem_a = fields_ant.get(key)
                                    elem_b = fields_sig.get(key)

                                    if(elem_a != elem_b):
                                        elem_a = get_values_fk(key, elem_a)
                                        elem_b = get_values_fk(key, elem_b)

                                        changes.append({
                                            'campo': key,
                                            'ant': elem_b,
                                            'sig': elem_a,
                                            'ult': False
                                        })
                            if(len(changes) > 0):
                                changes[-1]['ult'] = True
                            form_dict[subform_key] = {
                                'num_changes': len(changes),
                                'changes': changes
                            }
                        context_aux['changes'].append(form_dict)

                        i += 1


                    context_aux['changes'].append({
                                'id_form': forms[-1].id_form,
                                'date_submitted': forms[-1].submitted_at,
                                'first': True,
                                'subf_form_A': {
                                    'num_changes': 0,
                                    'changes': {}
                                },
                                'subf_form_B': {
                                    'num_changes': 0,
                                    'changes': {}
                                },
                                'subf_form_C': {
                                    'num_changes': 0,
                                    'changes': {}
                                }
                        })

            context.update(context_aux)
            print(context_aux['changes'])
            return render(request, 'index/components/component_timeline.html', context)


    def load_file(self, request):
        if self.is_roles(request.user, ["admin", "medico", "asistente"]):
            if request.method == 'POST':
                print("leyendo archivo...")

                files = request.FILES
                for file in files:
                    file = files[file]

                    data = self.load_csv(file)
                    patient_id = Patient.objects.get(id_patient=request.POST['drop_patient_id'])

                    if 'id_form' in data['form']:
                        form_id = data['form']['id_form']

                        if not Form.objects.filter(id_form=form_id).exists():
                            form_model = Form.objects.create(id_form=form_id, id_patient=patient_id)
                            form_model.habilitado = True
                            form_model.completed = True
                            form_model.submitted_at = datetime.today().strftime("%Y-%m-%d")
                            form_model.save()

                        else:
                            form_model = Form.objects.get(id_form=form_id)
                            form_model.habilitado = True
                            form_model.save()

                        subform_fam = form_model.subform_hist_fam
                        subform_ant = form_model.subform_ant_g_o
                        subform_per = form_model.subform_hist_per

                        subform_dict = {
                            'form': form_model,
                            'historia_personal': subform_per,
                            'historial_familiar': subform_fam,
                            'antecedentes_gineco_obstetricos': subform_ant
                        }

                        try:
                            for subform in data:
                                for attr in data[subform]:
                                    value = data[subform][attr]

                                    if subform_dict[subform]._meta.get_field(attr).__class__ == ManyToManyField:
                                        getattr(subform_dict[subform], attr).set(value)
                                    else:
                                        setattr(subform_dict[subform], attr, value)

                            subform_fam.save()
                            subform_ant.save()
                            subform_per.save()
                            print("Form %s guardado" %(form_id))

                        except Exception as e:
                            print("Error leyendo el csv \n", str(e))
                            return HttpResponse(status=400, content='Error leyendo el csv.')

            return redirect('/')

        else:
            return self.error_page(request, 400, 'Usuario no tiene permisos para esta funcionalidad.')


    def load_csv(self, file):

        data = {
            'form': {},
            'historia_personal': {},
            'historial_familiar': {},
            'antecedentes_gineco_obstetricos': {}
        }

        dropdown_fk = ['clinic', 'identidad_etnica']
        decoded_file = io.StringIO(file.read().decode('utf-8'))
        reader = csv.DictReader(decoded_file)
        for row in reader:
            subform = row['name_subform']
            attr = row['name_field']
            value = row['value']

            if '_' in value:
                if value in ('None_', '_', ''):
                    value = []
                else:
                    value = value.split("_")[:-1]

            else:
                if attr in dropdown_fk:
                    attr = attr + '_id'

                if value in ('None', ""):
                    value = None

            data[subform][attr] = value

        return data


def get_values_fk(field, element):
    if element == None or element == []:
        element = "Campo Vacío"

    elif isinstance(element, bool):
        element = "Sí" if element else "No"

    elif field == 'nacionalidad':
        element = NATIONALITIES[int(element)]

    elif field == 'bebidas_cuanto':
        print(element)
        element = FRECUENCIA_BEBE[int(element)][1]

    elif field == 'diabetes':
        element = DIABETES[int(element)][1]

    elif field == 'terapia':
        element = TIPO_TERAPIA[int(element)][1]

    elif field == 'clinic':
        element = Clinic.objects.get(pk=element).name

    elif field == 'identidad_etnica':
        element = Identidad_etnica.objects.get(pk=element).identidad

    elif field == 'prueba_genetica_resultado':
        str_element = ""

        for pk in element:
            str_element += str(Prueba_genetica.objects.get(pk=pk).tipo_prueba_genetica) + ","

        element = str_element[:-1]

    elif field == 'parentesco':
        str_element = ""

        for pk in element:
            str_element += str(Parentesco.objects.get(pk=pk).tipo_parentesco) + ","
        element = str_element[:-1]

    return element