from django.urls import path
from . import views
from django.contrib import admin

urlpatterns = [
    path("zawodnik", views.ZawodnikList.as_view(), name=views.ZawodnikList.name),
    path("zawodnik/<int:pk>", views.ZawodnikList.as_view(), name=views.ZawodnikDetail.name),
    path("klient", views.KlientList.as_view(), name=views.KlientList.name),
    path("klient/<int:pk>", views.KlientDetail.as_view(), name=views.KlientDetail.name),
    path("wydarzenie", views.WydarzenieList.as_view(), name=views.WydarzenieList.name),
    path("wydarzenie/<int:pk>", views.WydarzenieDetail.as_view(), name=views.WydarzenieDetail.name),
    path("zapisy", views.ZapisyList.as_view(), name=views.ZapisyList.name),
    path("zapisy/<int:pk>", views.ZapisyDetail.as_view(), name=views.ZapisyDetail.name),
    path("wyniki", views.WynikiList.as_view(), name=views.WynikiList.name),
    path("wyniki/<int:pk>", views.WynikiDetail.as_view(), name=views.WynikiDetail.name),
    path("", views.ApiRoot.as_view(), name=views.ApiRoot.name)
]
