# Generated by Django 3.1.1 on 2021-01-11 16:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0013_auto_20210111_0907'),
    ]

    operations = [
        migrations.RenameField(
            model_name='subform_antecedentes_g_o',
            old_name='edad_manopausa',
            new_name='edad_menopausaia',
        ),
    ]