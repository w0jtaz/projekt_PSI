# Generated by Django 4.1.2 on 2022-12-19 09:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('zapisy', '0003_klient_adres_klient_telefon'),
    ]

    operations = [
        migrations.AddField(
            model_name='zawodnik',
            name='klub',
            field=models.CharField(default=1, max_length=45),
            preserve_default=False,
        ),
    ]
