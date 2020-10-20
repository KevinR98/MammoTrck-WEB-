from django.contrib.auth import user_login_failed, user_logged_in, user_logged_out, authenticate, login
from django.core.checks import messages
from django.dispatch import receiver
from django.shortcuts import render, redirect
from django.http import HttpResponse

from .models import User, Pacient, Form, SubForm_historia_personal, SubForm_antecedentes_g_o, SubForm_historia_familiar
from .forms import RegistrationForm

from .Clients import ClientFactory


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

@receiver(user_login_failed)
def user_login_failed_callback(sender, credentials, **kwargs):
    print(sender)
    message = "Login fallido con credenciales: {}".format(credentials)
    return HttpResponse(status=412, content=message)

@receiver(user_logged_in)
def user_login_in_callback(sender, credentials, **kwargs):
    print(sender)
    message = "Se logueo correctamente el usuario: {}".format(credentials)
    return HttpResponse(status=202, content=message)

@receiver(user_logged_out)
def user_login_out_callback(sender, credentials, **kwargs):
    print(sender)
    message = "Se deslogueo correctamente el usuario: {}".format(credentials)
    return HttpResponse(status=202, content=message)

#client = ClientFactory.get_client(request)


def error_page(request, status, message):
    return render(request, 'index/error.html', {'message': message}, status=status)


def registration(request):

    if not request.user.is_authenticated:
        if request.method == 'POST':
            form = RegistrationForm(request.POST)

            if form.is_valid():

                if User.objects.filter(email=request.POST['correo_electronico']):
                    messages.error(request, 'Correo asociado a una cuenta distinta.')
                    return render(request, 'index/registration.html', {'form' : RegistrationForm()})

                new_user = User(
                    username=request.POST['correo_electronico'],
                    email=request.POST['correo_electronico'],
                    name=request.POST['nombre']
                )

                new_user.set_password(request.POST['contrasena'])
                new_user.save()

                new_user.profile.clinic = request.POST['clinica']

                new_user.save()
                messages.INFO(request, 'Nuevo usuario agregado')

                user = authenticate(username=new_user.username, password=request.POST['contrasena'])
                login(request, user)

                return render(request, 'index/pacientes.html')

            else:
                return error_page(request, 400, 'Error en la información recibida.')

        if request.method == 'GET':
            form = RegistrationForm()
            context = {'form': form}
            return render(request, 'index/register.html', context)

    else:
        return error_page(request, 400, 'Ya existe un usuario logueado.')



def pacientes(request):

    if request.user.is_authenticated:
        if request.method == 'GET':
            list_pacients = Pacient.objects

            context = {'pacients' : list_pacients}
            return render(request, 'index/pacientes.html', context)

    else:
        error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')

    render(request, 'index/pacientes.html')



def lista_formularios(request):
    if request.user.is_authenticated:
        if request.method == 'GET':
            list_forms = Form.objects.filter(id_pacient=request.GET['id_pacient']) #Pasar por parametro id del paciente

            context = {'pacients' : list_forms}
            return render(request, 'index/forms.html', context)

    else:
        error_page(request, 400, 'Usuario no tienen permisos para acceder a la pagina.')


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
        new_subform_historia_familiar = SubForm_historia_familiar()
        new_subform_antecedentes = SubForm_antecedentes_g_o()
        new_subform_historia_personal = SubForm_historia_personal()

        new_subform_historia_familiar.save()
        new_subform_antecedentes.save()
        new_subform_historia_personal.save()

        new_form = Form(
            SubForm_historia_personal = new_subform_historia_personal.id,
            SubForm_antecedentes_g_o = new_subform_antecedentes.id,
            SubForm_historia_familiar = new_subform_historia_familiar.id
        )

        new_form.save()
        return redirect('/forms/')

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

