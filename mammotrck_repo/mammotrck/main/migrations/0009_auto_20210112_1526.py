# Generated by Django 3.1.1 on 2021-01-12 21:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0008_auto_20210112_0941'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subform_historia_familiar',
            name='parentesco',
            field=models.ManyToManyField(blank=True, to='main.Parentesco'),
        ),
    ]
