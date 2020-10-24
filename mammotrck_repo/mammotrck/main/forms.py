from datetime import datetime

from django import forms
from django.utils.safestring import mark_safe

from .models import *


def get_roles():
    return [('0', 'Asistente'), ('1', 'Medico'), ('2', 'Administrador')]

NATIONALITIES = ['Afganistán',  'Albania',  'Alemania',  'Andorra',  'Angola',  'Anguila',  'Antártida',  'Antigua y Barbuda',  'Arabia Saudita',  'Argelia',  'Argentina',  'Armenia',  'Aruba',  'Australia',  'Austria',  'Azerbaiyán',  'Bélgica',  'Bahamas',  'Bahrein',  'Bangladesh',  'Barbados',  'Belice',  'Benín',  'Bhután',  'Bielorrusia',  'Birmania',  'Bolivia',  'Bosnia y Herzegovina',  'Botsuana',  'Brasil',  'Brunéi',  'Bulgaria',  'Burkina Faso',  'Burundi',  'Cabo Verde',  'Camboya',  'Camerún',  'Canadá',  'Chad',  'Chile',  'China',  'Chipre',  'Ciudad del Vaticano',  'Colombia',  'Comoras',  'República del Congo',  'República Democrática del Congo',  'Corea del Norte',  'Corea del Sur',  'Costa de Marfil',  'Costa Rica',  'Croacia',  'Cuba',  'Curazao',  'Dinamarca',  'Dominica',  'Ecuador',  'Egipto',  'El Salvador',  'Emiratos Árabes Unidos',  'Eritrea',  'Eslovaquia',  'Eslovenia',  'España',  'Estados Unidos de América',  'Estonia',  'Etiopía',  'Filipinas',  'Finlandia',  'Fiyi',  'Francia',  'Gabón',  'Gambia',  'Georgia',  'Ghana',  'Gibraltar',  'Granada',  'Grecia',  'Groenlandia',  'Guadalupe',  'Guam',  'Guatemala',  'Guayana Francesa',  'Guernsey',  'Guinea',  'Guinea Ecuatorial',  'Guinea-Bissau',  'Guyana',  'Haití',  'Honduras',  'Hong kong',  'Hungría',  'India',  'Indonesia',  'Irán',  'Irak',  'Irlanda',  'Isla Bouvet',  'Isla de Man',  'Isla de Navidad',  'Isla Norfolk',  'Islandia',  'Islas Bermudas',  'Islas Caimán',  'Islas Cocos (Keeling)',  'Islas Cook',  'Islas de Åland',  'Islas Feroe',  'Islas Georgias del Sur y Sandwich del Sur',  'Islas Heard y McDonald',  'Islas Maldivas',  'Islas Malvinas',  'Islas Marianas del Norte',  'Islas Marshall',  'Islas Pitcairn',  'Islas Salomón',  'Islas Turcas y Caicos',  'Islas Ultramarinas Menores de Estados Unidos',  'Islas Vírgenes Británicas',  'Islas Vírgenes de los Estados Unidos',  'Israel',  'Italia',  'Jamaica',  'Japón',  'Jersey',  'Jordania',  'Kazajistán',  'Kenia',  'Kirguistán',  'Kiribati',  'Kuwait',  'Líbano',  'Laos',  'Lesoto',  'Letonia',  'Liberia',  'Libia',  'Liechtenstein',  'Lituania',  'Luxemburgo',  'México',  'Mónaco',  'Macao',  'Macedônia',  'Madagascar',  'Malasia',  'Malawi',  'Mali',  'Malta',  'Marruecos',  'Martinica',  'Mauricio',  'Mauritania',  'Mayotte',  'Micronesia',  'Moldavia',  'Mongolia',  'Montenegro',  'Montserrat',  'Mozambique',  'Namibia',  'Nauru',  'Nepal',  'Nicaragua',  'Niger',  'Nigeria',  'Niue',  'Noruega',  'Nueva Caledonia',  'Nueva Zelanda',  'Omán',  'Países Bajos',  'Pakistán',  'Palau',  'Palestina',  'Panamá',  'Papúa Nueva Guinea',  'Paraguay',  'Perú',  'Polinesia Francesa',  'Polonia',  'Portugal',  'Puerto Rico',  'Qatar',  'Reino Unido',  'República Centroafricana',  'República Checa',  'República Dominicana',  'República de Sudán del Sur',  'Reunión',  'Ruanda',  'Rumanía',  'Rusia',  'Sahara Occidental',  'Samoa',  'Samoa Americana',  'San Bartolomé',  'San Cristóbal y Nieves',  'San Marino',  'San Martín (Francia)',  'San Pedro y Miquelón',  'San Vicente y las Granadinas',  'Santa Elena',  'Santa Lucía',  'Santo Tomé y Príncipe',  'Senegal',  'Serbia',  'Seychelles',  'Sierra Leona',  'Singapur',  'Sint Maarten',  'Siria',  'Somalia',  'Sri lanka',  'Sudáfrica',  'Sudán',  'Suecia',  'Suiza',  'Surinám',  'Svalbard y Jan Mayen',  'Swazilandia',  'Tayikistán',  'Tailandia',  'Taiwán',  'Tanzania',  'Territorio Británico del Océano Índico',  'Territorios Australes y Antárticas Franceses',  'Timor Oriental',  'Togo',  'Tokelau',  'Tonga',  'Trinidad y Tobago',  'Tunez',  'Turkmenistán',  'Turquía',  'Tuvalu',  'Ucrania',  'Uganda',  'Uruguay',  'Uzbekistán',  'Vanuatu',  'Venezuela',  'Vietnam',  'Wallis y Futuna',  'Yemen',  'Yibuti',  'Zambia',  'Zimbabue']
FRECUENCIA_BEBE = [('0', 'Más de tres a la semana'), ('1', 'Más de dos al día'), ('2', 'Otro')]
DIABETES = [('0', '1'), ('1', '2'), ('2', 'Ninguna')]
TIPO_TERAPIA = [('0', 'Sistemico (Oral)'), ('1', 'Topico (Crema o Parche)'), ('2', 'Intravaginal (Ovulos o Anillo)'), ('3', 'No sabe')]

