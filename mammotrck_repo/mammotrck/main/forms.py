from django import forms
from .models import *



def get_clinicas():
    clinicas = [('0', 'Primera')]

    #leer base de datos

    return clinicas

def get_roles():
    return [('0', 'a'), ('1', 'b')]



class RegistrationForm(forms.Form):

    nombre = forms.CharField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control item', 'pattern' : '[A-Za-z ]+', 'title' : 'Ingrese letras solamente.'}))
    correo_electronico = forms.EmailField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control item', 'type': 'email', 'id': 'email'}))
    contrasena = forms.EmailField(max_length=40, widget=forms.TextInput(attrs={'class': 'form-control item', 'type': 'password', 'id': 'password'}))
    clinica = forms.CharField(widget=forms.Select(attrs={'class': 'btn btn-primary dropdown-toggle', 'data-toggle': 'dropdown', 'aria-expanded':'false', 'type':'button', 'style':'height'}, choices=get_clinicas()))
    rol = forms.CharField(widget=forms.Select(attrs={'class': 'btn btn-primary dropdown-toggle', 'data-toggle': 'dropdown', 'aria-expanded': 'false','type': 'button', 'style': 'height'}, choices=get_roles()))


