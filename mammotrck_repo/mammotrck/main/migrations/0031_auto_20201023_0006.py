# Generated by Django 3.1.1 on 2020-10-23 06:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0030_auto_20201022_2232'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='subform_antecedentes_g_o',
            name='terapia_hormonal_tipo',
        ),
        migrations.AddField(
            model_name='subform_antecedentes_g_o',
            name='cuanto_tiempo_sistemico',
            field=models.CharField(max_length=40, null=True),
        ),
        migrations.AddField(
            model_name='subform_antecedentes_g_o',
            name='terapia_hormonal_intravaginal',
            field=models.BooleanField(blank=True, max_length=1, null=True),
        ),
        migrations.AddField(
            model_name='subform_antecedentes_g_o',
            name='terapia_hormonal_nosabe',
            field=models.BooleanField(blank=True, max_length=1, null=True),
        ),
        migrations.AddField(
            model_name='subform_antecedentes_g_o',
            name='terapia_hormonal_sistemico',
            field=models.BooleanField(blank=True, max_length=1, null=True),
        ),
        migrations.AddField(
            model_name='subform_antecedentes_g_o',
            name='terapia_hormonal_topico',
            field=models.BooleanField(blank=True, max_length=1, null=True),
        ),
        migrations.DeleteModel(
            name='Terapia_hormonal',
        ),
    ]
