#Definiendo las rutas
from django.urls import path, include
from rest_framework import routers

#api version
router = routers.Router()
#Registrando cada una de las vistas
router.register()

urlPatterns = [
    path('api/v1/', include(router.urls))
]
