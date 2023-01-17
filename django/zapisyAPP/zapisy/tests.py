from django.db import IntegrityError
from rest_framework.exceptions import ValidationError
from rest_framework.test import APITestCase, APIClient
from rest_framework.reverse import reverse

from accounts.models import User
from . import views
from .models import klient, zawodnik, wydarzenie, zapisy
from rest_framework import status
from django.utils.http import urlencode
from django import urls

from .serializers import zawodnikSerializer, klientSerializer


class KlientTests(APITestCase):
    def create_klient(self, nazwa, email, telefon, adres, client):
        url = reverse('klient-list')
        data = {'nazwa': nazwa, 'email': email, 'telefon': telefon, 'adres': adres}
        response = client.post(url, data, format='json')
        return response

    def test_post_and_get_klient(self):
        User.objects.create_superuser('admin@admin.com', 'admin123')
        client = APIClient()
        client.login(email='admin@admin.com', password='admin123')
        new_nazwa = 'Jan Kowalski'
        new_email = 'jankowalski@abc.com'
        new_telefon = '123456890'
        new_adres = 'Dworcowa 20'
        response = self.create_klient(new_nazwa, new_email, new_telefon, new_adres, client)

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(klient.objects.count(), 1)
        self.assertEqual(klient.objects.get().nazwa, new_nazwa)
        self.assertEqual(klient.objects.get().email, new_email)
        self.assertEqual(klient.objects.get().telefon, new_telefon)
        self.assertEqual(klient.objects.get().adres, new_adres)

    def test_post_and_no_klient(self):
        User.objects.create_superuser('admin@admin.com', 'admin123')
        client = APIClient()
        client.login(email='admin@admin.com', password='admin123')
        new_nazwa = 'Jan Kowalski'
        new_email = 'jankowalski@abc.com'
        new_telefon = '12345689123123120'
        new_adres = 'Dworcowa 20'
        response = self.create_klient(new_nazwa, new_email, new_telefon, new_adres, client)

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class ZawodnikTests(APITestCase):
    def test_create_zawodnik(self):
        data = {"imie": 'Jan',
                "nazwisko": 'Kowalski',
                "klub": 'Klub szybki',
                "telefon": '555-555-555',
                "email": 'jan@kowal.com',
                "miasto": 'Olsztyn'}
        serializer = zawodnikSerializer(data=data)
        if serializer.is_valid():
            _zawodnik = zawodnik.objects.create(**serializer.validated_data)
            self.assertEqual(_zawodnik.imie, 'Jan')
            self.assertEqual(_zawodnik.nazwisko, 'Kowalski')
            self.assertEqual(_zawodnik.klub, 'Klub szybki')
            self.assertEqual(_zawodnik.telefon, '555-555-555')
            self.assertEqual(_zawodnik.email, 'jan@kowal.com')
            self.assertEqual(_zawodnik.miasto, 'Olsztyn')

    def test_create_zawodnik_missing_fields(self):
        data = {"imie": 'Jan',
                "nazwisko": 'Kowalski'}
        serializer = zawodnikSerializer(data=data)
        if serializer.is_valid():
            _zawodnik = zawodnik.objects.create(**serializer.validated_data)
            self.assertEqual(_zawodnik.klub, '')
            self.assertEqual(_zawodnik.telefon, '')
            self.assertEqual(_zawodnik.email, '')
            self.assertEqual(_zawodnik.miasto, '')

    def test_create_zawodnik_with_invalid_phone(self):
        data = {"imie": 'Jan',
                "nazwisko": 'Kowalski', "telefon": '555-555-5555'}
        serializer = zawodnikSerializer(data=data)
        if serializer.is_valid():
            _zawodnik = zawodnik.objects.create(**serializer.validated_data)
            self.assertEqual(_zawodnik.telefon, '')


class WydarzenieTests(APITestCase):
    def test_create_wydarzenie(self):
        klient1 = klient.objects.create(
            nazwa='Jan Kowalski',
            email='jan@kowal.com',
            telefon='555-555-555',
            adres='123 Dworzec '
        )
        _wydarzenie = wydarzenie.objects.create(
            nazwa='Powazny maraton',
            organizator=klient1,
            miasto='Warszawa',
            termin='2022-11-01'
        )
        self.assertEqual(_wydarzenie.nazwa, 'Powazny maraton')
        self.assertEqual(_wydarzenie.organizator, klient1)
        self.assertEqual(_wydarzenie.miasto, 'Warszawa')
        self.assertEqual(_wydarzenie.termin, '2022-11-01')

    def test_create_wydarzenie_missing_fields(self):
        klient1 = klient.objects.create(nazwa='Jan Kowalski', email='jan@kowal.com')
        data = {"nazwa": 'Jan Kowalski',
                "email": 'jan@kowal.com'}
        serializer = klientSerializer(data=data)
        if serializer.is_valid():
            klient1 = zawodnik.objects.create(**serializer.validated_data)
            _wydarzenie = wydarzenie.objects.create(nazwa='Powazny maraton', organizator=klient1)
            self.assertEqual(_wydarzenie.miasto, '')
            self.assertEqual(_wydarzenie.termin, None)

    def test_create_wydarzenie_with_invalid_date(self):
        klient1 = klient.objects.create(nazwa='Jan Kowalski', email='jan@kowal.com')
        response = wydarzenie.objects.create(nazwa='Powazny maraton', organizator=klient1, termin='2022-12-01')


class ZapisyTests(APITestCase):
    def test_create_zapisy(self):
        klient1 = klient.objects.create(
            nazwa='Jan Kowalski',
            email='jan@kowal.com',
            telefon='555-555-555',
            adres='123 Dworzec '
        )
        zawodnik1 = zawodnik.objects.create(imie='Jan', nazwisko='Kowalski', klub='Klub czerwony')
        wydarzenie1 = wydarzenie.objects.create(nazwa='Maraton Wiejski', miasto='Poznań', termin='2022-01-18',
                                                organizator=klient1)
        zapisy1 = zapisy.objects.create(id_zawodnik=zawodnik1, zawody=wydarzenie1, dystans='10km')
        self.assertEqual(zapisy1.id_zawodnik, zawodnik1)
        self.assertEqual(zapisy1.zawody, wydarzenie1)
        self.assertEqual(zapisy1.dystans, '10km')

    def test_create_zapisy_with_missing_fields(self):
        klient1 = klient.objects.create(
            nazwa='Jan Kowalski',
            email='jan@kowal.com',
            telefon='555-555-555',
            adres='123 Dworzec '
        )
        zawodnik1 = zawodnik.objects.create(imie='Jan', nazwisko='Kowalski', klub='Klub czerwony')
        wydarzenie1 = wydarzenie.objects.create(nazwa='Maraton Wiejski', miasto='Poznań', termin='2022-01-01',
                                                organizator=klient1)
        try:
            zapisy1 = zapisy.objects.create(id_zawodnik=zawodnik1, zawody=wydarzenie1)
        except IntegrityError as e:
            self.assertEqual(str(e), 'NOT NULL constraint failed: zapisy_zapisy.dystans')
