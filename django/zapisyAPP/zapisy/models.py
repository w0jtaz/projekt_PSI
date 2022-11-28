from django.db import models

# Create your models here.

class zawodnik(models.Model):
    id_zawodnik = models.IntegerField().primary_key
    imie = models.CharField(max_length=45, blank=False, null=False)
    nazwisko = models.CharField(max_length=45, blank=False, null=False)
    telefon = models.CharField(max_length=9, blank=False, null=False)
    email = models.CharField(max_length=45, blank=False, null=False)
    miasto = models.CharField(max_length=45, blank=False, null=False)

class wydarzenie(models.Model):
    id_zawody = models.IntegerField().primary_key
    nazwa = models.CharField(max_length=45, blank=False, null=False)
    organizator = models.IntegerField(blank=False, null=False)
    miasto = models.CharField(max_length=45, blank=False, null=False)
    termin = models.CharField(max_length=45, blank=False, null=False)

class zapisy(models.Model):
    id_zapisy = models.IntegerField().primary_key
    id_zawodnik = models.IntegerField(blank=False, null=False)
    zawody = models.IntegerField(blank=False, null=False)
    dystans = models.CharField(max_length=45, blank=False, null=False)

class klient(models.Model):
    id_klient = models.IntegerField().primary_key
    nazwa = models.CharField(max_length=45, blank=False, null=False)
    email = models.CharField(max_length=45, blank=False, null=False)
    zawody = models.IntegerField(blank=False, null=False)

class wyniki(models.Model):
    id_wyniki = models.IntegerField().primary_key
    zawodnik = models.IntegerField(blank=False, null=False)
    zawody = models.IntegerField(blank=False, null=False)
    dystans = models.CharField(max_length=45, blank=False, null=False)
    czas = models.CharField(max_length=45, blank=False, null=False)
