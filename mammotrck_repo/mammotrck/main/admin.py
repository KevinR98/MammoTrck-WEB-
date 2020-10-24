from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(Clinic)
admin.site.register(Profile)



admin.site.register(Patient)
admin.site.register(Identidad_etnica)
admin.site.register(SubForm_historia_personal)
admin.site.register(SubForm_antecedentes_g_o)
admin.site.register(Prueba_genetica)
admin.site.register(Parentesco)
admin.site.register(SubForm_historia_familiar)
admin.site.register(Mamografia)
admin.site.register(Form)
admin.site.register(Report)

