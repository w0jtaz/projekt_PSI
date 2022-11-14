from django.db import models

# Create your models here.

class zawodnik(models.Model):
    id_zawodnik = models.IntegerField().primary_key
    imie = models.CharField(max_length=50, blank=False, null=False)
    nazwisko = models.CharField(max_length=50, blank=False, null=False)
    telefon = models.CharField(max_length=9, blank=False, null=False)
    email = models.CharField(max_length=50, blank=False, null=False)
    miasto = models.CharField(max_length=50, blank=False, null=False)