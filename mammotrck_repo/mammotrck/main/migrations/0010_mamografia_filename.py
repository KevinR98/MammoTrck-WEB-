# Generated by Django 3.1.1 on 2020-11-07 07:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0009_auto_20201106_2321'),
    ]

    operations = [
        migrations.AddField(
            model_name='mamografia',
            name='filename',
            field=models.CharField(max_length=500, null=True, unique=True),
        ),
    ]
