"""zapisyAPP URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.contrib.auth.decorators import login_required
from django.urls import path, include
from graphene_django.views import GraphQLView

from zapisy.schema import schema
from zapisy.views import ZawodnikDetail
from . import views

urlpatterns = [
    path("", views.redirect_view, name='index'),
    path("api/", include("zapisy.urls")),
    path("login/", views.login_view, name='login'),
    path("logout/", views.logout_view, name='logout'),
    path("zawodnik/", views.zawodnik_view, name='zawodnik'),
    path("zawodnik/new", views.zawodnik_new_view.as_view(), name='zawodnik_new'),
    path("zawodnik/<int:id>", views.zawodnik_view, name='zawodnik'),
    path("zapisy/", views.zapisy_view, name='zapisy'),
    path("zapisy/new/", views.zapisy_new_view.as_view(), name='zapisy_new'),
    path("zawody/", views.zawody_view, name='zawody'),
    # path("zawody/new", views.zawody_new_view.as_view(), name='zawody_new'),
    path("wyniki/", views.wyniki_view, name='wyniki'),
    path("wyniki/new", views.wyniki_new_view.as_view(), name='wyniki_new'),
    path("klient/", views.klient_view, name='klient'),
    path("klient/new/", views.klient_new_view.as_view(), name='klient_new'),
    path("graphql", GraphQLView.as_view(graphiql=True, schema=schema)),
    path("admin/", admin.site.urls),
]
