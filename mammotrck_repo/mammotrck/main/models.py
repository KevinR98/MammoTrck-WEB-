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
    identidad = models.CharField(max_length=40, null=True)

class SubForm_historia_personal(models.Model):

    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    clinic = models.ForeignKey(Clinic, on_delete=models.PROTECT, default=1, null=True, blank=True) #TODO quitar default
    nombre = models.CharField(max_length=40, null=True, blank=True)
    cedula = models.CharField(max_length=40, null=True, blank=True)
    fecha_de_nacimiento = models.DateField(null=True, blank=True)
    nacionalidad = models.CharField(max_length=40, null=True, blank=True)
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
    bebidas_cuanto = models.CharField(max_length=40, null=True, blank=True)
    bebidas_cuanto_otro = models.CharField(max_length=40, null=True, blank=True)

    actividad_fisica = models.BooleanField(max_length=1, null=True, blank=True)
    actividad_fisica_cuanto = models.CharField(max_length=40, null=True, blank=True)

    consume_alimentos_con_grasa = models.BooleanField(max_length=1, null=True, blank=True)
    consume_veg_frut_gram = models.BooleanField(max_length=1, null=True, blank=True)

    diabetes = models.CharField(max_length=40, null=True, blank=True)

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
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)


    menopausia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    edad_menstruacion = models.PositiveSmallIntegerField(null=True)
    edad_menopausia = models.PositiveSmallIntegerField(null=True)


    parto_aplica = models.BooleanField(max_length=1, null=True, blank=True) #
    parto_cantidad = models.PositiveSmallIntegerField(null=True)
    edad_ult_hijo = models.PositiveSmallIntegerField(null=True)

    lactancia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    lactancia_tiempo = models.CharField(max_length=40, null=True)

    anticonceptivos_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    anticonceptivos_cuanto = models.CharField(max_length=40, null=True)
    anticonceptivos_ult_vez = models.CharField(max_length=40, null=True)

    terapia_hormonal_aplica = models.BooleanField(max_length=1, null=True, blank=True)

    terapia = models.CharField(max_length=1, null=True, blank=True)
    cuanto_tiempo_terapia = models.CharField(max_length=40, null=True)


    biopsia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    biopsia_cuantas = models.PositiveSmallIntegerField(null=True)
    biopsia_resultado = models.CharField(max_length=40, null=True)

    form = models.OneToOneField(Form, on_delete=models.PROTECT, default=2, null=False, related_name='subform_ant_g_o')



# Clases de subformulario Historia Familiar ============================================================================

class Prueba_genetica(models.Model):
    tipo_prueba_genetica = models.CharField(max_length=40, null=True)

class Parentesco(models.Model):
    tipo_parentesco = models.CharField(max_length=40, null=True)

class SubForm_historia_familiar(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    prueba_genetica = models.BooleanField(max_length=1, null=True, blank=True)
    prueba_genetica_resultado = models.ManyToManyField(Prueba_genetica)
    prueba_genetica_otro = models.CharField(max_length=40, null=True, default=None)

    familiares_mama = models.BooleanField(max_length=1, null=True, blank=True)
    parentesco = models.ManyToManyField(Parentesco)

    familiares_cancer = models.BooleanField(max_length=1, null=True, blank=True)

    familiares_cancer_tipo = models.CharField(max_length=40, null=True)
    familiares_cancer_parentesco = models.CharField(max_length=40, null=True)

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
