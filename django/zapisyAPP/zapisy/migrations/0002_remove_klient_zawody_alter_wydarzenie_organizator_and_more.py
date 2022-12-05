# Generated by Django 4.1.2 on 2022-12-05 11:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('zapisy', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='klient',
            name='zawody',
        ),
        migrations.AlterField(
            model_name='wydarzenie',
            name='organizator',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='zapisy.klient'),
        ),
        migrations.AlterField(
            model_name='wyniki',
            name='zawodnik',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='zapisy.zawodnik'),
        ),
        migrations.AlterField(
            model_name='wyniki',
            name='zawody',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='zapisy.wydarzenie'),
        ),
        migrations.AlterField(
            model_name='zapisy',
            name='id_zawodnik',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='zapisy.zawodnik'),
        ),
        migrations.AlterField(
            model_name='zapisy',
            name='zawody',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='zapisy.wydarzenie'),
        ),
    ]