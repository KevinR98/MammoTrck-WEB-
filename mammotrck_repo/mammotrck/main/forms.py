from datetime import datetime

from django import forms
from django.db import connection
from django.utils.safestring import mark_safe

from .models import *


ROLES = [('0', 'Asistente'), ('1', 'Médico'), ('2', 'Administrador')]


class SubForm_historia_personal_Form(forms.ModelForm):

    # NOMBRES deben ser los mismos que el modelo
    class Meta:
        model = SubForm_historia_personal
        fields = ['clinic', 'nombre', 'cedula', 'nacionalidad', 'fecha_de_nacimiento', 'identidad_etnica', 'identidad_etnica_otro', 'peso', 'talla',
                  'imc', 'fuma', 'fuma_edad', 'fuma_actualmente', 'fuma_cuanto', 'bebidas', 'bebidas_cuanto', 'bebidas_cuanto_otro', 'actividad_fisica', 'actividad_fisica_cuanto',
                  'consume_alimentos_con_grasa', 'consume_veg_frut_gram', 'diabetes', 'toma_medicamento_tamoxifeno', 'cuanto_tamoxifeno', 'toma_medicamento_anastrozol', 'cuanto_anastrozol',
                  'toma_medicamento_metformina', 'cuanto_metformina', 'toma_medicamento_bifosfonatos', 'cuanto_bifosfonatos', 'toma_medicamento_aspirina', 'cuanto_aspirina', 'tratamiento_torax']

        widgets = {
            'clinic': forms.Select(attrs={'class': 'form-control', 'id': 'inp_hospital', 'name': 'hospital'}),
            'nombre': forms.TextInput(attrs={'type':'text', 'class': 'form-control', 'id':'inp_nombre', 'name':'nombre', 'aria-describedby':'inp_nombre_help','placeholder': ''}) ,
            'cedula': forms.TextInput(attrs={'type':'text', 'class': 'form-control', 'id':'inp_cedula','name':'cedula', 'aria-describedby':'inp_cedula_help','placeholder': ''}),
            'fecha_de_nacimiento': forms.DateInput(attrs={'type': 'date', 'class': 'form-control', 'id': 'inp_fecha_nacimiento','name': 'fecha_nacimiento', 'aria-describedby': 'inp_fecha_nacimiento_help','placeholder': ''}),
            'nacionalidad': forms.Select(attrs={'class': 'form-control', 'id': 'inp_nacionalidad', 'name':'nacionalidad'}),
            'identidad_etnica': forms.Select(attrs={'class': 'form-control', 'id': 'inp_etnia', 'name':'etnia'}),
            'identidad_etnica_otro': forms.TextInput(attrs={'type':'text', 'class': 'form-control', 'id':'inp_otra_identidad','name':'otra_identidad', 'aria-describedby':'inp_otra_identidad_help','placeholder': ''}),
            'peso': forms.TextInput(attrs={'type':'number', 'class': 'form-control', 'id':'inp_peso','name':'peso', 'aria-describedby':'inp_peso_help','placeholder': ''}),
            'talla': forms.TextInput(attrs={'type':'number', 'class': 'form-control', 'id':'inp_talla', 'name':'talla', 'aria-describedby':'inp_talla_help', 'placeholder': ''}),
            'imc': forms.TextInput(attrs={'type': 'number', 'step': 'any', 'class': 'form-control', 'id': 'inp_imc','name': 'imc', 'aria-describedby': 'inp_imc_help','placeholder': ''}),
            'fuma': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'fuma_edad': forms.TextInput(attrs={'type':'number', 'class': 'form-control', 'id':'inp_edad_fumado','name':'edad_fumado', 'aria-describedby':'inp_edad_fumado_help','placeholder': ''}),
            'fuma_actualmente': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'fuma_cuanto': forms.TextInput(attrs={'type':'text', 'class': 'form-control', 'id':'inp_tiempo_fumado','name':'tiempo_fumado', 'aria-describedby':'inp_tiempo_fumado_help','placeholder': ''}),
            'bebidas': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'bebidas_cuanto': forms.Select(attrs={'class': 'form-control', 'id': 'inp_frecuencia_bebe', 'name':'frecuencia_bebe'}),
            'bebidas_cuanto_otro': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id':'inp_otra_frecuencia','name': 'otra_frecuencia', 'aria-describedby':'inp_otra_frecuencia_help','placeholder': ''}),
            'actividad_fisica': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'actividad_fisica_cuanto': forms.TextInput(attrs={'type':'number', 'class': 'form-control', 'id': 'inp_minutos_actividad', 'name': 'minutos_actividad', 'aria-describedby':'inp_minutos_actividad_help','placeholder': ''}),
            'consume_alimentos_con_grasa': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'consume_veg_frut_gram': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'diabetes': forms.Select(attrs={'class': 'form-control', 'id': 'inp_diabetes','name':'diabetes'}),
            'toma_medicamento_tamoxifeno': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'cuanto_tamoxifeno': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_1_t','name': 'med_1_t', 'aria-describedby': 'inp_med_1_t_help','placeholder': ''}),
            'toma_medicamento_anastrozol': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'cuanto_anastrozol': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_2_t','name': 'med_2_t', 'aria-describedby': 'inp_med_2_t_help','placeholder': ''}),
            'toma_medicamento_metformina': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'cuanto_metformina': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_3_t','name': 'med_3_t', 'aria-describedby': 'inp_med_3_t_help','placeholder': ''}),
            'toma_medicamento_bifosfonatos': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'cuanto_bifosfonatos': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_4_t','name': 'med_4_t', 'aria-describedby': 'inp_med_4_t_help','placeholder': ''}),
            'toma_medicamento_aspirina': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'cuanto_aspirina': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_5_t','name': 'med_5_t', 'aria-describedby': 'inp_med_5_t_help','placeholder': ''}),
            'tratamiento_torax': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')])
        }


