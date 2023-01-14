from django.db import models

# Create your models here.


class zawodnik(models.Model):
    id = models.IntegerField(primary_key=True)
    imie = models.CharField(max_length=45, blank=False, null=False)
    nazwisko = models.CharField(max_length=45, blank=False, null=False)
    klub = models.CharField(max_length=45, blank=False, null=False)
    telefon = models.CharField(max_length=9, blank=False, null=False)
    email = models.CharField(max_length=45, blank=False, null=False)
    miasto = models.CharField(max_length=45, blank=False, null=False)

    def __str__(self):
        return self.imie + " " + self.nazwisko


class klient(models.Model):
    id = models.IntegerField(primary_key=True)
    nazwa = models.CharField(max_length=45, blank=False, null=False)
    email = models.CharField(max_length=45, blank=False, null=False)
    telefon = models.CharField(max_length=9, blank=False, null=False)
    adres = models.CharField(max_length=45, blank=False, null=False)

    def __str__(self):
        return self.nazwa


class wydarzenie(models.Model):
    id = models.IntegerField(primary_key=True)
    nazwa = models.CharField(max_length=45, blank=False, null=False)
    organizator = models.ForeignKey(
        klient, on_delete=models.CASCADE, blank=False, null=False
    )
    miasto = models.CharField(max_length=45, blank=False, null=False)
    termin = models.DateField(max_length=45, blank=False, null=False)

    def __str__(self):
        return self.nazwa


class zapisy(models.Model):
    id = models.IntegerField(primary_key=True)
    id_zawodnik = models.ForeignKey(
        zawodnik, on_delete=models.CASCADE, blank=False, null=False
    )
    zawody = models.ForeignKey(
        wydarzenie, on_delete=models.CASCADE, blank=False, null=False
    )
    dystans = models.CharField(max_length=45, blank=False, null=False)

    def __str__(self):
        return self.zawody + " " + self.dystans


class wyniki(models.Model):
    id = models.IntegerField(primary_key=True)
    zawodnik = models.ForeignKey(
        zawodnik, on_delete=models.CASCADE, blank=False, null=False
    )
    zawody = models.ForeignKey(
        wydarzenie, on_delete=models.CASCADE, blank=False, null=False
    )
    dystans = models.CharField(max_length=45, blank=False, null=False)
    czas = models.CharField(max_length=45, blank=False, null=False)
    miejsce_open = models.CharField(max_length=45, blank=False, null=False)


class dystans(models.Model):
    id = models.IntegerField(primary_key=True)
    dystans = models.CharField(max_length=45, blank=False, null=False)

    def __str__(self):
        return self.dystans
