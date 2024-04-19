<template>
  <b-container fluid>
    <b-row>
      <b-col sm="12">
        <iq-card className="iq-card-block iq-card-stretch">
          <template v-slot:headerTitle>
            <h4 class="card-title">Vector</h4>
          </template>
          <template v-slot:body>
            <lea-flet id="chart-map-column-04" :options="leafFletOptions" />
          </template>
        </iq-card>
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
import { ref } from 'vue'
import iqCard from '../../components/xray/cards/iq-card.vue'
import { xray } from '../../config/pluginInit'
import { data } from '../../assets/vector-map'
import LeaFlet from '../../components/LeaFlet.vue'
export default {
  name: 'VectorMaps',
  components: { iqCard, LeaFlet },
  setup() {},
  data() {
    const leafFletOptions = ref(data)

    return { leafFletOptions }
  },
  mounted() {
    xray.index()
  }
}
</script>
