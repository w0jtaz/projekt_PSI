from django.shortcuts import render
from rest_framework.reverse import reverse
from rest_framework import status, generics
from rest_framework.decorators import APIView
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from api.serializers import wynikiSerializer
from .serializers import zapisySerializer, zawodnikSerializer, klientSerializer, wydarzenieSerializer
from zapisy.models import zapisy, zawodnik, klient, wydarzenie, wyniki


class ZawodnikList(generics.ListCreateAPIView):
    queryset = zawodnik.objects.all()
    serializer_class = zawodnikSerializer
    name = 'zawodnik-list'
    filterset_fields = ['id']
    search_fields = ['id']
    ordering_fields = ['id']

class ZawodnikDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = zawodnik.objects.all()
    serializer_class = zawodnikSerializer
    name = 'zawodnik-detail'

class KlientList(generics.ListCreateAPIView):
    queryset = klient.objects.all()
    serializer_class = klientSerializer
    name = 'klient-list'
    filterset_fields = ['id']
    search_fields = ['id']
    ordering_fields = ['id']

class KlientDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = klient.objects.all()
    serializer_class = klientSerializer
    name = 'klient-detail'

class WydarzenieList(generics.ListCreateAPIView):
    queryset = wydarzenie.objects.all()
    serializer_class = wydarzenieSerializer
    name = 'wydarzenie-list'

class WydarzenieDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = wydarzenie.objects.all()
    serializer_class = wydarzenieSerializer
    name = 'wydarzenie-detail'

class ZapisyList(generics.ListCreateAPIView):
    queryset = zapisy.objects.all()
    serializer_class = zapisySerializer
    name = 'zapisy-list'

class ZapisyDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = zapisy.objects.all()
    serializer_class = zapisySerializer
    name = 'zapisy-detail'

class WynikiList(generics.ListCreateAPIView):
    queryset = wyniki.objects.all()
    serializer_class = wynikiSerializer
    name = 'wyniki-list'

class WynikiDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = wyniki.objects.all()
    serializer_class = wynikiSerializer
    name = 'wyniki-detail'
#
class ApiRoot(generics.GenericAPIView):
    name = 'api-root'
    def get(self, request, *args, **kwargs):
        return Response({'zawodnik': reverse(ZawodnikList.name, request=request),
                          'klient': reverse(KlientList.name, request=request),
                          'wydarzenie': reverse(WydarzenieList.name, request=request),
                          'zapisy': reverse(ZapisyList.name, request=request),
                          'wyniki': reverse(WynikiList.name, request=request)
})

# class ZapisyCreateView(APIView):
#     serializer_class = zapisySerializer
#     def get(self, request: Request, *args, **kwargs):
#         permission_classes = [IsAuthenticated]
#         zapis = zapisy.objects.all()
#
#         serializer = self.serializer_class(instance=zapis, many=True)
#
#         return Response(data=serializer.data, status=status.HTTP_200_OK)
#
#     def post(self, request: Request, *args, **kwargs):
#         permission_classes = [IsAuthenticated]
#
#         data = request.data
#
#         serializer = self.serializer_class(data=data)
#
#         if serializer.is_valid():
#             serializer.save()
#
#             response = {
#                 "message": "Zapis utworzony",
#                 "data": serializer.data
#             }
#
#             return Response(data=response, status=status.HTTP_201_CREATED)
#         return Response(data={"message": "Nie znaleziono danych."})