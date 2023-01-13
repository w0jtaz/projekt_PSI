from django.contrib import admin
from django.urls import path, include

from api.views import *

app_name = "zapisyAPP"

urlpatterns = [
    path("zawodnik/<id>/", api_get_zawodnik, name="zawodnik_detail"),
    path("wydarzenie/<id>/", api_get_wydarzenie, name="wydarzenie_detail"),
    path("zapisy/<id>/", api_get_zapisy, name="zapisy_detail"),
    path("klient/<id>/", api_get_klient, name="klient_detail"),
    path("wyniki/<id>/", api_get_wyniki, name="wyniki_detail"),
    path("dystans/<id>/", api_get_dystans, name="dystans_detail"),
]
