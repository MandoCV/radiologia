<template>
    <b-container fluid>
        <b-button @click="openConfirmModal">Descargar Imagen</b-button>

      <b-row>
        <!-- Frecuencia de Citas -->
        <b-col lg="6">
          <iq-card class="h-100">
            <template v-slot:headerTitle>
              <h4 class="card-title">Frecuencia de Citas</h4>
            </template>
            <template v-slot:body>
              <ApexChart element="home-chart-06" :chartOption="darkChart1" v-if="$route.meta.dark" />
              <ApexChart element="home-chart-06" :chartOption="chart1" v-else />
            </template>
          </iq-card>
        </b-col>
        <!-- Estudios Realizados -->
        <b-col lg="6">
          <iq-card class="h-100">
            <template v-slot:headerTitle>
              <h4 class="card-title">Estudios Realizados</h4>
            </template>
            <template v-slot:body>
              <AmChart element="home-chart-03" :type="radialChat.type" :option="radialChat.data" :height="radialChat.height" />
            </template>
          </iq-card>
        </b-col>
      </b-row>
      <!-- Tareas -->
      <b-row class="mt-3">

        <b-col lg="6">
    <iq-card>
        <template v-slot:headerTitle>
            <h4 class="card-title">Tareas del Día</h4>
        </template>
        <template v-slot:body>
            <div class="d-flex justify-content-between tasks-card" role="alert">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="customCheck11" />
                    <label class="custom-control-label" for="customCheck11">Calibrar equipos de radiología.</label>
                </div>
                <div>
                    <i class="ri-close-line float-end"></i>
                </div>
            </div>
            <div class="d-flex justify-content-between tasks-card" role="alert">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="customCheck10" />
                    <label class="custom-control-label" for="customCheck10">Preparar sala de radiología para pacientes.</label>
                </div>
                <div>
                    <i class="ri-close-line float-end"></i>
                </div>
            </div>
            <div class="d-flex justify-content-between tasks-card" role="alert">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="customCheck12" />
                    <label class="custom-control-label" for="customCheck12">Realizar estudios radiológicos a pacientes programados.</label>
                </div>
                <div>
                    <i class="ri-close-line float-end"></i>
                </div>
            </div>
            <!-- Agrega más tarjetas de tareas aquí según sea necesario -->
        </template>
    </iq-card>
</b-col>

      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Inventario Consumibles</h4>
          </template>
          <template v-slot:body>
            <ul class="patient-progress m-0 p-0">
              <li class="d-flex mb-3 align-items-center">
                <div class="media-support-info">
                  <h6>Película radiográfica</h6>
                </div>
                <span class="badge badge-success">Disponible</span>
              </li>
              <li class="d-flex mb-3 align-items-center">
                <div class="media-support-info">
                  <h6>Jeringas y agujas</h6>
                </div>
                <span class="badge badge-success">Disponible</span>
              </li>
              <li class="d-flex mb-3 align-items-center">
                <div class="media-support-info">
                  <h6>Protectores de plomo</h6>
                </div>
                <span class="badge badge-danger">Agotado</span>
              </li>
            </ul>
          </template>
        </iq-card>
      </b-col>
    
    </b-row>

  <!-- Modal de confirmación -->
  <b-modal id="confirmModal" v-model="showConfirm" title="Confirmación de Descarga" ok-title="Descargar" cancel-title="Cancelar" @ok="downloadImage">
      <!-- Contenido del modal -->
      <b-alert show variant="primary">
        <div class="iq-alert-icon">
          <i class="ri-alert-line"></i>
        </div>
        <div class="iq-alert-text">¿Estás seguro de que deseas descargar la imagen de los dashboards?</div>
      </b-alert>
    </b-modal>
  </b-container>
</template>
  <script>
