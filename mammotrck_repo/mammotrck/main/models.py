# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver


HISTORIA_PERSONAL_FIELD_PARSER = {
    'clinic': 'Hospital',
    'nombre': 'Nombre',
    'cedula': 'Cédula',
    'fecha_de_nacimiento': 'Fecha de nacimiento',
    'nacionalidad': 'Nacionalidad',
    'identidad_etnica': 'Identidad étnica',
    'identidad_etnica_otro': 'Otra identidad',
    'peso': 'Peso (kg)',
    'talla': 'Talla (m)',
    'imc': 'IMC (kg/m2)',
    'fuma': 'Fumadora',
    'fuma_edad': 'Edad que empezó a fumar',
    'fuma_actualmente': 'Fuma actualmente',
    'fuma_cuanto': 'Por cuánto tiempo ha fumado',
    'bebidas': 'Bebe alcohol',
    'bebidas_cuanto': 'Frecuencia en que bebe',
    'bebidas_cuanto_otro': 'Otra frecuencia',
    'actividad_fisica': 'Realiza actividad física',
    'actividad_fisica_cuanto': 'Minutos por semana de actividad física',
    'consume_alimentos_con_grasa': 'Consume alimentos con mucha grasa',
    'consume_veg_frut_gram': 'Consume vegetales, frutas y granos regularmente',
    'diabetes': 'Diabetes',
    'toma_medicamento_tamoxifeno': 'Toma Tamoxifeno',
    'cuanto_tamoxifeno': 'Por cuánto tiempo',
    'toma_medicamento_anastrozol': 'Toma Anastrozol',
    'cuanto_anastrozol': 'Por cuánto tiempo',
    'toma_medicamento_metformina': 'Toma Metformina',
    'cuanto_metformina': 'Por cuánto tiempo',
    'toma_medicamento_bifosfonatos': 'Toma Bifosfonatos',
    'cuanto_bifosfonatos': 'Por cuánto tiempo',
    'toma_medicamento_aspirina': 'Toma Aspirina',
    'cuanto_aspirina': 'Por cuánto tiempo',
    'tratamiento_torax': 'Ha recibido tratamientos con radiación en el tórax',
}

ANTECEDENTES_FIELD_PARSER = {
    'edad_menstruacion': 'Edad (años) de la primera menstruación',
    'menopausia_aplica': 'Menopausia',
    'edad_menopausia': 'Edad (años) al momento de la menopausia',
    'parto_cantidad': 'Cantidad de partos',
    'edad_ult_hijo': 'Edad (años) del último hijo',
    'lactancia_tiempo': 'Tiempo de lactancia del último hijo',
    'lactancia_aplica': 'Lactancia en su último hijo',
    'anticonceptivos_aplica': 'Anticonceptivos orales',
    'anticonceptivos_cuanto': 'Tiempo que los tomó',
    'anticonceptivos_ult_vez': 'Última vez que los usó',
    'terapia_hormonal_aplica': 'Terapia hormonal para menopausia',
    'terapia': 'Tipo de terapia',
    'cuanto_tiempo_terapia': 'Tiempo de uso',
    'biopsia_aplica': 'Biopsias de mama',
    'biopsia_cuantas': 'Número biopsias',
    'biopsia_resultado': 'Resultado',
    'parto_aplica': '¿Ha tenido partos?'

}
HISTORIA_FAMILIAR_FIELD_PARSER = {
    'prueba_genetica': 'Pruebas genéticas previas',
    'prueba_genetica_resultado': 'Resultado de prueba genética',
    'prueba_genetica_otro': 'Otro resultado',
    'familiares_mama': 'Familiares con cáncer de mama u ovario',
    'parentesco': 'Parentesco de familiares con cancer de mama',
    'familiares_cancer': 'Familiares con otro tipo de cáncer',
    'familiares_cancer_tipo': 'Tipo de cáncer',
    'familiares_cancer_parentesco': 'Parentesco de familiares con otro tipo de cancer'
}


FIELD_PARSER = {
    'subf_form_A': HISTORIA_PERSONAL_FIELD_PARSER,
    'subf_form_B': ANTECEDENTES_FIELD_PARSER,
    'subf_form_C': HISTORIA_FAMILIAR_FIELD_PARSER
}



