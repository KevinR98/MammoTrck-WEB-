# Generated by Django 3.1.1 on 2021-01-12 14:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0002_auto_20210112_0734'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subform_historia_personal',
            name='bebidas_cuanto',
            field=models.CharField(blank=True, choices=[(0, 'Más de tres a la semana'), (1, 'Más de dos al día'), (2, 'Otro')], default=0, max_length=2),
        ),
        migrations.AlterField(
            model_name='subform_historia_personal',
            name='clinic',
            field=models.CharField(blank=True, choices=[(0, 'Max Peralta'), (1, 'San Juan De Dios')], max_length=5, null=True),
        ),
        migrations.AlterField(
            model_name='subform_historia_personal',
            name='diabetes',
            field=models.CharField(blank=True, choices=[(0, 'Tipo 1'), (1, 'Tipo 2'), (2, 'Ninguna')], default=0, max_length=2),
        ),
        migrations.AlterField(
            model_name='subform_historia_personal',
            name='identidad_etnica',
            field=models.CharField(blank=True, choices=[(0, 'Indígena'), (1, 'Afrodescendiente'), (2, 'Origen asiático'), (3, 'Mulata'), (4, 'Mestiza'), (5, 'Blanca'), (6, 'No sabe')], default=0, max_length=2),
        ),
    ]
