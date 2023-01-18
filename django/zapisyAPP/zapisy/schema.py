import graphene
from django.forms import Field
from graphene_django import DjangoObjectType
from .models import zawodnik, klient, zapisy, wydarzenie
from django.db.models import Q
from graphene_django import DjangoObjectType
from graphene import ObjectType, String, List


class KlientType(DjangoObjectType):
    class Meta:
        model = klient


class ZawodnikType:
    class Meta:
        model = zawodnik


class Query(graphene.ObjectType):
    klients = graphene.List(KlientType)
    klient = graphene.Field(KlientType, id=graphene.Int())

    def resolve_klients(self, info):
        return klient.objects.all()

    def resolve_klient(self, info, id):
        return klient.objects.get(pk=id)


class CreateKlient(graphene.Mutation):
    class Arguments:
        id = graphene.Int()
        nazwa = graphene.String()
        email = graphene.String()
        telefon = graphene.String()
        adres = graphene.String()

    _klient = graphene.Field(KlientType)

        def mutate(self, info, nazwa, email, telefon, adres):
        _klient = klient.objects.create(nazwa=nazwa, email=email, telefon=telefon, adres=adres)
        return CreateKlient(klient=_klient)


class UpdateKlient(graphene.Mutation):
    class Arguments:
        id = graphene.Int()
        nazwa = graphene.String()
        email = graphene.String()
        telefon = graphene.String()
        adres = graphene.String()

    _klient = graphene.Field(KlientType)

    def mutate(self, info, id, nazwa, email, telefon, adres):
        _klient = klient.objects.get(id=id)
        _klient.nazwa = nazwa
        _klient.email = email
        _klient.telefon = telefon
        _klient.adres = adres
        _klient.save()
        return UpdateKlient(klient=_klient)


class DeleteKlient(graphene.Mutation):
    class Arguments:
        id = graphene.Int()

    klient = graphene.Field(KlientType)

    def mutate(self, info, id):
        _klient = klient.objects.get(pk=id)
        _klient.delete()
        return DeleteKlient(klient=_klient)


class Mutation(graphene.ObjectType):
    create_klient = CreateKlient.Field()
    update_klient = UpdateKlient.Field()
    delete_klient = DeleteKlient.Field()


schema = graphene.Schema(query=Query, mutation=Mutation)
