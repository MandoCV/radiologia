from django.db import models

# Create your models here.
class Estudio(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=500)

class Cita(models.Model):
    fecha = models.DateField()
    hora = models.TimeField()
    # paciente = models.ForeignKey('Paciente', on_delete=models.CASCADE)
    # medico = models.ForeignKey('PersonalMedico', on_delete=models.CASCADE)
    tipo_estudio = models.ForeignKey(Estudio, on_delete=models.CASCADE)

class ResultadoEstudio(models.Model):
    estudio = models.ForeignKey(Estudio, on_delete=models.CASCADE)
    cita = models.ForeignKey(Cita, on_delete=models.CASCADE)
    resultado = models.CharField(max_length=500)
    imagen = models.BinaryField()