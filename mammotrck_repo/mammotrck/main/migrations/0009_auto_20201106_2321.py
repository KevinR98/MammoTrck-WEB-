# Generated by Django 3.1.1 on 2020-11-07 05:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0008_auto_20201106_2143'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mamografia',
            name='url_imagen',
            field=models.URLField(null=True, unique=True),
        ),
    ]
