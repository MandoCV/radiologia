from rest_framework import serializers
from .models import Estudio, Cita, ResultadoEstudio

class estudioSerializer(serializers.Serializer):
    class Meta:
        model= Estudio
        fields= '__all__'

class citaSerializer(serializers.Serializer):
    class Meta:
        model= Cita
        fields= '__all__'

class resultadoEstudioSerializer(serializers.Serializer):
    class Meta:
        model= ResultadoEstudio
        fields= '__all__'

