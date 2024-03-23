<template>
  <b-container fluid>
    <b-row>
      <b-col md="12">
        <b-button @click="abrirModalFiltros">Aplicar Filtros</b-button>
        <b-button @click="limpiarFiltros">Limpiar Filtros</b-button>
        <b-modal id="filterModal" v-model="showFilterModal" title="Filtros" ok-title="Aplicar" cancel-title="Cancelar" @ok="aplicarFiltros">
          <b-form @submit.stop.prevent="aplicarFiltros">
            <b-form-group label="Filtrar por Tipo de Estudio">
              <b-form-input v-model="filtroTipoEstudio" type="text"></b-form-input>
            </b-form-group>
            <b-form-group label="Filtrar por Fecha">
              <b-form-input v-model="filtroFecha" type="date"></b-form-input>
            </b-form-group>
            <b-form-group label="Filtrar por Paciente">
              <b-form-input v-model="filtroPaciente" type="text"></b-form-input>
            </b-form-group>
          </b-form>
        </b-modal>
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Tabla Citas Filtrado y Ordenamiento</h4>
          </template>
          <template v-slot:body>
            <div class="table-responsive">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                    <th v-for="column in columns" :key="column.field" :class="column.headerClass">
                      {{ column.label }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in citasFiltradas" :key="item.id">
                    <td>{{ item.id }}</td>
                    <td>{{ item.fecha }}</td>
                    <td>{{ item.hora }}</td>
                    <td>{{ item.paciente }}</td>
                    <td>{{ item.medico }}</td>
                    <td>{{ item.tipo_estudio }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </template>
        </iq-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { xray } from '../../config/pluginInit'
import iqCard from '../../components/xray/cards/iq-card'

export default {
  name: 'tablaRadio',
  components: { iqCard },
  mounted() {
    xray.index()
  },
  data() {
    return {
      columns: [
        { label: 'ID', field: 'id', headerClass: 'text-left' },
        { label: 'Fecha', field: 'fecha', headerClass: 'text-left' },
        { label: 'Hora', field: 'hora', headerClass: 'text-left' },
        { label: 'Paciente', field: 'paciente', headerClass: 'text-left' },
        { label: 'Médico', field: 'medico', headerClass: 'text-left' },
        { label: 'Tipo de Estudio', field: 'tipo_estudio', headerClass: 'text-left' }
      ],
      
      rows: [
  {
    id: 1,
    fecha: '2024-03-18',
    hora: '08:00',
    paciente: 'Juan Pérez',
    medico: 'Dra. María González',
    tipo_estudio: 'Radiografía de tórax'
  },
  {
    id: 2,
    fecha: '2024-03-20',
    hora: '09:30',
    paciente: 'Luisa Martínez',
    medico: 'Dr. Carlos Rodríguez',
    tipo_estudio: 'Resonancia magnética'
  },
  {
    id: 3,
    fecha: '2024-03-21',
    hora: '10:15',
    paciente: 'Pedro López',
    medico: 'Dra. Ana García',
    tipo_estudio: 'Tomografía computarizada'
  },
  {
    id: 4,
    fecha: '2024-03-22',
    hora: '11:00',
    paciente: 'María Torres',
    medico: 'Dr. Javier Ramírez',
    tipo_estudio: 'Ecografía abdominal'
  },
  {
    id: 5,
    fecha: '2024-03-23',
    hora: '14:45',
    paciente: 'Roberto Sánchez',
    medico: 'Dra. Laura Martínez',
    tipo_estudio: 'Resonancia magnética'
  },
  {
    id: 6,
    fecha: '2024-03-25',
    hora: '16:30',
    paciente: 'Carmen García',
    medico: 'Dr. José López',
    tipo_estudio: 'Radiografía de pierna'
  },
  {
    id: 7,
    fecha: '2024-03-26',
    hora: '08:30',
    paciente: 'Ricardo Pérez',
    medico: 'Dra. Ana García',
    tipo_estudio: 'Ecografía cardiaca'
  },
  {
    id: 8,
    fecha: '2024-03-27',
    hora: '09:45',
    paciente: 'Laura Martínez',
    medico: 'Dr. Carlos Rodríguez',
    tipo_estudio: 'Tomografía computarizada'
  },
  {
    id: 9,
    fecha: '2024-03-28',
    hora: '10:30',
    paciente: 'Sofía Gómez',
    medico: 'Dra. María González',
    tipo_estudio: 'Radiografía de brazo'
  },
  {
    id: 10,
    fecha: '2024-03-29',
    hora: '11:15',
    paciente: 'Javier Ramírez',
    medico: 'Dr. José López',
    tipo_estudio: 'Ecografía abdominal'
  },
  {
    id: 11,
    fecha: '2024-03-30',
    hora: '14:00',
    paciente: 'Ana García',
    medico: 'Dra. Laura Martínez',
    tipo_estudio: 'Resonancia magnética'
  },
  {
    id: 12,
    fecha: '2024-03-31',
    hora: '15:45',
    paciente: 'José López',
    medico: 'Dr. Carlos Rodríguez',
    tipo_estudio: 'Radiografía de pierna'
  },
  {
    id: 13,
    fecha: '2024-04-01',
    hora: '08:45',
    paciente: 'María González',
    medico: 'Dra. Ana García',
    tipo_estudio: 'Ecografía cardiaca'
  },
  {
    id: 14,
    fecha: '2024-04-02',
    hora: '09:30',
    paciente: 'Carlos Rodríguez',
    medico: 'Dr. Javier Ramírez',
    tipo_estudio: 'Tomografía computarizada'
  },
  {
    id: 15,
    fecha: '2024-04-03',
    hora: '10:15',
    paciente: 'Laura Martínez',
    medico: 'Dra. María González',
    tipo_estudio: 'Radiografía de brazo'
  },
  {
    id: 16,
    fecha: '2024-04-04',
    hora: '11:00',
    paciente: 'Javier Ramírez',
    medico: 'Dr. Carlos Rodríguez',
    tipo_estudio: 'Ecografía abdominal'
  },
  {
    id: 17,
    fecha: '2024-04-05',
    hora: '14:45',
    paciente: 'Ana García',
    medico: 'Dra. Laura Martínez',
    tipo_estudio: 'Resonancia magnética'
  },
  {
    id: 18,
    fecha: '2024-04-06',
    hora: '16:30',
    paciente: 'José López',
    medico: 'Dr. José López',
    tipo_estudio: 'Radiografía de pierna'
  },
  {
    id: 19,
    fecha: '2024-04-07',
    hora: '08:30',
    paciente: 'María González',
    medico: 'Dra. Ana García',
    tipo_estudio: 'Ecografía cardiaca'
  },
  {
    id: 20,
    fecha: '2024-04-08',
    hora: '09:45',
    paciente: 'Carlos Rodríguez',
    medico: 'Dr. Javier Ramírez',
    tipo_estudio: 'Tomografía computarizada'
  }
],
      filtroTipoEstudio: '',
      filtroFecha: '',
      filtroPaciente: '',
      showFilterModal: false
    }
  },
  computed: {
    citasFiltradas() {
      let citas = this.rows.filter(item =>
        (!this.filtroTipoEstudio || item.tipo_estudio.toLowerCase().includes(this.filtroTipoEstudio.toLowerCase())) &&
        (!this.filtroFecha || item.fecha === this.filtroFecha) &&
        (!this.filtroPaciente || item.paciente.toLowerCase().includes(this.filtroPaciente.toLowerCase()))
      );

      return citas;
    }
  },
  methods: {
    abrirModalFiltros() {
      this.showFilterModal = true;
    },
    aplicarFiltros() {
      this.showFilterModal = false;
    },
    limpiarFiltros() {
      this.filtroTipoEstudio = '';
      this.filtroFecha = '';
      this.filtroPaciente = '';
      this.showFilterModal = false;
    }
  }
}
</script>
