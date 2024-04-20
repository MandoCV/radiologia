from rest_framework import viewsets
from .models import Estudio, Cita, ResultadoEstudio
from .serializer import estudioSerializer, citaSerializer, resultadoEstudioSerializer

# Create your views here.
class estudioViewSet(viewsets.ModelViewSet):
    queryset = Estudio.objects.all()
    serializer_class = estudioSerializer
    
    def get_serializer_class(self):
        if self.action == 'create' or self.action == 'update':
            return estudioSerializer
        return estudioSerializer

class citaViewSet(viewsets.ModelViewSet):
    queryset = Cita.objects.all()
    serializer_class = citaSerializer
    
    def get_serializer_class(self):
        if self.action == 'create' or self.action == 'update':
            return citaSerializer
        return citaSerializer

class resultadoEstudioViewSet(viewsets.ModelViewSet):
    queryset = ResultadoEstudio.objects.all()
    serializer_class = resultadoEstudioSerializer

    def get_serializer_class(self):
        if self.action == 'create' or self.action == 'update':
            return resultadoEstudioSerializer
        return resultadoEstudioSerializer
