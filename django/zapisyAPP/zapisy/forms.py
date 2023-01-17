from django import forms

class LoginForm(forms.Form):
    pass
class ZawodnikForm(forms.Form):
    imie = forms.CharField()
    nazwisko = forms.CharField()
    klub = forms.CharField()


class ZawodyForm(forms.Form):
    nazwa = forms.CharField()
    # organizator = forms.


class WynikiForm(forms.Form):
    zawodnik = forms.CharField()
    zawodnik = forms.CharField()
    dystans = forms.CharField()


class ZapisyForm(forms.Form):
    dystans = forms.CharField()


class KlientForm(forms.Form):
    nazwa = forms.CharField()
    email = forms.CharField()
    telefon = forms.CharField()
    adres = forms.CharField()