class Clinic(models.Model):
    def __str__(self):
        return '%s' %(self.name)

    name = models.CharField(max_length=40, null=True)
    acronym = models.CharField(max_length=40, null=True)

class Profile(models.Model):
    user = models.OneToOneField(User,
                                 on_delete=models.CASCADE,
                                 primary_key=True,
                                 default=1)

    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    clinic = models.ForeignKey(Clinic, on_delete=models.PROTECT, default=2, null=True)

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    instance.profile.save()


class Patient(models.Model):

    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    name = models.CharField(max_length=40, null=True)

    id_patient = models.CharField(primary_key=True, max_length=15)


class Form(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    id_form = models.CharField(primary_key=True, max_length=15)
    id_patient = models.ForeignKey(Patient, on_delete=models.PROTECT, default=2, null=True)
    submitted_at = models.DateTimeField(null=True)

    habilitado = models.BooleanField(max_length=1, null=True, blank=True)
    completed = models.BooleanField(max_length=1, null=True, blank=True)

class Mamografia(models.Model):
    url_imagen = models.URLField(null=True, unique=True)
    filename = models.CharField(max_length=500, unique=True, null=True)

    form = models.ForeignKey(Form, on_delete=models.PROTECT, default=2)

@receiver(post_save, sender=Form)
def create_forms(sender, instance, created ,**kwargs):
    if created:
        SubForm_historia_personal.objects.create(form=instance)
        SubForm_antecedentes_g_o.objects.create(form=instance)
        SubForm_historia_familiar.objects.create(form=instance)


@receiver(post_save, sender=Form)
def save_subforms(sender, instance, **kwargs):
    instance.subform_hist_per.save()
    instance.subform_ant_g_o.save()
    instance.subform_hist_fam.save()



# Clases de subformulario Historia Personal ============================================================================

class Identidad_etnica(models.Model):
    def __str__(self):
        return '%s' %(self.identidad)

    identidad = models.CharField(max_length=40, null=True)


class SubForm_historia_personal(models.Model):
    nacionalidades = ['Afganistán', 'Albania', 'Alemania', 'Andorra', 'Angola', 'Anguila', 'Antártida',
                     'Antigua y Barbuda', 'Arabia Saudita', 'Argelia', 'Argentina', 'Armenia', 'Aruba', 'Australia',
                     'Austria', 'Azerbaiyán', 'Bélgica', 'Bahamas', 'Bahrein', 'Bangladesh', 'Barbados', 'Belice',
                     'Benín', 'Bhután', 'Bielorrusia', 'Birmania', 'Bolivia', 'Bosnia y Herzegovina', 'Botsuana',
                     'Brasil', 'Brunéi', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cabo Verde', 'Camboya', 'Camerún',
                     'Canadá', 'Chad', 'Chile', 'China', 'Chipre', 'Ciudad del Vaticano', 'Colombia', 'Comoras',
                     'República del Congo', 'República Democrática del Congo', 'Corea del Norte', 'Corea del Sur',
                     'Costa de Marfil', 'Costa Rica', 'Croacia', 'Cuba', 'Curazao', 'Dinamarca', 'Dominica', 'Ecuador',
                     'Egipto', 'El Salvador', 'Emiratos Árabes Unidos', 'Eritrea', 'Eslovaquia', 'Eslovenia', 'España',
                     'Estados Unidos de América', 'Estonia', 'Etiopía', 'Filipinas', 'Finlandia', 'Fiyi', 'Francia',
                     'Gabón', 'Gambia', 'Georgia', 'Ghana', 'Gibraltar', 'Granada', 'Grecia', 'Groenlandia',
                     'Guadalupe', 'Guam', 'Guatemala', 'Guayana Francesa', 'Guernsey', 'Guinea', 'Guinea Ecuatorial',
                     'Guinea-Bissau', 'Guyana', 'Haití', 'Honduras', 'Hong kong', 'Hungría', 'India', 'Indonesia',
                     'Irán', 'Irak', 'Irlanda', 'Isla Bouvet', 'Isla de Man', 'Isla de Navidad', 'Isla Norfolk',
                     'Islandia', 'Islas Bermudas', 'Islas Caimán', 'Islas Cocos (Keeling)', 'Islas Cook',
                     'Islas de Åland', 'Islas Feroe', 'Islas Georgias del Sur y Sandwich del Sur',
                     'Islas Heard y McDonald', 'Islas Maldivas', 'Islas Malvinas', 'Islas Marianas del Norte',
                     'Islas Marshall', 'Islas Pitcairn', 'Islas Salomón', 'Islas Turcas y Caicos',
                     'Islas Ultramarinas Menores de Estados Unidos', 'Islas Vírgenes Británicas',
                     'Islas Vírgenes de los Estados Unidos', 'Israel', 'Italia', 'Jamaica', 'Japón', 'Jersey',
                     'Jordania', 'Kazajistán', 'Kenia', 'Kirguistán', 'Kiribati', 'Kuwait', 'Líbano', 'Laos', 'Lesoto',
                     'Letonia', 'Liberia', 'Libia', 'Liechtenstein', 'Lituania', 'Luxemburgo', 'México', 'Mónaco',
                     'Macao', 'Macedônia', 'Madagascar', 'Malasia', 'Malawi', 'Mali', 'Malta', 'Marruecos', 'Martinica',
                     'Mauricio', 'Mauritania', 'Mayotte', 'Micronesia', 'Moldavia', 'Mongolia', 'Montenegro',
                     'Montserrat', 'Mozambique', 'Namibia', 'Nauru', 'Nepal', 'Nicaragua', 'Niger', 'Nigeria', 'Niue',
                     'Noruega', 'Nueva Caledonia', 'Nueva Zelanda', 'Omán', 'Países Bajos', 'Pakistán', 'Palau',
                     'Palestina', 'Panamá', 'Papúa Nueva Guinea', 'Paraguay', 'Perú', 'Polinesia Francesa', 'Polonia',
                     'Portugal', 'Puerto Rico', 'Qatar', 'Reino Unido', 'República Centroafricana', 'República Checa',
                     'República Dominicana', 'República de Sudán del Sur', 'Reunión', 'Ruanda', 'Rumanía', 'Rusia',
                     'Sahara Occidental', 'Samoa', 'Samoa Americana', 'San Bartolomé', 'San Cristóbal y Nieves',
                     'San Marino', 'San Martín (Francia)', 'San Pedro y Miquelón', 'San Vicente y las Granadinas',
                     'Santa Elena', 'Santa Lucía', 'Santo Tomé y Príncipe', 'Senegal', 'Serbia', 'Seychelles',
                     'Sierra Leona', 'Singapur', 'Sint Maarten', 'Siria', 'Somalia', 'Sri lanka', 'Sudáfrica', 'Sudán',
                     'Suecia', 'Suiza', 'Surinám', 'Svalbard y Jan Mayen', 'Swazilandia', 'Tayikistán', 'Tailandia',
                     'Taiwán', 'Tanzania', 'Territorio Británico del Océano Índico',
                     'Territorios Australes y Antárticas Franceses', 'Timor Oriental', 'Togo', 'Tokelau', 'Tonga',
                     'Trinidad y Tobago', 'Tunez', 'Turkmenistán', 'Turquía', 'Tuvalu', 'Ucrania', 'Uganda', 'Uruguay',
                     'Uzbekistán', 'Vanuatu', 'Venezuela', 'Vietnam', 'Wallis y Futuna', 'Yemen', 'Yibuti', 'Zambia',
                     'Zimbabue']

    opciones_identidad_etnica = ['Indígena', 'Afrodescendiente', 'Origen asiático', 'Mulata', 'Mestiza', 'Blanca', 'No sabe']
    opciones_frecuencia_bebe = ['Más de tres a la semana', 'Más de dos al día', 'Otro']
    opciones_diabetes = ['Tipo 1', 'Tipo 2', 'Ninguna']
    opciones_clinicas = ['Max Peralta', 'San Juan De Dios']


    NACIONALIDAD = [(i, element) for i, element in enumerate(nacionalidades)]
    IDENTIDAD_ETNICA = [(i, element) for i, element in enumerate(opciones_identidad_etnica)]
    FRECUENCIA_BEBE = [(i, element) for i, element in enumerate(opciones_frecuencia_bebe)]
    DIABETES = [(i, element) for i, element in enumerate(opciones_diabetes)]
    CLINICA = [(i, element) for i, element in enumerate(opciones_clinicas)]

    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    clinic = models.CharField(choices=CLINICA, max_length=5, null=True, default=1)
    #clinic = models.ForeignKey(Clinic, on_delete=models.PROTECT, default=1, null=True, blank=True)

    nombre = models.CharField(max_length=40, null=True, blank=True)
    cedula = models.CharField(max_length=40, null=True, blank=True)
    fecha_de_nacimiento = models.DateField(null=True, blank=True)
    nacionalidad = models.CharField(choices=NACIONALIDAD, max_length=2, null=True, default=0)

    #identidad_etnica = models.CharField(choices=IDENTIDAD_ETNICA, max_length=2, default=0)
    identidad_etnica = models.ForeignKey(Identidad_etnica, on_delete=models.PROTECT, default=1, null=True, blank=True)

    identidad_etnica_otro = models.CharField(max_length=40, null=True, blank=True)

    peso = models.PositiveSmallIntegerField(null=True, blank=True)
    talla = models.PositiveSmallIntegerField(null=True, blank=True)
    imc = models.FloatField(null=True, blank=True)

    fuma = models.BooleanField(max_length=1, null=True, blank=True)
    fuma_edad = models.PositiveSmallIntegerField(null=True, blank=True)
    fuma_actualmente = models.BooleanField(max_length=1, null=True, blank=True)
    fuma_cuanto = models.CharField(max_length=40, null=True, blank=True)

    bebidas = models.BooleanField(max_length=1, null=True, blank=True)
    bebidas_cuanto = models.CharField(choices=FRECUENCIA_BEBE, max_length=2, default=0)
    bebidas_cuanto_otro = models.CharField(max_length=40, null=True, blank=True)

    actividad_fisica = models.BooleanField(max_length=1, null=True, blank=True)
    actividad_fisica_cuanto = models.CharField(max_length=40, null=True, blank=True)

    consume_alimentos_con_grasa = models.BooleanField(max_length=1, null=True, blank=True)
    consume_veg_frut_gram = models.BooleanField(max_length=1, null=True, blank=True)

    diabetes = models.CharField(choices=DIABETES, max_length=2, default=0)

    toma_medicamento_tamoxifeno = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_tamoxifeno = models.CharField(max_length=40, null=True, blank=True)

    toma_medicamento_anastrozol = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_anastrozol = models.CharField(max_length=40, null=True, blank=True)

    toma_medicamento_metformina = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_metformina = models.CharField(max_length=40, null=True, blank=True)

    toma_medicamento_bifosfonatos = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_bifosfonatos = models.CharField(max_length=40, null=True, blank=True)

    toma_medicamento_aspirina = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_aspirina = models.CharField(max_length=40, null=True, blank=True)

    tratamiento_torax = models.BooleanField(max_length=1, null=True, blank=True)

    form = models.OneToOneField(Form, on_delete=models.PROTECT, default=2, null=False, related_name='subform_hist_per')





# Clases de subformulario Antecedentes Gineco-Obstetricos ==============================================================


class SubForm_antecedentes_g_o(models.Model):
    opciones_tipos_terapia = ['No sabe', 'Sistémico (Oral)', 'Tópico (Crema o Parche)', 'Intravaginal (Óvulos o Anillo)']

    TIPO_TERAPIA = [(i, element) for i, element in enumerate(opciones_tipos_terapia)]

    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)


    menopausia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    edad_menstruacion = models.PositiveSmallIntegerField(null=True, blank=True)
    edad_menopausia = models.PositiveSmallIntegerField(null=True, blank=True)


    parto_aplica = models.BooleanField(max_length=1, null=True, blank=True) #
    parto_cantidad = models.PositiveSmallIntegerField(null=True, blank=True)
    edad_ult_hijo = models.PositiveSmallIntegerField(null=True, blank=True)

    lactancia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    lactancia_tiempo = models.CharField(max_length=40, null=True, blank=True)

    anticonceptivos_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    anticonceptivos_cuanto = models.CharField(max_length=40, null=True, blank=True)
    anticonceptivos_ult_vez = models.CharField(max_length=40, null=True, blank=True)

    terapia_hormonal_aplica = models.BooleanField(max_length=1, null=True, blank=True)

    terapia = models.CharField(choices=TIPO_TERAPIA, max_length=5, null=True, default=0)
    cuanto_tiempo_terapia = models.CharField(max_length=40, null=True, blank=True)


    biopsia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    biopsia_cuantas = models.PositiveSmallIntegerField(null=True, blank=True)
    biopsia_resultado = models.CharField(max_length=40, null=True, blank=True)

    form = models.OneToOneField(Form, on_delete=models.PROTECT, default=2, null=False, related_name='subform_ant_g_o')



