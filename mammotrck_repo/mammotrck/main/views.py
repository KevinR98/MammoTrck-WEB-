from datetime import datetime
import random

from django.contrib.auth import authenticate, login
from django.contrib.auth.signals import user_login_failed, user_logged_in, user_logged_out
from django.contrib import messages
from django.dispatch import receiver
from django.shortcuts import render, redirect
from django.http import HttpResponse

from .models import User, Form, SubForm_historia_personal, SubForm_antecedentes_g_o, SubForm_historia_familiar, \
    Clinic, Patient
from .forms import RegistrationForm

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
                form_dict = {}
                form_dict['id'] = form['id_form']
                form_dict['date_created'] = form['created_at'].strftime("%d/%m/%y %H:%M:%S")
                form_dict['sate'] = form['habilitado']

                list_forms += [form_dict]


            context = {'patient_id':request.GET['id_patient'], 'patient_name':patient.name , 'username': request.user.username, 'user_id': request.user.pk, 'current_date': date,
                        'list_forms': list_forms}

            return render(request, 'index/formularios.html', context)


    else:
        return error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')


def deshabilitar_formulario(request):
    if request.user.is_authenticated:
        if request.POST.get("id_form") and request.POST.get("enabled"):

            id = request.POST['id_form']
            form = Form.objects.get(pk=id)


            enabled = request.POST['enabled'] #Verificar que devuelva booleano
            form.habilitado = enabled
            form.save()

            return redirect('/forms/')
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
        new_form.save()

        return redirect('/forms/?id_patient='+request.GET['id_patient'])

    else:
        error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')

def formulario(request):
    if request.user.is_authenticated:
        if request.method == 'GET':
            list_forms = Form.objects.filter(
                id_pacient=request.GET['id_pacient'])  # Pasar por parametro id del paciente

            context = {'pacients': list_forms}
            return render(request, 'index/forms.html', context)

    else:
        error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')


def linea_de_tiempo(request):
    render(request, 'index/pagina.html')


def reportes_clinicos(request):
    render(request, 'index/pagina.html')

def informacion(request):
    render(request, 'index/pagina.html')

