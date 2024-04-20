#Definiendo las rutas
from django.urls import path, include
from rest_framework import routers
from rest_framework.documentation import include_docs_urls
from radiologia_imagen import views
from rest_framework.decorators import authentication_classes, permission_classes

#api version
router = routers.DefaultRouter()
#Registrando cada una de las vistas
router.register(r'estudio', views.estudioViewSet, 'estudio')
router.register(r'cita', views.citaViewSet, 'cita')
router.register(r'resultadoEstudio', views.resultadoEstudioViewSet, 'resultadoEstudio')

urlpatterns = [
    path('api/v1/', include(router.urls)),
    #path('docs/', include_docs_urls(title='Documentacion Hospital - Radiologia', permission_classes=[], authentication_classes=[]))
]
