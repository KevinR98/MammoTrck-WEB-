from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('', include('django.contrib.auth.urls')),
    path('registration/', views.registration, name='registration'),
    path('patients/', views.pacientes, name='patients'),
    path('forms/', views.lista_formularios, name='forms'),
    path('forms/create/', views.agregar_formulario, name='create_forms'),
    path('forms/deactivate/', views.formulario, name='deactivate_forms'),
    path('forms/images', views.formulario, name='images'),
    path('timeline/', views.linea_de_tiempo, name='index')
]
