from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('', include('django.contrib.auth.urls')),
    path('registration/', views.registration, name='registration'),
    path('pacientes/', views.pacientes, name='patients'),
    path('forms/', views.lista_formularios, name='forms'),
    path('forms/create/', views.agregar_formulario, name='create_forms'),
    path('forms/import/', views.load_file, name='import_form'),
    path('forms/deactivate/', views.deshabilitar_formulario, name='deactivate_forms'),
    path('form/', views.formulario, name='form'),
    path('form/saveA/', views.guardar_subform_personal_Form, name='save_form_historia_personal'),
    path('form/saveB/', views.guardar_subForm_antecedentes_g_o, name='save_form_antecedentes_go'),
    path('form/saveC/', views.guardar_subForm_historia_familiar, name='save_form_historia_familiar'),
    path('form/images', views.formulario, name='images'),
    path('timeline/', views.linea_de_tiempo, name='linea_de_tiempo'),
    path('reportes/', views.reportes_clinicos, name='reportes'),
    path('reportes/create', views.agregar_reporte, name='create_report'),
    path('reportes/edit', views.editar_reporte, name='edit_report'),
    path('reportes/delete', views.borrar_reporte, name='delete_report'),
    path('imagenes/', views.lista_imagenes, name='images'),
    path('imagenes/save', views.guardar_imagenes, name='save_images'),
    path('imagenes/delete', views.borrar_imagenes, name='delete_images')
]
