<template>
  <div>
    <Loader />
    <div class="">
      <router-view />
    </div>
  </div>
</template>
<script>
import Loader from '../components/xray/loader/Loader'
import { xray } from '../config/pluginInit'
export default {
  name: 'BlankLayout',
  components: {
    Loader
  },
  mounted() {
    xray.mainIndex()
  }
}
</script>
<style>
.modal-backdrop {
  opacity: 0.5;
}
</style>
