from rest_framework import serializers
from .models import Estudio, Cita, ResultadoEstudio, Consumible

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

class consumibleSerializer(serializers.Serializer):
    class Meta:
        model= Consumible
        fields= '__all__'