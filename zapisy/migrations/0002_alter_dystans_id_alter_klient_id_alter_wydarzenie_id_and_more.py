# Generated by Django 4.1.5 on 2023-01-17 19:55

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("zapisy", "0001_initial"),
    ]

    operations = [
        migrations.AlterField(
            model_name="dystans",
            name="id",
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name="klient",
            name="id",
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name="wydarzenie",
            name="id",
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name="wyniki",
            name="id",
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name="zapisy",
            name="id",
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name="zawodnik",
            name="id",
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]