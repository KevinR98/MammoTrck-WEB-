from django.http import HttpResponse, JsonResponse
from django.middleware.csrf import get_token
from django.db.models import Model
from django.shortcuts import render, redirect, get_object_or_404
from django.db.models.query import QuerySet
from django.forms.models import model_to_dict
from io import BytesIO
from itertools import chain
#import requests
import json
from datetime import datetime
from django.views.decorators.cache import never_cache
from django.utils.decorators import method_decorator

from ...models import Form, SubForm_historia_personal, SubForm_antecedentes_g_o, SubForm_historia_familiar, \
    Clinic, Patient, Identidad_etnica, Prueba_genetica, Parentesco
from ...forms import SubForm_historia_personal_Form, SubForm_antecedentes_g_o_Form, \
    SubForm_historia_familiar_Form


class android_client:
    def __init__(self):
        self.name = "android"

    def handle_error(self, request, status, message):

        response = HttpResponse(json.dumps({'message': message}),
            content_type='application/json')
        response.status_code = status
        return response

    def to_dict(self, instance):
        opts = instance._meta
        data = {}
        for f in chain(opts.concrete_fields, opts.private_fields):
            data[f.name] = f.value_from_object(instance)
        for f in opts.many_to_many:
            data[f.name] = [i.id for i in f.value_from_object(instance)]
        return data


    def __get_for_android(self, request, context=None):

        token = get_token(request)

        if context is not None:

            # Itera sobre todo el contexto, cuando hay querysets los convierta a listas para poder serializar
            try:

                for key in context:
                    if isinstance(context[key], QuerySet):
                        context[key] = list(context[key].values())
                    elif isinstance(context[key], Model):
                        context[key] = self.to_dict(context[key])

                context["token"] = token
                print("Contexto en get_for_android: {}".format(context))

                try:
                    return JsonResponse(context, safe=False)
                except Exception as e:
                    print("Error respondiendo al request: {}".format(str(e)))
                    return HttpResponse(status=500)

            except Exception as e:

                print("Error casteando objetos del context: {}.".format(str(e)))
                return HttpResponse(status=500)

        else:

            return JsonResponse({'token' : token})

    def authenticate(self, request):
        paciente_id = ""
        formulario_id = ""
        mensaje = ""
        exito = True

        if(request.method == 'POST'):
            paciente_id = request.POST['id_patient']
            formulario_id = request.POST['id_form']

        else:
            paciente_id = request.GET['id_patient']
            formulario_id = request.GET['id_form']

        paciente = Patient.objects.get(id_patient=paciente_id)
        if(not paciente):
            mensaje = "La paciente no existe en el sistema"
            exito = False

        formulario = Form.objects.get(id_form=formulario_id, id_patient=paciente_id)


        if(not formulario):
            mensaje = "El formulario no existe en el sistema o no está asociado a la paciente"
            exito = False

        if(not formulario.habilitado):
            mensaje = "El formulario está deshabilitado"
            exito = False

        if(formulario.completed):
            mensaje = "El formulario ya fue registrado"
            exito = False

        return (exito, mensaje)



    def index(self, request):
        return self.login(request)

    def login(self, request):

        if(request.method == 'POST'):

            exito, mensaje = self.authenticate(request)

            if(not exito):
                return self.handle_error(request, status=403, message=mensaje)

            context = {
                'exito' : 'true'
            }
            return self.__get_for_android(request, context)

        else:

            return self.handle_error(request, status=400, message="Request inválido")

    @method_decorator(never_cache)
    def formulario(self, request):

        if request.method == 'GET':

            exito, mensaje = self.authenticate(request)

            if(not exito):
                return self.handle_error(request, status=403, message=mensaje)


            patient = Patient.objects.get(id_patient=request.GET['id_patient'])
            form = Form.objects.get(id_form=request.GET['id_form'])
            date = datetime.today().strftime("%d/%m/%y")



            subform_hist_per = SubForm_historia_personal.objects.get(id=form.subform_hist_per.pk)
            subform_ant_g_o = SubForm_antecedentes_g_o.objects.get(id=form.subform_ant_g_o.pk)
            subform_hist_fam = SubForm_historia_familiar.objects.get(id=form.subform_hist_fam.pk)


            context = {'patient_id': patient.id_patient,
                       'form_id': form.id_form,
                       'patient_name': patient.name,
                       'subform_h': subform_hist_per,
                       'subform_a': subform_ant_g_o,
                       'subform_hf': subform_hist_fam}

            return self.__get_for_android(request, context)