#'BRCA1, BRCA2, TP53, PTEN, CDH1, STK11, Otro'
#'Madre', 'Tia (Materna)', 'Tia (Paterna)', 'Abuela (Materna)' ,'Abuela (Paterna)'






class SubForm_historia_personal_Form(forms.Form):

    def __init__(self, *args,  **kwargs):

        self.id_subform = None

        if kwargs.get('id_subform'):
            self.id_subform = kwargs.pop('id_subform')

        super(SubForm_historia_personal_Form, self).__init__(*args, **kwargs)

        if self.id_subform:
            subform = SubForm_historia_personal.objects.filter(pk=self.id_subform).get()

            self.initial['hospital'] = str(subform.clinic.pk)
            self.fields['nombre'].initial = subform.nombre
            self.fields['cedula'].initial = subform.cedula
            self.fields['fecha_nacimiento'].initial = subform.fecha_de_nacimiento
            self.initial['nacionalidad'] =  subform.nacionalidad
            self.initial['identidad_etnica'] =  subform.identidad_etnica
            self.fields['otra_identidad'].initial = subform.identidad_etnica_otro
            self.fields['peso_kg'].initial = subform.peso
            self.fields['talla_m'].initial =  subform.talla
            self.fields['imc'].initial = subform.imc
            self.fields['fumador'].initial = int(subform.fuma) if subform.fuma else None
            self.fields['edad_fumo'].initial = subform.fuma_edad
            self.fields['fuma_actuamente'].initial = int(subform.fuma_actualmente) if subform.fuma_actualmente else None
            self.fields['tiempo_fumando'].initial = subform.fuma_cuanto
            self.fields['bebe_alcohol'].initial = int(subform.bebidas) if subform.bebidas else None
            self.fields['frecuencia'].initial = subform.bebidas_cuanto
            self.fields['bebe_frecuencia'].initial = subform.bebidas_cuanto_otro
            self.fields['actividades_fisicas'].initial = int(subform.actividad_fisica) if subform.actividad_fisica else None
            self.fields['minutos_actividad_fisica'].initial = subform.actividad_fisica_cuanto
            self.fields['alimentos_con_grasa'].initial = int(subform.consume_alimentos_con_grasa) if subform.consume_alimentos_con_grasa else None
            self.fields['consume_vegetales_frts_grns'].initial = int(subform.consume_veg_frut_gram) if subform.consume_veg_frut_gram else None
            self.initial['diabetes'] =  subform.diabetes
            self.fields['toma_tamoxifeno'].initial = int(subform.toma_medicamento_tamoxifeno) if subform.toma_medicamento_tamoxifeno else None
            self.fields['cuanto_tiempo_tamoxifeno'].initial = subform.cuanto_tamoxifeno
            self.fields['toma_anastrozol'].initial = int(subform.toma_medicamento_anastrozol) if subform.toma_medicamento_anastrozol else None
            self.fields['cuanto_tiempo_anastrozol'].initial = subform.cuanto_anastrozol
            self.fields['toma_metformina'].initial = int(subform.toma_medicamento_metformina) if subform.toma_medicamento_metformina else None
            self.fields['cuanto_tiempo_metformina'].initial = subform.cuanto_metformina
            self.fields['toma_bifosfonatos'].initial = int(subform.toma_medicamento_bifosfonatos) if subform.toma_medicamento_bifosfonatos else None
            self.fields['cuanto_tiempo_bisfofonatos'].initial = subform.cuanto_bifosfonatos
            self.fields['toma_aspirinas'].initial = int(subform.toma_medicamento_aspirina) if subform.toma_medicamento_aspirina else None
            self.fields['cuanto_tiempo_aspirinas'].initial = subform.cuanto_aspirina

            self.fields['tratamiento_torax'].initial = int(subform.radiacion) if subform.radiacion else None

    hospital = forms.ChoiceField(required=False,
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_hospital', 'name': 'hospital'}),
        choices=[(model.pk, model.name) for model in Clinic.objects.all()])

    nombre = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_nombre',
               'name':'nombre', 'aria-describedby':'inp_nombre_help',
               'placeholder': 'Enter Nombre'}))

    cedula = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_cedula',
               'name':'cedula', 'aria-describedby':'inp_cedula_help',
               'placeholder': 'Enter Cédula'}))

    fecha_nacimiento = forms.CharField(required=False, max_length=40, widget=forms.DateInput(
        attrs={'type': 'date', 'class': 'form-control', 'id': 'inp_fecha_nacimiento',
               'name': 'fecha_nacimiento', 'aria-describedby': 'inp_fecha_nacimiento_help',
               'placeholder': 'Enter Fecha de nacimiento'}))

    nacionalidad = forms.CharField(required=False,
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_nacionalidad', 'name':'nacionalidad'},
                            choices=[(i, element) for i, element in enumerate(NATIONALITIES)]))

    identidad_etnica = forms.CharField(required=False,
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_etnia', 'name':'etnia'},
                            choices=[(model.pk, model.identidad) for model in Identidad_etnica.objects.all()]))

    otra_identidad = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_otra_identidad',
               'name':'otra_identidad', 'aria-describedby':'inp_otra_identidad_help',
               'placeholder': 'Enter otra identidad étnica'}))

    peso_kg = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_peso',
               'name':'peso', 'aria-describedby':'inp_peso_help',
               'placeholder': 'Enter Peso (kg)'}))

    talla_m = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_talla',
               'name':'talla', 'aria-describedby':'inp_talla_help',
               'placeholder': 'Enter Talla (m)'}))

    imc = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_imc',
               'name': 'imc', 'aria-describedby': 'inp_imc_help',
               'placeholder': 'Enter IMC (kg/m2)'}))

    fumador = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')])
                              )



    edad_fumo = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_edad_fumado',
               'name':'edad_fumado', 'aria-describedby':'inp_edad_fumado_help',
               'placeholder': 'Enter Edad que empezó a fumar'}))

    fuma_actuamente = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    tiempo_fumando = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_tiempo_fumado',
               'name':'tiempo_fumado', 'aria-describedby':'inp_tiempo_fumado_help',
               'placeholder': 'Enter Por cuánto tiempo ha fumado'}))

    bebe_alcohol = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))


    frecuencia = forms.CharField(required=False,
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_frecuencia_bebe', 'name':'frecuencia_bebe'},
                            choices=FRECUENCIA_BEBE))

    bebe_frecuencia = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'text', 'class': 'form-control', 'id':'inp_otra_frecuencia',
               'name':'otra_frecuencia', 'aria-describedby':'inp_otra_frecuencia_help',
               'placeholder': 'Enter otra frecuencia de bebida'}))

    actividades_fisicas = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))


    minutos_actividad_fisica = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_minutos_actividad',
               'name':'minutos_actividad', 'aria-describedby':'inp_minutos_actividad_help',
               'placeholder': 'Enter Minutos por semana de actividad física'}))

    alimentos_con_grasa = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    consume_vegetales_frts_grns = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))


    diabetes = forms.CharField(required=False,
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_diabetes','name':'diabetes'},
                            choices=DIABETES))



    toma_tamoxifeno = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    cuanto_tiempo_tamoxifeno = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_1_t',
               'name': 'med_1_t', 'aria-describedby': 'inp_med_1_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    toma_anastrozol= forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    cuanto_tiempo_anastrozol = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_2_t',
               'name': 'med_2_t', 'aria-describedby': 'inp_med_2_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    toma_metformina= forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    cuanto_tiempo_metformina = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_3_t',
               'name': 'med_3_t', 'aria-describedby': 'inp_med_3_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    toma_bifosfonatos = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    cuanto_tiempo_bisfofonatos = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_4_t',
               'name': 'med_4_t', 'aria-describedby': 'inp_med_4_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    toma_aspirinas = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    cuanto_tiempo_aspirinas = forms.CharField(required=False, max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_med_5_t',
               'name': 'med_5_t', 'aria-describedby': 'inp_med_5_t_help',
               'placeholder': 'Enter Por cuánto tiempo'}))

    tratamiento_torax = forms.CharField(required=False, widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))


