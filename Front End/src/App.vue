<template>
  <router-view />
</template>
<script>
import { xray } from './config/pluginInit'

export default {
  name: 'App',
  components: {},
  mounted() {
    xray.mainIndex()
  }
}
</script>
<style>
.text-ellipsis {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
}
.text-ellipsis.short-1 {
  -webkit-line-clamp: 4;
}
@import 'assets/css/index.css';
@import 'assets/css/typography';
</style>
