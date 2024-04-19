<template>
  <div class="iq-sidebar">
    <div class="iq-sidebar-logo d-flex justify-content-between">
      <router-link :to="homeURL">
        <img :src="logo" class="img-fluid" alt="logo" />
        <span>{{ appName }}</span>
      </router-link>
      <div class="iq-menu-bt-sidebar" v-if="toggleButton">
        <div class="iq-menu-bt align-self-center">
          <div class="wrapper-menu" @click="miniSidebar">
            <div class="main-circle"><i class="ri-more-fill"></i></div>
            <div class="hover-circle"><i class="ri-more-2-fill"></i></div>
          </div>
        </div>
      </div>
    </div>
    <div id="sidebar-scrollbar">
      <nav class="iq-sidebar-menu" :class="horizontal ? 'd-xl-none' : ''">
        <ListStyle1 :items="items" :horizontal="horizontal" :sidebarGroupTitle="sidebarGroupTitle" />
      </nav>
      <div class="p-3"></div>
    </div>
  </div>
  <!-- TOP Nav Bar -->
</template>

<script>
import { computed } from 'vue'
import { useStore } from '../../../store/pinia'
import ListStyle1 from '../menus/ListStyle1.vue'

export default {
  name: 'SideBarStyle1',
  props: {
    homeURL: { type: Object, default: () => ({ name: 'dashboard.home-1' }) },
    items: { type: Array },
    logo: { type: String, default: require('../../../assets/images/logo.png') },
    horizontal: { type: Boolean },
    toggleButton: { type: Boolean, default: true },
    sidebarGroupTitle: { type: Boolean, default: true }
  },
  components: {
    // List,
    ListStyle1
  },
  methods: {
    miniSidebar() {
      this.$emit('toggle')
    }
  },
  setup() {
    const customizer = useStore()
    const appName = computed(() => customizer.appName)
    return { appName }
  },
  data() {
    return {}
  }
}
</script>
