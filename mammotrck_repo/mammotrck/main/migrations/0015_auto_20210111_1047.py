# Generated by Django 3.1.1 on 2021-01-11 16:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0014_auto_20210111_1023'),
    ]

    operations = [
        migrations.RenameField(
            model_name='subform_antecedentes_g_o',
            old_name='edad_menopausaia',
            new_name='edad_menopausia',
        ),
        migrations.RenameField(
            model_name='subform_antecedentes_g_o',
            old_name='manopausa_aplica',
            new_name='manopausia_aplica',
        ),
    ]