from django.http import HttpResponse
from django.shortcuts import render
from rest_framework import status
from rest_framework.decorators import APIView
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from api.serializers import zapisySerializer
from zapisy.models import zapisy


# Create your views here.
def index(request):
    return render(request, "index.html")


class ZapisyCreateView(APIView):
    serializer_class = zapisySerializer
    def get(self, request: Request, *args, **kwargs):
        permission_classes = [IsAuthenticated]
        zapis = zapisy.objects.all()

        serializer = self.serializer_class(instance=zapis, many=True)

        return Response(data=serializer.data, status=status.HTTP_200_OK)

    def post(self, request: Request, *args, **kwargs):
        permission_classes = [IsAuthenticated]

        data = request.data

        serializer = self.serializer_class(data=data)

        if serializer.is_valid():
            serializer.save()

            response = {
                "message": "Zapis utworzony",
                "data": serializer.data
            }

            return Response(data=response, status=status.HTTP_201_CREATED)
        return Response(data={"message": "Nie znaleziono danych."})

