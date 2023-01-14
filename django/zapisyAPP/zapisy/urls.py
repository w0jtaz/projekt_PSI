from django.urls import path
from . import views
from django.contrib import admin

from .views import ZapisyCreateView

urlpatterns = [
    path("", ZapisyCreateView.as_view(), name="list_zapisy"),
]
