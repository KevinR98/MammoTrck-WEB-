from django.urls import path, include

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('', include('django.contrib.auth.urls')),
    path('registration/', views.registration, name='index'),
    path('patients/', views.pacientes, name='index'),
    path('forms', views.formulario, name='index'),
    path('forms/subform', views.formulario, name='index'),
    path('forms/timeline', views.formulario, name='index'),
    path('timeline/', views.linea_de_tiempo, name='index')

]
