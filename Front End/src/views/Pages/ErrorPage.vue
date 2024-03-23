<template>
  <div class="container-fluid">
    <div class="row no-gutters">
      <div class="col-sm-12 text-center">
        <div class="iq-error pb-5" :class="$route.params.code !== '404' ? 'error-500' : ''">
          <div v-if="$route.params.code === '404'">
            <h1 class="text-primary">404</h1>
            <h2 class="mb-0">Oops! This Page is Not Found.</h2>
            <p class="text-secondary">The requested page dose not exist.</p>
            <a @click="$router.go(1)" class="btn btn-primary mt-3"> <i class="ri-home-4-line"></i>Back to Home </a>
          </div>
          <div v-else>
            <h1 class="text-primary">500</h1>
            <h2 class="mb-0">Oops! This Page is Not Working.</h2>
            <p class="text-secondary">The requested is Internal Server Error.</p>
            <a @click="$router.go(1)" class="btn btn-primary mt-3"> <i class="ri-home-4-line"></i>Back to Home </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { xray } from '../../config/pluginInit'

export default {
  name: 'ErrorPage',
  mounted() {
    xray.index()
  },
  data() {
    return {
      image500: require('../../assets/images/error/error-.png')
    }
  }
}
</script>
