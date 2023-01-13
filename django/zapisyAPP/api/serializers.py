from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from rest_framework.authtoken.models import Token
from zapisy.models import zawodnik, klient, wydarzenie, zapisy, wyniki, dystans
from accounts.models import User

class sign_up_Serializer(serializers.ModelSerializer):
    email = serializers.CharField(max_length=80)
    username = serializers.CharField(max_length=45)
    password = serializers.CharField(min_length=8, write_only=True)
    class Meta:
        model = User
        fields = ['email', 'username', 'password']

    def validate(self, attrs):
        email_exists = User.objects.filter(email=attrs['email']).exists()

        if email_exists:
            raise ValidationError("Podany email już został użyty.")

        return super().validate(attrs)

    def create(self, validated_data):
        password = validated_data.pop("password")
        user = super().create(validated_data)

        user.set_password(password)

        user.save()

        Token.objects.create(user=user)

        return user

class zawodnikSerializer(serializers.ModelSerializer):
    class Meta:
        model = zawodnik
        fields = (
            "id",
            "imie",
            "nazwisko",
            "klub",
            "telefon",
            "email",
            "miasto",
        )


class klientSerializer(serializers.ModelSerializer):
    class Meta:
        model = klient
        fields = ("id", "nazwa", "email", "telefon", "adres")


class wydarzenieSerializer(serializers.ModelSerializer):
    class Meta:
        model = wydarzenie
        fields = ("id", "nazwa", "organizator", "miasto", "termin")


class zapisySerializer(serializers.ModelSerializer):
    #zapisy = serializers.HyperlinkedRelatedField(many=True, view_name='zapisy_detail', queryset=User.objects.all())
    class Meta:
        model = zapisy
        fields = ("id", "id_zawodnik", "zawody", "dystans")


class wynikiSerializer(serializers.ModelSerializer):
    class Meta:
        model = wyniki
        fields = ("id", "zawodnik", "zawody", "dystans", "czas", "miejsce_open")


class dystansSerializer(serializers.ModelSerializer):
    class Meta:
        model = dystans
        fields = ("id", "dystans")
