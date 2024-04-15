from django.shortcuts import render
from rest_framework import viewsets
from rest_framework import permissions
from .models import Estudio, Cita, ResultadoEstudio, Consumible
from .serializer import estudioSerializer, citaSerializer, resultadoEstudioSerializer, consumibleSerializer

# Create your views here.
class estudioViewSet(viewsets.ViewSet):
    queryset = Estudio.objects.all()
    serializer_class = estudioSerializer

class citaViewSet(viewsets.ViewSet):
    queryset = Cita.objects.all()
    serializer_class = citaSerializer
    permission_classes = [permissions.IsAuthenticated]

class resultadoEstudioViewSet(viewsets.ViewSet):
    queryset = ResultadoEstudio.objects.all()
    serializer_class = resultadoEstudioSerializer
    permission_classes = [permissions.IsAuthenticated]

class consumibleViewSet(viewsets.ViewSet):
    queryset = Consumible.objects.all()
    serializer_class = consumibleSerializer
    permission_classes = [permissions.IsAuthenticated]