# Clases de subformulario Historia Familiar ============================================================================

class Prueba_genetica(models.Model):
    def __str__(self):
        return '%s' %(self.tipo_prueba_genetica)

    tipo_prueba_genetica = models.CharField(max_length=40, null=True, blank=True)

class Parentesco(models.Model):
    def __str__(self):
        return '%s' %(self.tipo_parentesco)

    tipo_parentesco = models.CharField(max_length=40, null=True, blank=True)

class SubForm_historia_familiar(models.Model):

    created_at = models.DateTimeField(auto_now_add=True, auto_now=False, blank=True)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True, blank=True)

    prueba_genetica = models.BooleanField(max_length=1, null=True, blank=True)

    prueba_genetica_resultado = models.ManyToManyField(Prueba_genetica, blank=True) ##

    prueba_genetica_otro = models.CharField(max_length=40, null=True, default=None, blank=True)

    familiares_mama = models.BooleanField(max_length=1, null=True, blank=True)

    parentesco = models.ManyToManyField(Parentesco,  null=True, default=None, blank=True) ##

    familiares_cancer = models.BooleanField(max_length=1, null=True, blank=True)

    familiares_cancer_tipo = models.CharField(max_length=40, null=True, blank=True)
    familiares_cancer_parentesco = models.CharField(max_length=40, null=True, blank=True)

    form = models.OneToOneField(Form, on_delete=models.PROTECT, default=2, null=False, related_name='subform_hist_fam')
