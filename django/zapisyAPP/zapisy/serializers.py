import re
import datetime

from rest_framework import serializers
from .models import zawodnik, zapisy, klient, wydarzenie, wyniki


class wydarzenieSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = wydarzenie
        fields = ("id", "nazwa", "organizator", "miasto", "termin")

    def validate_termin(self, value):
        if value < datetime.date.today() - datetime.timedelta(weeks=2):
            raise serializers.ValidationError("Termin nie może być wcześniejszy niż 2 tygodnie temu.")
        return value


class zapisySerializer(serializers.HyperlinkedModelSerializer):
    id_zawodnik = serializers.SlugRelatedField(slug_field='id', queryset=zawodnik.objects.all())
    zawody = serializers.SlugRelatedField(slug_field='id', queryset=wydarzenie.objects.all())

    class Meta:
        model = zapisy
        fields = ("url", "id", "id_zawodnik", "zawody", "dystans")

    def validate_dystans(self, value):
        try:
            value = float(value)
        except Exception:
            raise serializers.ValidationError("Dystans musi być liczbą.")
        if value < 0:
            raise serializers.ValidationError("Dystans nie może być ujemny.")
        if not isinstance(value, (int, float)):
            raise serializers.ValidationError("Dystans musi być liczbą.")
        return value

class klientSerializer(serializers.ModelSerializer):
    class Meta:
        model = klient
        fields = (
            "url",
            "id",
            "nazwa",
            "email",
            "telefon",
            "adres",
        )

    def validate_telefon(self, value):
        if not re.match(r"^\d{9}$", value):
            raise serializers.ValidationError("Numer telefonu jest niepoprawny.")
        return value

    def validate_email(self, value):
        if not re.match(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$", value):
            raise serializers.ValidationError("Adres email jest niepoprawny.")
        return value


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

    def validate_telefon(self, value):
        if not re.match(r"^\d{9}$", value):
            raise serializers.ValidationError("Numer telefonu jest niepoprawny.")
        return value

    def validate_email(self, value):
        if not re.match(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$", value):
            raise serializers.ValidationError("Adres email jest niepoprawny.")
        return value


class wynikiSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = wyniki
        fields = ("url", "id", "zawodnik", "zawody",
                  "dystans", "czas", "miejsce_open")

    def validate_dystans(self, value):
        try:
            value = float(value)
        except Exception:
            raise serializers.ValidationError("Dystans musi być liczbą.")
        if value < 0:
            raise serializers.ValidationError("Dystans nie może być ujemny.")
        if not isinstance(value, (int, float)):
            raise serializers.ValidationError("Dystans musi być liczbą.")
        return value

    def validate_czas(self, value):
        try:
            value = float(value)
        except:
            raise serializers.ValidationError("Czas musi być liczbą.")
        if value < 0:
            raise serializers.ValidationError("Czas nie może być ujemny.")
        return value
