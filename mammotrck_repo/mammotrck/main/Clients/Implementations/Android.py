from django.http import HttpResponse, JsonResponse
from django.middleware.csrf import get_token
from django.shortcuts import render, redirect, get_object_or_404
from django.db.models.query import QuerySet
from django.forms.models import model_to_dict
from io import BytesIO
#import requests
import json


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


    def __get_for_android(self, request, context=None):

        token = get_token(request)

        if context is not None:

            # Itera sobre todo el contexto, cuando hay querysets los convierta a listas para poder serializar
            try:

                for key in context:
                    if isinstance(context[key], QuerySet):
                        context[key] = list(context[key].values())
                    elif isinstance(context[key], Model):
                        context[key] = model_to_dict(context[key])

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
        paciente_id = request.POST['patient_id']
        formulario_id = request.POST['form_id']
        mensaje = ""
        exito = True

        paciente = Patient.objects.filter(id_patient=paciente_id)
        if(not paciente):
            mensaje = "La paciente no existe en el sistema"
            exito = False

        formulario = Form.objects.filter(id_form=formulario, id_patient=paciente_id)


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

            exito, mensaje = authenticate(request)x 12 y 29    70  70

            if(not exito):
                return self.handle_error(request, status=403, message=mensaje)

            context = {
                'exito' : 'true'
            }
            return self.__get_for_android(request, context)

        else:

            return self.handle_error(request, status=400, message="Request inválido")

    
