from django import forms
from .models import *


def get_roles():
    return [('0', 'Asistente'), ('1', 'Medico'), ('2', 'Administrador')]


class SubForm_historia_personal_Form(forms.Form):

    def __init__(self, *args,  **kwargs):
        if(kwargs.get('list_clinics')):
            self.clinics = kwargs.pop('list_clinics')
            super(SubForm_historia_personal_Form, self).__init__(*args, **kwargs)
            self.fields['hospital'].widget.choices = self.clinics
        else:
            super(SubForm_historia_personal_Form, self).__init__(*args, **kwargs)


    hospital = forms.CharField(
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_hospital', 'name': 'hospital'}, choices=get_roles()))

    fecha = forms.CharField(max_length=40, widget=forms.DateInput(
        attrs={'type':'date', 'class': 'form-control', 'id':'inp_fecha',
               'name':'fecha', 'aria-describedby':'inp_fecha_help',
               'placeholder': 'Enter Fecha'}))

    nombre = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_nombre',
               'name':'nombre', 'aria-describedby':'inp_nombre_help',
               'placeholder': 'Enter Nombre'}))

    cedula = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_cedula',
               'name':'cedula', 'aria-describedby':'inp_cedula_help',
               'placeholder': 'Enter Cédula'}))

    fecha_nacimiento = forms.CharField(max_length=40, widget=forms.DateInput(
        attrs={'type': 'date', 'class': 'form-control', 'id': 'inp_fecha_nacimiento',
               'name': 'fecha_nacimiento', 'aria-describedby': 'inp_fecha_nacimiento_help',
               'placeholder': 'Enter Fecha de nacimiento'}))

    nacionalidad = forms.CharField(
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_nacionalidad', 'name':'nacionalidad'}, choices=get_roles()))

    identidad_etnica = forms.CharField(
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_etnia', 'name':'etnia'}, choices=get_roles()))

    otra_identidad = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_otra_identidad',
               'name':'otra_identidad', 'aria-describedby':'inp_otra_identidad_help',
               'placeholder': 'Enter otra identidad étnica'}))

    peso_kg = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_peso',
               'name':'peso', 'aria-describedby':'inp_peso_help',
               'placeholder': 'Enter Peso (kg)'}))

    talla_m = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_talla',
               'name':'talla', 'aria-describedby':'inp_talla_help',
               'placeholder': 'Enter Talla (m)'}))

    imc = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_imc',
               'name': 'imc', 'aria-describedby': 'inp_imc_help',
               'placeholder': 'Enter IMC (kg/m2)'}))

    fumador = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))



    edad_fumo = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_edad_fumado',
               'name':'edad_fumado', 'aria-describedby':'inp_edad_fumado_help',
               'placeholder': 'Enter Edad que empezó a fumar'}))

    fuma_actuamente = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    tiempo_fumando = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_tiempo_fumado',
               'name':'tiempo_fumado', 'aria-describedby':'inp_tiempo_fumado_help',
               'placeholder': 'Enter Por cuánto tiempo ha fumado'}))

    bebe_alcohol = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))


    frecuencia = forms.CharField(
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_frecuencia_bebe', 'name':'frecuencia_bebe'},
                            choices=get_roles()))

    tiempo_fumando = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_otra_frecuencia',
               'name':'otra_frecuencia', 'aria-describedby':'inp_otra_frecuencia_help',
               'placeholder': 'Enter otra frecuencia de bebida'}))

    actividades_fisicas = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))


    minutos_actividad_fisica = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_minutos_actividad',
               'name':'minutos_actividad', 'aria-describedby':'inp_minutos_actividad_help',
               'placeholder': 'Enter Minutos por semana de actividad física'}))

    alimentos_con_grasa = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    consume_vegetales_frts_grns = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))


    diabetes = forms.CharField(
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_diabetes','name':'diabetes'},
                            choices=get_roles()))



    toma_tamoxifeno = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    cuanto_tiempo_tamoxifeno = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_1_t',
               'name': 'med_1_t', 'aria-describedby': 'inp_med_1_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    toma_anastrozol= forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    cuanto_tiempo_anastrozol = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_2_t',
               'name': 'med_2_t', 'aria-describedby': 'inp_med_2_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    toma_metformina= forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    cuanto_tiempo_metformina = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_3_t',
               'name': 'med_3_t', 'aria-describedby': 'inp_med_3_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    toma_bifosfonatos = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    cuanto_tiempo_bisfofonatos = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_4_t',
               'name': 'med_4_t', 'aria-describedby': 'inp_med_4_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    toma_aspirinas = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    cuanto_tiempo_aspirinas = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_5_t',
               'name': 'med_5_t', 'aria-describedby': 'inp_med_5_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    tratamiento_torax = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))