class SubForm_antecedentes_g_o_Form(forms.Form):
    def __init__(self, *args, **kwargs):

        self.id_subform = None

        if kwargs.get('id_subform'):
            self.id_subform = kwargs.pop('id_subform')

        super(SubForm_antecedentes_g_o_Form, self).__init__(*args, **kwargs)

        if self.id_subform:
            subform = SubForm_antecedentes_g_o.objects.filter(pk=self.id_subform).get()

            self.fields['edad_menstruacion'].initial = subform.edad_menstruacion
            self.fields['menopausia'].initial = int(subform.manopausa_aplica) if subform.manopausa_aplica else None
            self.fields['edad_menopausaia'].initial = subform.edad_manopausa
            self.fields['cantidad_partos'].initial = subform.parto_cantidad
            self.fields['edad_ultimo_hijo'].initial = subform.edad_ult_hijo
            self.fields['tiempo_lactancia'].initial = subform.lactancia_tiempo
            self.fields['lactancia_ult_hijo'].initial = int(subform.lactancia_aplica) if subform.lactancia_aplica else None
            self.fields['anticonceptivos_orales'].initial = int(subform.anticonceptivos_aplica) if subform.anticonceptivos_aplica else None
            self.fields['tiempo_tomo'].initial = subform.anticonceptivos_cuanto
            self.fields['ultima_vez_uso'].initial = subform.anticonceptivos_ult_vez
            self.fields['terapia_hormonal'].initial = int(subform.terapia_hormonal_aplica) if subform.terapia_hormonal_aplica else None

            self.initial['tipo_terapia'] = subform.terapia
            self.fields['tiempo_uso'].initial = subform.cuanto_tiempo_terapia

            self.fields['biopsia_mama'].initial = int(subform.biopsia_aplica) if subform.biopsia_aplica else None
            self.fields['numero_biopsia'].initial = subform.biopsia_cuantas
            self.fields['resultado'].initial = subform.biopsia_resultado


    edad_menstruacion = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type':'number', 'class': 'form-control', 'id':'inp_mens',
               'name':'mens', 'aria-describedby':'inp_mens_help',
               'placeholder': 'Enter edad primera menstruación'}))

    menopausia = forms.CharField(widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))


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

    lactancia_ult_hijo = forms.CharField(widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    anticonceptivos_orales = forms.CharField(widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    tiempo_tomo = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_anti_t',
               'name': 'anti_t', 'aria-describedby': 'inp_anti_t_help',
               'placeholder': 'Enter tiempo que tomó los anticonceptivos'}))

    ultima_vez_uso = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_anti_u',
               'name': 'anti_u', 'aria-describedby': 'inp_anti_u_help',
               'placeholder': 'Enter última vez que los usó'}))

    terapia_hormonal = forms.CharField(widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    tipo_terapia = forms.CharField(
            widget=forms.Select(attrs={'class': 'form-control', 'id': 'inp_terapia_t', 'name':'terapia_t'},
                                choices=get_roles()))

    tiempo_uso = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_terapia_tiempo',
               'name': 'terapia_tiempo', 'aria-describedby': 'inp_terapia_tiempo_help',
               'placeholder': 'Enter tiempo de uso'}))

    biopsia_mama = forms.CharField(widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    numero_biopsia = forms.CharField(max_length=40, widget=forms.TextInput(
        attrs={'type': 'number', 'class': 'form-control', 'id': 'inp_biopsias',
               'name': 'biopsias', 'aria-describedby': 'inp_biopsias_help',
               'placeholder': 'Enter numero biopsias'}))

    resultado = forms.CharField(max_length=40, widget=forms.TextInput(
            attrs={'type': 'text', 'class': 'form-control', 'id': 'inp_resultado_b',
                   'name': 'resultado_b', 'aria-describedby': 'inp_resultado_b_help',
                   'placeholder': 'Enter resultado biopsia'}))

class SubForm_historia_familiar_Form(forms.Form):

    def __init__(self, *args, **kwargs):

        self.id_subform = None

        if kwargs.get('id_subform'):
            self.id_subform = kwargs.pop('id_subform')

        super(SubForm_historia_familiar_Form, self).__init__(*args, **kwargs)

        if self.id_subform:
            subform = SubForm_historia_familiar.objects.filter(pk=self.id_subform).get()
            self.fields['pruebas_geneticas'].initial = "Lol"
            self.initial['resultado'] = {'resultado':["id_resultado_0"]}

            self.fields['otro_resultado'].initial = "Lol"
            #self.fields['familiares'].initial = "Lol"
            #self.fields['parentesco'].initial = "Lol"
            #self.fields['familiares_otro'].initial = "Lol"
            self.fields['tipo'].initial = "Lol"
            self.fields['parentesco_tipo'].initial = "Lol"


    pruebas_geneticas = forms.CharField(widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

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

    familiares = forms.CharField(widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

    parentesco = forms.MultipleChoiceField(
        required=False,
        widget=forms.CheckboxSelectMultiple(
            attrs={'class': 'form-control', 'id': 'inp_frecuencia_bebe', 'name': 'frecuencia_bebe'}),
        choices=get_roles()
    )

    familiares_otro = forms.CharField(widget=forms.RadioSelect(choices=[('1', 'Sí'), ('0', 'No')]))

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




