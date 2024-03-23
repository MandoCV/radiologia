<template>
    <b-container fluid>
      <b-row>
        <b-col md="12">
          <iq-card>
            <template v-slot:headerTitle>
              <h4 class="card-title">CRUD CITAS</h4>
            </template>
            <template v-slot:body>
              <div class="table-ad mb-3 me-2">
                <b-button variant="btn btn-sm iq-bg-success float-end" @click="openAddModal">+ Nueva Cita</b-button>
              </div>
              <b-col md="12" class="table-responsive w-100">
                <b-table striped bordered hover :items="rows" :fields="columns">
                  <!-- Columnas de la tabla -->
                  <template v-slot:cell(fecha)="data">
                    <span v-if="!data.item.editable">{{ data.item.fecha }}</span>
                    <input type="date" v-model="data.item.fecha" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(hora)="data">
                    <span v-if="!data.item.editable">{{ data.item.hora }}</span>
                    <input type="time" v-model="data.item.hora" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(paciente)="data">
                    <span v-if="!data.item.editable">{{ data.item.paciente }}</span>
                    <input type="text" v-model="data.item.paciente" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(medico)="data">
                    <span v-if="!data.item.editable">{{ data.item.medico }}</span>
                    <input type="text" v-model="data.item.medico" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(tipo_estudio)="data">
                    <span v-if="!data.item.editable">{{ data.item.tipo_estudio }}</span>
                    <input type="text" v-model="data.item.tipo_estudio" v-else class="form-control text-center" />
                  </template>
                  <!-- Agregar template para la columna de Editar -->
                  <template v-slot:cell(edit)="data">
                    <b-button variant="info" size="sm" @click="openEditModal(data.item)">Editar</b-button>
                  </template>
                  <template v-slot:cell(remove)="data">
                    <b-button variant=" iq-bg-danger" size="sm" @click="showConfirmModal(data.item)">Eliminar</b-button>
                  </template>
                </b-table>
              </b-col>
            </template>
          </iq-card>
        </b-col>
      </b-row>
    </b-container>
  
    <!-- Modal de confirmación para eliminar cita -->
    <b-modal id="confirmModal" v-model="showConfirm" title="Confirmación de Eliminación" ok-title="Eliminar" cancel-title="Cancelar" @ok="deleteCita">
      <!-- Contenido del modal -->
      <b-alert show variant="danger">
        <div class="iq-alert-icon">
          <i class="ri-alert-line"></i>
        </div>
        <div class="iq-alert-text">¿Estás seguro de que deseas eliminar esta cita?</div>
      </b-alert>
    </b-modal>
  
    <!-- Modal para añadir nueva cita -->
    <b-modal id="addModal" v-model="showAddModal" title="Añadir Nueva Cita" ok-title="Guardar" cancel-title="Cancelar" @ok="addCita">
      <!-- Contenido del modal -->
      <b-form @submit.stop.prevent="addCita">
        <b-form-group label="Fecha">
          <b-form-input v-model="newCita.fecha" type="date" required></b-form-input>
        </b-form-group>
        <b-form-group label="Hora">
          <b-form-input v-model="newCita.hora" type="time" required></b-form-input>
        </b-form-group>
        <b-form-group label="Paciente">
          <b-form-input v-model="newCita.paciente" type="text" required></b-form-input>
        </b-form-group>
        <b-form-group label="Médico">
          <b-form-input v-model="newCita.medico" type="text" required></b-form-input>
        </b-form-group>
        <b-form-group label="Tipo de Estudio">
          <b-form-input v-model="newCita.tipo_estudio" type="text" required></b-form-input>
        </b-form-group>
      </b-form>
    </b-modal>
  
    <!-- Modal para editar cita -->
    <b-modal id="editModal" v-model="showEditModal" title="Editar Cita" ok-title="Guardar" cancel-title="Cancelar" @ok="saveChanges">
      <!-- Contenido del modal -->
      <b-form @submit.stop.prevent="saveChanges">
        <b-form-group label="Fecha">
          <b-form-input v-model="editCita.fecha" type="date" required></b-form-input>
        </b-form-group>
        <b-form-group label="Hora">
          <b-form-input v-model="editCita.hora" type="time" required></b-form-input>
        </b-form-group>
        <b-form-group label="Paciente">
          <b-form-input v-model="editCita.paciente" type="text" required></b-form-input>
        </b-form-group>
        <b-form-group label="Médico">
          <b-form-input v-model="editCita.medico" type="text" required></b-form-input>
        </b-form-group>
        <b-form-group label="Tipo de Estudio">
          <b-form-input v-model="editCita.tipo_estudio" type="text" required></b-form-input>
        </b-form-group>
      </b-form>
    </b-modal>
  </template>
  
  <script>
  import { xray } from '../../config/pluginInit'
  import iqCard from '../../components/xray/cards/iq-card'
  
  export default {
    name: 'crudCitas',
    components: { iqCard },
    mounted() {
      xray.index()
    },
    data() {
      return {
        columns: [
          { label: 'Fecha', key: 'fecha', class: 'text-center' },
          { label: 'Hora', key: 'hora', class: 'text-center' },
          { label: 'Paciente', key: 'paciente', class: 'text-center' },
          { label: 'Médico', key: 'medico', class: 'text-center' },
          { label: 'Tipo de Estudio', key: 'tipo_estudio', class: 'text-center' },
          { label: 'Editar', key: 'edit', class: 'text-center' }, // Nueva columna de Editar
          { label: 'Eliminar', key: 'remove', class: 'text-center' }
        ],
        rows: [
          {
            id: 1,
            fecha: '2024-03-18',
            hora: '08:00',
            paciente: 'Juan Pérez',
            medico: 'Dra. María González',
            tipo_estudio: 'Radiografía de tórax',
            editable: false
          },
          // Más datos de citas
        ],
        showConfirm: false,
        showAddModal: false,
        showEditModal: false, // Estado para mostrar modal de edición
        newCita: {
          fecha: '',
          hora: '',
          paciente: '',
          medico: '',
          tipo_estudio: ''
        },
        editCita: {
          fecha: '',
          hora: '',
          paciente: '',
          medico: '',
          tipo_estudio: ''
        },
        itemToDelete: null
      }
    },
    methods: {
      add() {
        let obj = this.default()
        this.rows.push(obj)
      },
      default() {
        return {
          id: this.rows.length + 1,
          fecha: '',
          hora: '',
          paciente: '',
          medico: '',
          tipo_estudio: '',
          editable: false
        }
      },
      showConfirmModal(item) {
        this.itemToDelete = item;
        this.showConfirm = true;
      },
      deleteCita() {
        if (this.itemToDelete) {
          let index = this.rows.indexOf(this.itemToDelete);
          if (index !== -1) {
            this.rows.splice(index, 1);
          }
        }
        this.showConfirm = false;
      },
      openAddModal() {
        this.showAddModal = true;
        this.newCita = this.default();
      },
      addCita() {
        this.rows.push({ ...this.newCita, id: this.rows.length + 1, editable: false });
        this.showAddModal = false;
      },
      openEditModal(item) {
        this.showEditModal = true;
        this.editCita = { ...item }; // Copia la información de la cita para editar
      },
      saveChanges() {
        // Encuentra la cita en el array y actualiza sus datos
        const index = this.rows.findIndex(cita => cita.id === this.editCita.id);
        if (index !== -1) {
          this.rows[index] = { ...this.editCita };
        }
        this.showEditModal = false;
      }
    }
  }
  </script>
  