class SubForm_antecedentes_g_o_Form(forms.Form):


    edad_menstruacion = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_mens',
               'name':'mens', 'aria-describedby':'inp_mens_help',
               'placeholder': 'Enter edad primera menstruación'}))

    post_menopausia = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))


    edad_menopausaia = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_meno',
               'name': 'meno', 'aria-describedby': 'inp_meno_help',
               'placeholder': 'Enter edad primera menopaucia'}))

    cantidad_partos = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_partos',
               'name': 'partos', 'aria-describedby': 'inp_partos_help',
               'placeholder': 'Enter cantidad de partos'}))

    edad_ultimo_hijo = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_edad_hijo',
               'name': 'edad_hijo', 'aria-describedby': 'inp_edad_hijo_help',
               'placeholder': 'Enter edad último hijo'}))

    tiempo_lactancia = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_lact',
               'name': 'lact', 'aria-describedby': 'inp_lact_help',
               'placeholder': 'Enter tiempo lactancia'}))

    lactancia_ult_hijo = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    anticonceptivos_orales = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    tiempo_tomo = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_anti_t',
               'name': 'anti_t', 'aria-describedby': 'inp_anti_t_help',
               'placeholder': 'Enter tiempo que tomó los anticonceptivos'}))

    ultima_vez_uso = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_anti_u',
               'name': 'anti_u', 'aria-describedby': 'inp_anti_u_help',
               'placeholder': 'Enter última vez que los usó'}))

    terapia_hormonal = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    frecuencia = forms.CharField(
            widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_terapia_t', 'name':'terapia_t'},
                                choices=get_roles()))

    tiempo_uso = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_terapia_tiempo',
               'name': 'terapia_tiempo', 'aria-describedby': 'inp_terapia_tiempo_help',
               'placeholder': 'Enter tiempo de uso'}))

    biopsia_mama = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    tiempo_uso = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_biopsias',
               'name': 'biopsias', 'aria-describedby': 'inp_biopsias_help',
               'placeholder': 'Enter numero biopsias'}))

    resultado = forms.CharField(max_length=40, widget=forms.TextInput(
            attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_resultado_b',
                   'name': 'resultado_b', 'aria-describedby': 'inp_resultado_b_help',
                   'placeholder': 'Enter resultado biopsia'}))

class SubForm_historia_familiar_Form(forms.Form):
    pruebas_geneticas = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    resultado = forms.MultipleChoiceField(
        required=False,
        widget=forms.CheckboxSelectMultiple(
            attrs={'class': 'form-control', 'id': 'inp_frecuencia_bebe', 'name': 'frecuencia_bebe'}),
        choices=get_roles()
    )

    otro_resultado = forms.CharField(max_length=40, widget=forms.TextInput(
                attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_resultado_o',
                       'name': 'resultado_o', 'aria-describedby': 'inp_resultado_o_help',
                       'placeholder': 'Enter otro resultado'}))

    familiares = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    parentesco = forms.MultipleChoiceField(
        required=False,
        widget=forms.CheckboxSelectMultiple(
            attrs={'class': 'form-control', 'id': 'inp_frecuencia_bebe', 'name': 'frecuencia_bebe'}),
        choices=get_roles()
    )

    familiares_otro = forms.CharField(widget=forms.RadioSelect(choices=[('0', 'Sí'), ('1', 'No')]))

    tipo = forms.CharField(max_length=40, widget=forms.TextInput(
                    attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_tipo_c',
                           'name': 'tipo_c', 'aria-describedby': 'inp_tipo_c_help',
                           'placeholder': 'Enter tipo de cáncer'}))

    parentesco_tipo = forms.CharField(max_length=40, widget=forms.TextInput(
                    attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_parentescoc',
                           'name': 'parentescoc', 'aria-describedby': 'inp_parentescoc_help',
                           'placeholder': 'Enter parentesco'}))



class RegistrationForm(forms.Form):

    def __init__(self, *args,  **kwargs):
        if(kwargs.get('list_clinics')):
            self.clinics = kwargs.pop('list_clinics')
            super(RegistrationForm, self).__init__(*args, **kwargs)
            self.fields['clinica'].widget.choices = self.clinics
        else:
            super(RegistrationForm, self).__init__(*args, **kwargs)


    nombre = forms.CharField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control style4', 'placeholder': 'Nombre Completo', 'pattern' : '[A-Za-z ]+', 'title' : 'Ingrese letras solamente.'}))
    correo_electronico = forms.EmailField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control',  'placeholder': 'Correo electrónico', 'type': 'email', 'id': 'email'}))
    contrasena = forms.CharField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Contraseña', 'type': 'password', 'id': 'password'}))
    clinica = forms.CharField(widget=forms.Select(attrs={'class': 'custom-select style17', 'id': 'select1'}, choices=get_roles()))
    rol = forms.CharField(widget=forms.Select(attrs={'class': 'form-control style25', 'id': 'select2'}, choices=get_roles()))




