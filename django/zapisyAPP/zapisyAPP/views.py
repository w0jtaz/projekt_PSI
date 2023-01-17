from django.contrib import messages
from django.contrib.auth import authenticate, login, logout as auth_logout
from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth.mixins import UserPassesTestMixin
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render
from django.views.generic import TemplateView
from rest_framework import status
from rest_framework.response import Response

from zapisy.filters import ZawodnikFilter
from zapisy.forms import ZapisyForm, KlientForm, ZawodnikForm, ZawodyForm, WynikiForm, LoginForm
from zapisy.models import zawodnik, wydarzenie, wyniki, klient, zapisy
from zapisy.serializers import klientSerializer, zapisySerializer, zawodnikSerializer, wydarzenieSerializer


def redirect_view(request):
    return render(request, 'app/index.html')


def login_view(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        print(request.POST)
        user = authenticate(email=email, password=password)
        if user is not None:
            login(request, user)
            return redirect('index')
        else:
            # messages.info(request, 'Login lub hasło nieprawidłowe.')
            return render(request, 'app/login.html', {'error': 'Login lub hasło nieprawidłowe.'})
    return render(request, 'app/login.html', {})


def logout_view(request):
    auth_logout(request)
    return redirect('login')


def zapisy_view(request):
    zawodnik_list = zawodnik.objects.all()
    wydarzenie_list = wydarzenie.objects.all()
    zapisy_list = zapisy.objects.all()
    return render(request, 'app/zapisy.html',
                  {'zawodnik_list': zawodnik_list, 'wydarzenie_list': wydarzenie_list, 'zapisy_list': zapisy_list})


class wyniki_new_view(UserPassesTestMixin, TemplateView):
    wyniki_list = wyniki.objects.all()
    zawodnik_list = zawodnik.objects.all()
    wydarzenie_list = wydarzenie.objects.all()

    def test_func(self):
        return self.request.user.is_staff

    def handle_no_permission(self):
        return redirect('index')

    def get(self, request):
        form = WynikiForm()
        context = {'form': form, 'wyniki_list': self.wyniki_list, 'zawodnik_list': self.zawodnik_list,
                   'wydarzenie_list': self.wydarzenie_list}
        return render(request, 'app/wyniki_new.html', context)

    def post(self, request):
        serializer = wydarzenieSerializer(data=request.POST)
        if serializer.is_valid():
            wydarzenie.objects.create(**serializer.validated_data)
            return redirect('wyniki')
        else:
            form = WynikiForm()
            context = {'form': form, 'wyniki_list': self.wyniki_list, 'zawodnik_list': self.zawodnik_list,
                       'wydarzenie_list': self.wydarzenie_list, 'errors': serializer.errors}
            return render(request, 'app/wyniki_new.html', context)


class zawodnik_new_view(UserPassesTestMixin, TemplateView):
    zawodnik_list = klient.objects.all()

    def test_func(self):
        return self.request.user.is_staff

    def handle_no_permission(self):
        return redirect('index')

    def get(self, request):
        form = ZawodnikForm()
        context = {'form': form, 'zawodnik_list': self.zawodnik_list}
        return render(request, 'app/zawodnik_new.html', context)

    def post(self, request):
        serializer = zawodnikSerializer(data=request.POST)
        if serializer.is_valid():
            zawodnik.objects.create(**serializer.validated_data)
            return redirect('zawodnik')
        else:
            form = ZawodnikForm()
            context = {'form': form, 'zawodnik_list': self.zawodnik_list, 'errors': serializer.errors}
            return render(request, 'app/zawodnik_new.html', context)


class klient_new_view(UserPassesTestMixin, TemplateView):
    klient_list = klient.objects.all()

    def test_func(self):
        return self.request.user.is_staff

    def handle_no_permission(self):
        return redirect('index')

    def get(self, request):
        form = KlientForm()
        context = {'form': form, 'klient_list': self.klient_list}
        return render(request, 'app/klient_new.html', context)

    def post(self, request):
        serializer = klientSerializer(data=request.POST)
        if serializer.is_valid():
            klient.objects.create(**serializer.validated_data)
            return redirect('klient')
        else:
            print('Nie ok')
            form = KlientForm()
            context = {'form': form, 'klient_list': self.klient_list, 'errors': serializer.errors}
            return render(request, 'app/klient_new.html', context)


class zapisy_new_view(TemplateView):
    zawodnik_list = zawodnik.objects.all()
    zapisy_list = zapisy.objects.all()
    zawody_list = wydarzenie.objects.all()

    def get(self, request):
        form = ZapisyForm()
        context = {'form': form, 'zawodnik_list': self.zawodnik_list, 'zawody_list': self.zawody_list,
                   'zapisy_list': self.zapisy_list}
        return render(request, 'app/zapisy_new.html', context)

    def post(self, request):
        serializer = zapisySerializer(data=request.POST)
        if serializer.is_valid():
            zapisy.objects.create(**serializer.validated_data)
            return redirect('zapisy')
        else:
            form = ZapisyForm()
            context = {'form': form, 'zawodnik_list': self.zawodnik_list, 'zawody_list': self.zawody_list,
                       'zapisy_list': self.zapisy_list, 'errors': serializer.errors}
            return render(request, 'app/zapisy_new.html', context)


def zawodnik_view(request, parameter=''):
    print(f'Parameter: {parameter}')
    zawodnik_filter = ZawodnikFilter(request.GET, queryset=zawodnik.objects.all())
    context = {
        'form': zawodnik_filter.form,
        'zawodnik_list': zawodnik_filter.qs
    }
    zawodnik_list = zawodnik.objects.all()
    return render(request, 'app/zawodnik.html', context)


def zawodnik_view(request, id=''):
    print(f'Parameter: {id}')
    zawodnik_filter = ZawodnikFilter(request.GET, queryset=zawodnik.objects.all())
    context = {
        'form': zawodnik_filter.form,
        'zawodnik_list': zawodnik_filter.qs
    }
    zawodnik_list = zawodnik.objects.all()
    return render(request, 'app/zawodnik.html', context)


def zawodnik_detail_view(request, param):
    zawodnik_filter = ZawodnikFilter(request.GET, queryset=zawodnik.objects.all())
    context = {
        'form': zawodnik_filter.form,
        'zawodnik_list': zawodnik_filter.qs
    }
    zawodnik_list = zawodnik.objects.all()
    return render(request, 'app/zawodnik.html', context)


def zawody_view(request):
    zawody_list = wydarzenie.objects.all()
    return render(request, 'app/zawody.html', {'zawody_list': zawody_list})


def wyniki_view(request):
    wyniki_list = wyniki.objects.all()
    return render(request, 'app/wyniki.html', {'wyniki_list': wyniki_list})


def klient_view(request):
    klient_list = klient.objects.all()
    return render(request, 'app/klient.html', {'klient_list': klient_list})
