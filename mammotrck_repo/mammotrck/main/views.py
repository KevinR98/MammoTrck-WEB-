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
from django.conf import settings
from django.views.decorators.cache import never_cache

from .models import User, Form, SubForm_historia_personal, SubForm_antecedentes_g_o, SubForm_historia_familiar, \
    Clinic, Patient, Identidad_etnica, Prueba_genetica, Parentesco, Report, Mamografia
from .forms import RegistrationForm, SubForm_historia_personal_Form, SubForm_antecedentes_g_o_Form, \
    SubForm_historia_familiar_Form, ReportForm

from .Clients import ClientFactory


def index(request):

    client = ClientFactory.get_client(request)

    return client.index(request)


@receiver(user_login_failed)
def user_login_failed_callback(sender, credentials, **kwargs):
    print("login failed", sender)
    message = "Login fallido con credenciales: {}".format(credentials)
    return HttpResponse(status=412, content=message)



def registration(request):

    client = ClientFactory.get_client(request)

    return client.registration(request)



def pacientes(request):

    client = ClientFactory.get_client(request)

    return client.pacientes(request)




def lista_formularios(request):

    client = ClientFactory.get_client(request)

    return client.lista_formularios(request)



def deshabilitar_formulario(request):
    client = ClientFactory.get_client(request)

    return client.deshabilitar_formulario(request)




def agregar_formulario(request):
    client = ClientFactory.get_client(request)

    return client.agregar_formulario(request)




def formulario(request):

    client = ClientFactory.get_client(request)

    return client.formulario(request)



def guardar_subform_personal_Form(request):
    client = ClientFactory.get_client(request)

    return client.guardar_subform_personal_Form(request)



def guardar_subForm_antecedentes_g_o(request):

    client = ClientFactory.get_client(request)

    return client.guardar_subForm_antecedentes_g_o(request)



def guardar_subForm_historia_familiar(request):
    client = ClientFactory.get_client(request)

    return client.guardar_subForm_historia_familiar(request)



def linea_de_tiempo(request):
    client = ClientFactory.get_client(request)

    return client.guardar_subForm_historia_familiar(request)




def reportes_clinicos(request):
    client = ClientFactory.get_client(request)

    return client.reportes_clinicos(request)


def agregar_reporte(request):
    client = ClientFactory.get_client(request)

    return client.agregar_reporte(request)


def editar_reporte(request):
    client = ClientFactory.get_client(request)

    return client.editar_reporte(request)


def borrar_reporte(request):
    client = ClientFactory.get_client(request)

    return client.borrar_reporte(request)



def lista_imagenes(request):

    client = ClientFactory.get_client(request)

    return client.lista_imagenes(request)


def guardar_imagenes(request):
    client = ClientFactory.get_client(request)

    return client.guardar_imagenes(request)



def borrar_imagenes(request):
    client = ClientFactory.get_client(request)

    return client.borrar_imagenes(request)





def informacion(request):
    render(request, 'index/pagina.html')
