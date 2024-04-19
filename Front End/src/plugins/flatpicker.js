import VueFlatPicker from 'vue-flatpickr-component'
import 'flatpickr/dist/flatpickr.css'

export default {
  install: (app) => {
    app.use(VueFlatPicker)
  }
}
