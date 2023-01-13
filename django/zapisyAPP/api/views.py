from rest_framework import status
from rest_framework.response import Response
from rest_framework.request import Request
from rest_framework.decorators import api_view
from rest_framework import generics, status
from zapisy.models import *
from api.serializers import *


@api_view(
    ["GET",]
)
def api_get_zawodnik(request, id):
    try:
        blog_post = zawodnik.objects.get(id=id)
    except zawodnik.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == "GET":
        serializer = zawodnikSerializer(blog_post)
        return Response(serializer.data)


@api_view(
    ["GET",]
)
def api_get_klient(request, id):
    try:
        klient_post = klient.objects.get(id=id)
    except klient.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == "GET":
        serializer = klientSerializer(klient_post)
        return Response(serializer.data)


@api_view(
    ["GET",]
)
def api_get_wydarzenie(request, id):
    try:
        wydarzenie_post = wydarzenie.objects.get(id=id)
    except wydarzenie.DoesNotExist:
        return Response(status =status.HTTP_404_NOT_FOUND)

    if request.method == "GET":
        serializer = wydarzenieSerializer(wydarzenie_post)
        return Response(serializer.data)


@api_view(
    ["GET",]
)
def api_get_zapisy(request, id):
    try:
        zapisy_post = zapisy.objects.get(id=id)
    except zapisy.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == "GET":
        serializer = zapisySerializer(zapisy_post)
        return Response(serializer.data)


@api_view(
    ["GET",]
)
def api_get_wyniki(request, id):
    try:
        wyniki_post = wyniki.objects.get(id=id)
    except wyniki.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == "GET":
        serializer = wynikiSerializer(wyniki_post)
        return Response(serializer.data)


@api_view(
    ["GET",]
)
def api_get_dystans(request, id):
    try:
        dystans_post = dystans.objects.get(id=id)
    except dystans.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == "GET":
        serializer = dystansSerializer(dystans_post)
        return Response(serializer.data)
