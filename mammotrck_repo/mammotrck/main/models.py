# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver


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


# Clases de subformulario Historia Personal ============================================================================

class Identidad_etnica(models.Model):
    identidad = models.CharField(max_length=40, null=True)

class SubForm_historia_personal(models.Model):

    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    clinic = models.ForeignKey(Clinic, on_delete=models.PROTECT, default=2, null=True)
    nombre = models.CharField(max_length=40, null=True)
    cedula = models.CharField(max_length=40, null=True)
    fecha_de_nacimiento = models.DateField(null=True)
    nacionalidad = models.CharField(max_length=40, null=True)
    identidad_etnica = models.ForeignKey(Identidad_etnica, on_delete=models.PROTECT, default=1, null=True, blank=True)
    identidad_etnica_otro = models.CharField(max_length=40, null=True)

    peso = models.PositiveSmallIntegerField(null=True)
    talla = models.PositiveSmallIntegerField(null=True)
    imc = models.PositiveSmallIntegerField(null=True)

    fuma = models.BooleanField(max_length=1, null=True, blank=True)
    fuma_edad = models.PositiveSmallIntegerField(null=True)
    fuma_actualmente = models.BooleanField(max_length=1, null=True, blank=True)
    fuma_cuanto = models.CharField(max_length=40, null=True)

    bebidas = models.BooleanField(max_length=1, null=True, blank=True)
    bebidas_cuanto = models.CharField(max_length=40, null=True)
    bebidas_cuanto_otro = models.CharField(max_length=40, null=True)

    actividad_fisica = models.BooleanField(max_length=1, null=True, blank=True)
    actividad_fisica_cuanto = models.CharField(max_length=40, null=True)

    consume_alimentos_con_grasa = models.BooleanField(max_length=1, null=True, blank=True)
    consume_veg_frut_gram = models.BooleanField(max_length=1, null=True, blank=True)

    diabetes = models.CharField(max_length=40, null=True)

    toma_medicamento_tamoxifeno = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_tamoxifeno = models.CharField(max_length=40, null=True)

    toma_medicamento_anastrozol = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_anastrozol = models.CharField(max_length=40, null=True)

    toma_medicamento_metformina = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_metformina = models.CharField(max_length=40, null=True)

    toma_medicamento_bifosfonatos = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_bifosfonatos = models.CharField(max_length=40, null=True)

    toma_medicamento_aspirina = models.BooleanField(max_length=1, null=True, blank=True)
    cuanto_aspirina = models.CharField(max_length=40, null=True)

    radiacion = models.BooleanField(max_length=1, null=True, blank=True)




# Clases de subformulario Antecedentes Gineco-Obstetricos ==============================================================


class SubForm_antecedentes_g_o(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)


    manopausa_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    edad_menstruacion = models.PositiveSmallIntegerField(null=True)
    edad_manopausa = models.PositiveSmallIntegerField(null=True)


    parto_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    parto_cantidad = models.PositiveSmallIntegerField(null=True)
    edad_ult_hijo = models.PositiveSmallIntegerField(null=True)

    lactancia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    lactancia_tiempo = models.PositiveSmallIntegerField(null=True)

    anticonceptivos_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    anticonceptivos_cuanto = models.CharField(max_length=40, null=True)
    anticonceptivos_ult_vez = models.CharField(max_length=40, null=True)

    terapia_hormonal_aplica = models.BooleanField(max_length=1, null=True, blank=True)

    terapia = models.CharField(max_length=1, null=True, blank=True)
    cuanto_tiempo_terapia = models.CharField(max_length=40, null=True)


    biopsia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    biopsia_cuantas = models.PositiveSmallIntegerField(null=True)
    biopsia_resultado = models.CharField(max_length=40, null=True)




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



# ------------------------------------------------------------------------------------------------


class Mamografia(models.Model):
    url_imagen = models.URLField(null=True)

class Form(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    id_form = models.CharField(primary_key=True, max_length=15)
    id_patient = models.ForeignKey(Patient, on_delete=models.PROTECT, default=2, null=True)
    submitted_at = models.DateTimeField(null=True)

    habilitado = models.BooleanField(max_length=1, null=True, blank=True)
    completed = models.BooleanField(max_length=1, null=True, blank=True)

    urls_imgs = models.ManyToManyField(Mamografia)

    subform_hist_per = models.OneToOneField(SubForm_historia_personal, on_delete=models.PROTECT, default=2, null=True)
    subform_ant_g_o = models.OneToOneField(SubForm_antecedentes_g_o, on_delete=models.PROTECT, default=2, null=True)
    subform_hist_fam = models.OneToOneField(SubForm_historia_familiar, on_delete=models.PROTECT, default=2, null=True)


@receiver(pre_save, sender=Form)
def create_forms(sender, instance, **kwargs):
        instance.subform_hist_per = SubForm_historia_personal.objects.create()
        instance.subform_ant_g_o = SubForm_antecedentes_g_o.objects.create()
        instance.subform_hist_fam = SubForm_historia_familiar.objects.create()

"""
#TODO recivar metodo para guardado en escalada
@receiver(post_save, sender=Form)
def save_profile(sender, instance, **kwargs):
    print("probando......")
    instance.subForm_historia_familiar.save()
    instance.subForm_antecedentes_g_o.save()
    instance.subForm_historia_familiar.save()
"""

class Report(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    formulario = models.OneToOneField(Form, on_delete=models.PROTECT, default=1)

    contenido = models.CharField(max_length=500, null=True)


