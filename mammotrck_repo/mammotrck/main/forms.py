from django import forms
from .models import *


def get_roles():
    return [('0', 'Asistente'), ('1', 'Medico'), ('2', 'Administrador')]



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




