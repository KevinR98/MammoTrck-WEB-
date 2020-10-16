from django.contrib.auth import get_user_model
from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Clinic(models.Model):
    name = models.CharField(max_length=40, null=True)

class Profile(models.Model):
    user = models.OneToOneField(User,
                                 on_delete=models.CASCADE,
                                 primary_key=True,
                                 default=1)

    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    clinic = models.OneToOneField(Clinic,
                                  on_delete=models.PROTECT,
                                  default=1)


class Pacient(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    name = models.CharField(max_length=40, null=True)

    id_pacient = models.CharField(primary_key=True, max_length=15)



# Clases de subformulario Historia Personal ============================================================================

class Identidad_etnica(models.Model):
    identidad = models.CharField(max_length=40, null=True)


class Tiempo_bebida(models.Model):
    tiempo = models.CharField(max_length=40, null=True)

class Medicamento(models.Model):
    medicamento = models.CharField(max_length=40, null=True)

class Medicamento_Subformulario(models.Model):
    id_medicamento = models.OneToOneField(Medicamento, on_delete=models.PROTECT, default=1)
    cuanto = models.CharField(max_length=40, null=True)

class SubForm_historia_personal(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    nombre = models.CharField(max_length=40, null=True)
    cedula = models.CharField(max_length=40, null=True)
    fecha_de_nacimiento = models.DateField()
    nacionalidad = models.CharField(max_length=40, null=True)
    identidad_etnica = models.ManyToManyField(Identidad_etnica, default=1)
    identidad_etnica_otro = models.CharField(max_length=40, null=True)

    peso = models.PositiveSmallIntegerField(null=True)
    talla = models.PositiveSmallIntegerField(null=True)
    imc = models.PositiveSmallIntegerField(null=True)


    #TODO
    fuma = models.BooleanField(max_length=1, null=True, blank=True)
    fuma_edad = models.PositiveSmallIntegerField(null=True)
    fuma_actualmente = models.BooleanField(max_length=1, null=True, blank=True)
    fuma_cuanto = models.CharField(max_length=40, null=True)

    #TODO
    bebidas = models.BooleanField(max_length=1, null=True, blank=True)
    bebidas_cuanto = models.OneToOneField(Tiempo_bebida, on_delete=models.PROTECT, default=1)
    bebidas_cuanto_otro = models.CharField(max_length=40, null=True)

    actividad_fisica = models.BooleanField(max_length=1, null=True, blank=True)
    actividad_fisica_cuanto = models.CharField(max_length=40, null=True)

    consume_alimentos_con_grasa = models.BooleanField(max_length=1, null=True, blank=True)
    consume_veg_frut_gram = models.BooleanField(max_length=1, null=True, blank=True)

    #TODO
    diabetes = models.BooleanField(max_length=1, null=True, blank=True)
    diabetes_tipo = models.PositiveSmallIntegerField(null=True)

    medicamento = models.ManyToManyField(Medicamento_Subformulario, default=1)

    radiacion = models.BooleanField(max_length=1, null=True, blank=True)



# Clases de subformulario Antecedentes Gineco-Obstetricos ==============================================================

class Terapia_hormonal(models.Model):
    tipo_terapia = models.CharField(max_length=40, null=True)


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
    anticonceptivos_cuanto = models.PositiveSmallIntegerField(null=True)
    anticonceptivos_ult_vez = models.DateField()

    terapia_hormonal_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    terapia_hormonal_tipo = models.ManyToManyField(Terapia_hormonal, default=1)
    terapia_hormonal_tiempo = models.CharField(max_length=40, null=True)

    biopsia_aplica = models.BooleanField(max_length=1, null=True, blank=True)
    biopsia_cuantas = models.PositiveSmallIntegerField(null=True)
    biopsia_resultado = models.CharField(max_length=40, null=True)



# Clases de subformulario Historia Familiar ============================================================================

class Prueba_genetica(models.Model):
    tipo_prueba_genetica = models.CharField(max_length=40, null=True)

class Parentezco(models.Model):
    tipo_parentezco = models.CharField(max_length=40, null=True)

class SubForm_historia_familiar(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    prueba_genetica = models.BooleanField(max_length=1, null=True, blank=True)
    prueba_genetica_resultado = models.ManyToManyField(Tiempo_bebida, default=1)
    bebidas_cuanto_otro = models.CharField(max_length=40, null=True)

    familiares_mama = models.BooleanField(max_length=1, null=True, blank=True)
    parentesco = models.ManyToManyField(Parentezco, default=1)

    familiares_cancer = models.BooleanField(max_length=1, null=True, blank=True)
    familiares_cancer_tipo = models.CharField(max_length=40, null=True)
    familiares_cancer_parentezco = models.CharField(max_length=40, null=True)


# ------------------------------------------------------------------------------------------------

class Mamografia(models.Model):
    url_imagen = models.URLField(null=True)

class Densidad_mamografica(models.Model):
    tipo_densidad = models.CharField(max_length=40, null=True)

class Form(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    SubForm_historia_personal = models.OneToOneField(SubForm_historia_personal, on_delete=models.CASCADE, default=1)
    SubForm_antecedentes_g_o = models.OneToOneField(SubForm_antecedentes_g_o, on_delete=models.CASCADE, default=1)
    SubForm_historia_familiar = models.OneToOneField(SubForm_historia_familiar, on_delete=models.CASCADE, default=1)

    id_form = models.CharField(primary_key=True, max_length=15)
    id_pacient = models.ManyToManyField(Pacient, default=1)
    submitted_at = models.DateTimeField(auto_now_add=True, auto_now=False)

    habilitado = models.BooleanField(max_length=1, null=True, blank=True)
    completed = models.BooleanField(max_length=1, null=True, blank=True)

    urls_imgs = models.ManyToManyField(Mamografia, default=1)


class Report(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated_at = models.DateTimeField(auto_now_add=False, auto_now=True)

    formulario = models.OneToOneField(Form, on_delete=models.PROTECT, default=1)

    densidad_mamografica = models.OneToOneField(Tiempo_bebida, on_delete=models.PROTECT, default=1)
    contenido = models.CharField(max_length=500, null=True)


