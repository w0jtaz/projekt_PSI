from rest_framework import serializers
from .models import zawodnik, zapisy, klient, wydarzenie, wyniki


class wydarzenieSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = wydarzenie
        fields = ("id", "nazwa", "organizator", "miasto", "termin")


class zapisySerializer(serializers.HyperlinkedModelSerializer):
    id_zawodnik = serializers.SlugRelatedField(
        slug_field='id', queryset=zawodnik.objects.all())

    class Meta:
        model = zapisy
        fields = ("url", "id", "id_zawodnik", "zawody", "dystans")


class klientSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = klient
        fields = (
            "id",
            "nazwa",
            "email",
            "telefon",
            "adres",
        )


class zawodnikSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = zawodnik
        fields = [
            "url",
            "id",
            "imie",
            "nazwisko",
            "klub",
            "telefon",
            "email",
            "miasto",
        ]


class wynikiSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = wyniki
        fields = ("id", "zawodnik", "zawody",
                  "dystans", "czas", "miejsce_open")