import IqCard from '../../components/xray/cards/iq-card'
import { xray } from '../../config/pluginInit'
const body = document.getElementsByTagName('body')
import ApexChart from '../../components/xray/charts/ApexChart'
import AmChart from '../../components/xray/charts/AmChart'
import 'swiper/swiper-bundle.css'

  export default {
    name: 'dashRadio',
    components: { IqCard, ApexChart, AmChart},
    data() {
      return {
        config: {
          dateFormat: 'Y-m-d',
          inline: true
        },
        doctorList: [
        {
          name: 'Dr. Paul Molive',
          img: require('../../assets/images/user/05.jpg'),
          position: 'Doctor',
          worksAt: 'California Hospital Medical Center'
        },
        {
          name: 'Dr. Paul Molive',
          img: require('../../assets/images/user/06.jpg'),
          position: 'Nurse',
          worksAt: 'California Hospital Medical Center'
        },
        {
          name: 'Dr. Paul Molive',
          img: require('../../assets/images/user/07.jpg'),
          position: 'Surgeon',
          worksAt: 'California Hospital Medical Center'
        },
        {
          name: 'Dr. Paul Molive',
          img: require('../../assets/images/user/08.jpg'),
          position: 'Doctor',
          worksAt: 'California Hospital Medical Center'
        },
        {
          name: 'Dr. Paul Molive',
          img: require('../../assets/images/user/09.jpg'),
          position: 'Surgeon',
          worksAt: 'California Hospital Medical Center'
        },
        {
          name: 'Dr. Paul Molive',
          img: require('../../assets/images/user/10.jpg'),
          position: 'OT Assistent',
          worksAt: 'California Hospital Medical Center'
        },
        {
          name: 'Dr. Paul Molive',
          img: require('../../assets/images/user/05.jpg'),
          position: 'Doctor',
          worksAt: 'California Hospital Medical Center'
        },
        {
          name: 'Dr. Paul Molive',
          img: require('../../assets/images/user/09.jpg'),
          position: 'Nurse',
          worksAt: 'California Hospital Medical Center'
        }
      ],
      chart1: {
          series: [
            {
              name: 'series1',
              data: [31, 40, 28, 51, 42, 100]
            }
          ],
          chart: {
            height: 340,
            type: 'area'
          },
          grid: {
            show: true,
            yaxis: {
              lines: {
                show: true
              }
            }
          },
          colors: ['#089bab'],
          dataLabels: {
            enabled: false
          },
          stroke: {
            curve: 'smooth'
          },
          xaxis: {
            type: 'string',
            categories: ['Enero','Febrero','Marzo','Abril','Mayo','Junio'],
          },
          tooltip: {
            x: {
              format: 'dd/MM/yy HH:mm'
            }
          }
        },
        darkChart1: {
          series: [
            {
              name: 'series1',
              data: [31, 40, 28, 51, 42, 109, 100]
            }
          ],
          chart: {
            height: 350,
            type: 'area'
          },
          colors: ['#089bab'],
          dataLabels: {
            enabled: false
          },
          stroke: {
            curve: 'smooth'
          },
          xaxis: {
            type: 'datetime',
            categories: ['2018-09-19T00:00:00.000Z', '2018-09-19T01:30:00.000Z', '2018-09-19T02:30:00.000Z', '2018-09-19T03:30:00.000Z', '2018-09-19T04:30:00.000Z', '2018-09-19T05:30:00.000Z', '2018-09-19T06:30:00.000Z']
          },
          tooltip: {
            x: {
              format: 'dd/MM/yy HH:mm'
            }
          }
        },
        radialChat: {
          type: 'radial-pie',
          height: 280,
          data: [
            {
              country: 'Radiograía',
              value: 401
            },
            {
              country: 'Tomografía',
              value: 300
            },
            {
              country: 'Resonancia magnética',
              value: 200
            },
            {
              country: 'Ecografía ',
              value: 100
            }
          ]
        },
        showConfirm: false, 
        // Otros datos de gráficos, etc.
      }
    },
    methods: {
    openConfirmModal() {
      this.showConfirm = true; // Mostrar el modal de confirmación
    },

    downloadImage() {
      // Aquí puedes agregar el código para descargar la imagen de los dashboards
      // Por ejemplo:
      const canvas = document.createElement('canvas');
      // Lógica para crear la imagen en el canvas
      // Luego puedes descargarla con un enlace
      const link = document.createElement('a');
      link.href = canvas.toDataURL('image/png');
      link.download = 'dashboards.png';
      link.click();

      this.showConfirm = false; // Cerrar el modal después de la descarga
    },
    fetchData() {
      // Lógica para obtener datos
    },
    formatData() {
      // Lógica para formatear datos
    },
    handleClick() {
      // Lógica para manejar clicks en elementos del template
    }
  },
  mounted() {
    // Lógica al montar el componente
    xray.index()
    body[0].classList.add('sidebar-main-menu')
  },beforeUnmount() {
  // Lógica antes de desmontar el componente
  body[0].classList.remove('sidebar-main-menu')
}

}
</script>