class SubForm_antecedentes_g_o_Form(forms.ModelForm):

    class Meta:
        model = SubForm_antecedentes_g_o
        fields = ['menopausia_aplica', 'edad_menstruacion', 'edad_menopausia', 'parto_aplica', 'parto_cantidad', 'edad_ult_hijo',
                  'lactancia_aplica', 'lactancia_tiempo', 'anticonceptivos_aplica', 'anticonceptivos_cuanto', 'anticonceptivos_ult_vez', 'terapia_hormonal_aplica',
                  'terapia', 'cuanto_tiempo_terapia', 'biopsia_aplica', 'biopsia_cuantas', 'biopsia_resultado']
        widgets = {
            'menopausia_aplica': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'edad_menstruacion': forms.TextInput(attrs={'type':'number', 'class': 'form-control', 'id':'inp_mens','name':'mens', 'aria-describedby':'inp_mens_help','placeholder': ''}),
            'edad_menopausia': forms.TextInput(attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_meno','name': 'meno', 'aria-describedby': 'inp_meno_help','placeholder': ''}),
            'parto_aplica': forms.HiddenInput(),
            'parto_cantidad': forms.TextInput(attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_partos','name': 'partos', 'aria-describedby': 'inp_partos_help','placeholder': ''}),
            'edad_ult_hijo': forms.TextInput(attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_edad_hijo','name': 'edad_hijo', 'aria-describedby': 'inp_edad_hijo_help','placeholder': ''}),
            'lactancia_aplica': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'lactancia_tiempo': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_lact','name': 'lact', 'aria-describedby': 'inp_lact_help','placeholder': ''}),
            'anticonceptivos_aplica': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'anticonceptivos_cuanto': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_anti_t','name': 'anti_t', 'aria-describedby': 'inp_anti_t_help','placeholder': ''}),
            'anticonceptivos_ult_vez' : forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_anti_u','name': 'anti_u', 'aria-describedby': 'inp_anti_u_help','placeholder': ''}),
            'terapia_hormonal_aplica': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'terapia': forms.Select(attrs={'class': 'form-control', 'id': 'inp_terapia_t', 'name':'terapia_t'}),
            'cuanto_tiempo_terapia': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_terapia_tiempo','name': 'terapia_tiempo', 'aria-describedby': 'inp_terapia_tiempo_help','placeholder': ''}),
            'biopsia_aplica': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'biopsia_cuantas': forms.TextInput(attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_biopsias','name': 'biopsias', 'aria-describedby': 'inp_biopsias_help','placeholder': ''}),
            'biopsia_resultado': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_resultado_b','name': 'resultado_b', 'aria-describedby': 'inp_resultado_b_help','placeholder': ''})
        }


class SubForm_historia_familiar_Form(forms.ModelForm):

    class Meta:
        model = SubForm_historia_familiar
        fields = ['prueba_genetica', 'prueba_genetica_resultado', 'prueba_genetica_otro', 'familiares_mama', 'parentesco',
                  'familiares_cancer', 'familiares_cancer_tipo', 'familiares_cancer_parentesco']

        widgets = {
            'prueba_genetica': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'prueba_genetica_resultado': forms.CheckboxSelectMultiple(),
            'prueba_genetica_otro': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_resultado_o','name': 'resultado_o', 'aria-describedby': 'inp_resultado_o_help','placeholder': ''}),
            'familiares_mama': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'parentesco': forms.CheckboxSelectMultiple(),
            'familiares_cancer': forms.RadioSelect(choices=[(True, 'Sí'), (False, 'No')]),
            'familiares_cancer_tipo': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_tipo_c','name': 'tipo_c', 'aria-describedby': 'inp_tipo_c_help','placeholder': ''}),
            'familiares_cancer_parentesco': forms.TextInput(attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_parentescoc','name': 'parentescoc', 'aria-describedby': 'inp_parentescoc_help','placeholder': ''})
    }



class RegistrationForm(forms.Form):

    def __init__(self, *args, **kwargs):
        super(RegistrationForm, self).__init__(*args, **kwargs)

        self.fields['clinica'].widget.choices = [(model.pk, model.name) for model in Clinic.objects.all()]


    nombre = forms.CharField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control style4', 'placeholder': 'Nombre', 'pattern' : '[A-Za-z ]+', 'title' : 'Ingrese letras solamente.', 'data-msg-required':'Este campo es requerido'}))
    apellido1 = forms.CharField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control style4', 'placeholder': 'Primer Apellido', 'pattern' : '[A-Za-z ]+', 'title' : 'Ingrese letras solamente.', 'data-msg-required':'Este campo es requerido'}))
    apellido2 = forms.CharField(required=False, max_length=40, widget=forms.TextInput(attrs={'class': 'form-control style4', 'placeholder': 'Segundo Apellido', 'pattern' : '[A-Za-z ]+', 'title' : 'Ingrese letras solamente.'}))
    correo_electronico = forms.EmailField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control',  'placeholder': 'Correo electrónico', 'type': 'email', 'id': 'email', 'data-msg-required':'Este campo es requerido', 'data-msg-email': 'Por favor ingrese un correo válido'}))
    contrasena = forms.CharField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Contraseña', 'type': 'password', 'id': 'password', 'data-msg-required':'Este campo es requerido'}))
    contrasena_confirmar = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'class': 'form-control', 'placeholder': 'Contraseña', 'type': 'password', 'id': 'password_confirm', "data-rule-equalto" : "#password", 'data-msg-required':'Este campo es requerido', 'data-msg-equalto' : 'Las contraseñas no coinciden'}))
    clinica = forms.CharField(widget=forms.Select(attrs={'class': 'custom-select style17', 'id': 'select1', 'data-msg-required':'Este campo es requerido'}))
    rol = forms.CharField(widget=forms.Select(attrs={'class': 'custom-select style17', 'id': 'select2', 'data-msg-required':'Este campo es requerido'}, choices=ROLES))


class ReportForm(forms.Form):
    def __init__(self, *args, **kwargs):
        super(ReportForm, self).__init__(*args, **kwargs)

    formulario = forms.CharField(required=True, widget=forms.Select(attrs={'class': 'form-control style112', 'id': 'inp_form', 'style': 'border-radius:10px'}))
    contenido = forms.CharField(required=True, max_length=500, widget=forms.Textarea(attrs={'class': 'form-control style109', 'id': 'contenido', 'style': 'height: 70%; border-radius:10px'}))
