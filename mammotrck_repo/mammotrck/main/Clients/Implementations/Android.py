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
from django.template.context_processors import csrf

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

        if(request.method == 'GET'):
            csrf_tok = csrf(request)
            csrf_token =  str(csrf_tok.get('csrf_token'))

            context = {
                'csrf_token' : csrf_token
            }
            return self.__get_for_android(request, context)

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

            clinicas = [(model.pk, model.name) for model in Clinic.objects.all()]
            identidades = [(model.pk, model.identidad) for model in Identidad_etnica.objects.all()]
            pruebas_geneticas = [(model.pk, model.tipo_prueba_genetica) for model in Prueba_genetica.objects.all()]
            parentescos = [(model.pk, model.tipo_parentesco) for model in Parentesco.objects.all()]


            context = {'patient_id': patient.id_patient,
                       'form_id': form.id_form,
                       'patient_name': patient.name,
                       'subform_h': subform_hist_per,
                       'subform_a': subform_ant_g_o,
                       'subform_hf': subform_hist_fam,
                       'clinicas': clinicas,
                       'identidades': identidades,
                       'pruebas_geneticas': pruebas_geneticas,
                       'parentescos': parentescos}

            return self.__get_for_android(request, context)




    def guardar_subform_personal_Form(self, request):

        exito, mensaje = self.authenticate(request)

        if(not exito):
            return self.handle_error(request, status=403, message=mensaje)

        if request.method == 'POST':

            subform_Form = request.POST['subform_h']

            print("Guardando cambios personal...")

            form = Form.objects.get(id_form=request.GET['id_form'])

            subform = SubForm_historia_personal.objects.get(id=form.subform_hist_per.pk)

            subform.nombre = subform_Form['nombre']
            subform.clinic = Clinic.objects.filter(pk=subform_Form['clinic']).get()
            subform.cedula = subform_Form['cedula']
            subform.fecha_de_nacimiento = subform_Form['fecha_de_nacimiento']
            subform.nacionalidad = subform_Form["nacionalidad"]
            subform.identidad_etnica = Identidad_etnica.objects.filter(pk=subform_Form["identidad_etnica"]).get()
            subform.identidad_etnica_otro = subform_Form["identidad_etnica_otro"]
            subform.peso = subform_Form["peso"]
            subform.talla = subform_Form["talla"]
            subform.imc = subform_Form["imc"]
            subform.fuma = subform_Form["fuma"]
            subform.fuma_edad = subform_Form["fuma_edad"]
            subform.fuma_actualmente = subform_Form["fuma_actualmente"]
            subform.fuma_cuanto = subform_Form["fuma_cuanto"]
            subform.bebidas = subform_Form["bebidas"]
            subform.bebidas_cuanto = subform_Form["bebidas_cuanto"]
            subform.bebidas_cuanto_otro = subform_Form["bebidas_cuanto_otro"]
            subform.actividad_fisica = subform_Form["actividad_fisica"]
            subform.actividad_fisica_cuanto = subform_Form_Form["actividad_fisica_cuanto"]
            subform.consume_alimentos_con_grasa = subform_Form["consume_alimentos_con_grasa"]
            subform.consume_veg_frut_gram = subform_Form_Form["consume_veg_frut_gram"]
            subform.diabetes = subform_Form["diabetes"]
            subform.toma_medicamento_tamoxifeno = subform_Form["toma_medicamento_tamoxifeno"]
            subform.cuanto_tamoxifeno = subform_Form["cuanto_tamoxifeno"]
            subform.toma_medicamento_anastrozol = subform_Form["toma_medicamento_anastrozol"]
            subform.cuanto_anastrozol = subform_Form["cuanto_anastrozol"]
            subform.toma_medicamento_metformina = subform_Form["toma_medicamento_metformina"]
            subform.cuanto_metformina = subform_Form["cuanto_metformina"]
            subform.toma_medicamento_bifosfonatos = subform_Form["toma_medicamento_bifosfonatos"]
            subform.cuanto_bifosfonatos = subform_Form["cuanto_bisfofonatos"]
            subform.toma_medicamento_aspirina = subform_Form["toma_medicamento_aspirinas"]
            subform.cuanto_aspirina = subform_Form["cuanto_aspirinas"]
            subform.radiacion = subform_Form["radiacion"]

            subform.save()
            print("Cambios personal guardados")



            context = {
                'exito' : 'true'
            }
            return self.__get_for_android(request, context)

        else:
            return self.handle_error(request, status=400, message="Request inválido")



    def guardar_subForm_antecedentes_g_o(self, request):

        exito, mensaje = self.authenticate(request)

        if(not exito):
            return self.handle_error(request, status=403, message=mensaje)

        if request.method == 'POST':

            subform_Form = request.POST['subform_a']


            print("Guardando cambios antecedentes...")

            form = Form.objects.get(id_form=request.GET['id_form'])
            subform = SubForm_antecedentes_g_o.objects.get(id=form.subform_ant_g_o.pk)

            subform.manopausa_aplica = subform_Form["manopausa_aplica"]
            subform.edad_menstruacion = subform_Form["edad_menstruacion"]
            subform.edad_manopausa = subform_Form["edad_manopausa"]

            subform.parto_cantidad = subform_Form["parto_cantidad"]
            subform.parto_aplica = subform_Form["parto_aplica"]


            subform.edad_ult_hijo = subform_Form["edad_ult_hijo"]

            subform.lactancia_aplica = subform_Form["lactancia_aplica"]

            subform.lactancia_tiempo = subform_Form["lactancia_tiempo"]

            subform.anticonceptivos_aplica = subform_Form["anticonceptivos_aplica"]
            subform.anticonceptivos_cuanto = subform_Form["anticonceptivos_cuanto"]
            subform.anticonceptivos_ult_vez = subform_Form["anticonceptivos_ult_vez"]


            subform.terapia_hormonal_aplica = subform_Form["terapia_hormonal_aplica"]

            subform.terapia = subform_Form["terapia"]
            subform.cuanto_tiempo_terapia = subform_Form["cuanto_tiempo_terapia"]


            subform.biopsia_aplica = subform_Form["biopsia_aplica"]
            subform.biopsia_cuantas = subform_Form["biopsia_cuantas"]
            subform.biopsia_resultado = subform_Form["biopsia_resultado"]

            subform.save()
            print("Cambios antecedentes guardados")



            context = {
                'exito' : 'true'
            }
            return self.__get_for_android(request, context)

        else:
            return self.handle_error(request, status=400, message="Request inválido")


    def guardar_subForm_historia_familiar(self, request):

        exito, mensaje = self.authenticate(request)

        if(not exito):
            return self.handle_error(request, status=403, message=mensaje)

        if request.method == 'POST':

            subform_Form = request.POST['subform_hf']


            print("Guardando historia familiar...")

            form = Form.objects.get(id_form=request.GET['id_form'])
            subform = SubForm_historia_familiar.objects.get(id=form.subform_hist_fam.pk)

            subform.prueba_genetica = subform_Form['prueba_genetica']

            subform.prueba_genetica_resultado = subform_Form['prueba_genetica_resultado']


            subform.prueba_genetica_otro = subform_Form['prueba_genetica_otro']
            subform.familiares_mama = subform_Form['familiares_mama']

            subform.parentesco = subform_Form['parentesco']


            subform.familiares_cancer = subform_Form['familiares_cancer']

            subform.familiares_cancer_tipo = subform_Form['familiares_cancer_tipo']
            subform.familiares_cancer_parentesco = subform_Form['familiares_cancer_parentesco']


            subform.save()


            print("Cambios historia guardados")



            context = {
                'exito' : 'true'
            }
            return self.__get_for_android(request, context)

        else:
            return self.handle_error(request, status=400, message="Request inválido")


    def agregar_formulario(self, request):

        exito, mensaje = self.authenticate(request)

        if(not exito):
            return self.handle_error(request, status=403, message=mensaje)

        if request.method == 'POST':
            date = datetime.today().strftime("%d/%m/%y")

            form = Form.objects.get(id_form=request.GET['id_form'])

            form.submitted_at = date
            form.completed = True

            form.save()

            context = {
                'exito' : 'true'
            }
            return self.__get_for_android(request, context)

        else:
            return self.handle_error(request, status=400, message="Request inválido")
