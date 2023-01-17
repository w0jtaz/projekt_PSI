from rest_framework import status
from rest_framework.response import Response
from rest_framework.request import Request
from rest_framework import generics, status
from django.contrib.auth import authenticate
from api.serializers import *
from rest_framework.views import APIView


# Create your views here.
class GetUsersView(APIView):
    serializer_class = user_Serializer

    def get_users(self):
        user = User.objects.all()
        serializer = self.serializer_class(instance=user, many=True)
        return Response(data=serializer.data, status=status.HTTP_200_OK)


class SignUpView(generics.GenericAPIView):
    serializer_class = sign_up_Serializer

    def post(self, request: Request):
        data = request.data

        serializer = self.serializer_class(data=data)
        if serializer.is_valid():
            serializer.save()

            response = {
                "message": "Użytkownik został utworzony",
                "data": serializer.data
            }

            return Response(data=response, status=status.HTTP_201_CREATED)
        return Response(data=serializer.errors, status=status.HTTP_404_NOT_FOUND)


class LoginView(APIView):
    def post(self, request: Request):
        email = request.data.get('email')
        password = request.data.get('password')

        user = authenticate(email=email, password=password)

        if user is not None:
            response = {
                "message": "Pomyślnie zalogowano",
                "token": user.auth_token.key
            }
            return Response(data=response, status=status.HTTP_200_OK)

        return Response(data={"message": "Nie prawidłowy email lub hasło"})

    def get(self, request: Request):
        content = {
            "user": str(request.user),
            "auth": str(request.auth)
        }

        return Response(data=content, status=status.HTTP_200_OK)
