from django_filters import FilterSet, AllValuesFilter

from zapisy.models import zawodnik


class ZawodnikFilter(FilterSet):
    class Meta:
        model = zawodnik
        fields = {
            'imie': ['icontains'],
            'nazwisko': ['icontains'],
            'telefon': ['icontains'],

        }
