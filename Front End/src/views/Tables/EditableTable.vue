<template>
  <b-container fluid>
    <b-row>
      <b-col md="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Editable Table</h4>
          </template>
          <template v-slot:body>
            <b-row>
              <div class="table-ad mb-3 me-2">
                <b-button variant="btn btn-sm iq-bg-success float-end" @click="add">+ Add New</b-button>
              </div>
              <b-col md="12" class="table-responsive w-100">
                <b-table striped bordered hover :items="rows" :fields="columns">
                  <template v-slot:cell(name)="data">
                    <span v-if="!data.item.editable">{{ data.item.name }}</span>
                    <input type="text" v-model="data.item.name" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(age)="data">
                    <span v-if="!data.item.editable">{{ data.item.age }}</span>
                    <input type="text" v-model="data.item.age" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(company_name)="data">
                    <span v-if="!data.item.editable">{{ data.item.company_name }}</span>
                    <input type="text" v-model="data.item.company_name" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(country)="data">
                    <span v-if="!data.item.editable">{{ data.item.country }}</span>
                    <input type="text" v-model="data.item.country" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(city)="data">
                    <span v-if="!data.item.editable">{{ data.item.city }}</span>
                    <input type="text" v-model="data.item.city" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(sort)>
                    <td>
                      <a href="#!" class="indigo-text"><i class="fa fa-long-arrow-up" aria-hidden="true"></i> <i class="fa fa-long-arrow-down ms-1" aria-hidden="true"></i></a>
                    </td>
                  </template>
                  <template v-slot:cell(remove)="data">
                    <!-- <b-button
                      variant=" iq-bg-success mr-1 mb-1"
                      size="sm"
                      @click="edit(data.item)"
                      v-if="!data.item.editable"
                      ><i class="ri-ball-pen-fill m-0"></i
                    ></b-button>
                    <b-button
                      variant=" iq-bg-success mr-1 mb-1"
                      size="sm"
                      @click="submit(data.item)"
                      v-else
                      >Ok</b-button
                    > -->
                    <b-button variant=" iq-bg-danger" size="sm" @click="remove(data.item)">Remove </b-button>
                  </template>
                </b-table>
              </b-col>
            </b-row>
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
  name: 'UiDataTable',
  components: { iqCard },
  mounted() {
    xray.index()
  },
  methods: {
    add() {
      let obj = this.default()
      this.rows.push(obj)
    },
    default() {
      return {
        id: this.rows.length,
        name: '',
        position: '',
        office: '',
        age: '',
        start_date: '2011/04/25',
        salary: '$0',
        editable: false
      }
    },
    edit(item) {
      item.editable = true
    },
    submit(item) {
      item.editable = false
    },
    remove(item) {
      let index = this.rows.indexOf(item)
      this.rows.splice(index, 1)
    }
  },
  data() {
    return {
      columns: [
        { label: 'Name', key: 'name', class: 'text-left' },
        { label: 'Age', key: 'age', class: 'text-left' },
        { label: 'Company Name', key: 'company_name', class: 'text-left' },
        { label: 'Country', key: 'country', class: 'text-left' },
        { label: 'City', key: 'city', class: 'text-left' },
        { label: 'Sort', key: 'sort', class: 'text-left' },
        { label: 'Remove', key: 'remove', class: 'text-center' }
      ],
      rows: [
        {
          id: 1,
          name: 'Gio Metric',
          age: '25',
          company_name: 'Deepends',
          country: 'Spain',
          city: 'Madrid',
          editable: false
        },
        {
          id: 1,
          name: 'Manny Petty',
          age: '45',
          company_name: 'Insectus',
          country: 'France',
          city: 'San Francisco',
          editable: false
        },
        {
          id: 1,
          name: 'Lucy Tania',
          age: '26',
          company_name: 'Isotronic',
          country: 'Germany',
          city: 'Frankfurt am Main',
          editable: false
        },
        {
          id: 1,
          name: 'Anna Mull',
          age: '35',
          company_name: 'Portica',
          country: 'USA',
          city: 'Oregon',
          editable: false
        }
      ]
    }
  }
}
</script>