# ------------------------------------------------------------------------------------------------




class Report(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    formulario = models.OneToOneField(Form, on_delete=models.PROTECT, default=1)

    contenido = models.CharField(max_length=500, null=True)

    user = models.ForeignKey(User, on_delete=models.PROTECT, default=2)






#--------------------------------------------------------------------------------------------------


dependencias = {
    "fuma_edad" :"fuma",
    "fuma_cuanto" : "fuma_actualmente",
    "actividad_fisica_cuanto" : "actividad_fisica",
    "cuanto_tamoxifeno" : "toma_medicamento_tamoxifeno",
    "cuanto_anastrozol" : "toma_medicamento_anastrozol",
    "cuanto_metformina" : "toma_medicamento_metformina",
    "cuanto_bifosfonatos" : "toma_medicamento_bifosfonatos",
    "cuanto_aspirina" : "toma_medicamento_aspirina",
    "parto_cantidad" : "parto_aplica",
    "edad_ult_hijo" : "parto_aplica",
    "lactancia_aplica" : "parto_aplica",
    "lactancia_tiempo" : "lactancia_aplica",
    "anticonceptivos_cuanto" : "anticonceptivos_aplica",
    "anticonceptivos_ult_vez" : "anticonceptivos_aplica",
    "edad_menopausia" : "menopausia_aplica",
    "terapia_hormonal_aplica" : "menopausia_aplica",
    "cuanto_tiempo_terapia" : "terapia_hormonal_aplica",
    "biopsia_cuantas" : "biopsia_aplica",
    "biopsia_resultado" : "biopsia_aplica",
    "prueba_genetica_resultado" : "prueba_genetica",
    "parentesco" : "familiares_mama",
    "familiares_cancer_tipo" : "familiares_cancer",
    "familiares_cancer_parentesco" : "familiares_cancer"
}

opcionales = ["identidad_etnica_otro", "bebidas_cuanto_otro", "prueba_genetica_otro", "bebidas_cuanto"]
