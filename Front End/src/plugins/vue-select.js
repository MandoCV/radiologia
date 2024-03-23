// import Vue from "vue";
import VueSelect from 'vue-select'
import 'vue-select/dist/vue-select.css'

export default {
  install: (app) => {
    app.component('v-select', VueSelect)
  }
}
