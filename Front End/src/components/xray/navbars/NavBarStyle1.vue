<template>
  <!-- TOP Nav Bar -->
  <div class="iq-top-navbar header-top-sticky">
    <div class="iq-navbar-custom" :class="horizontal ? 'd-flex align-items-center justify-content-between' : ''">
      <div class="iq-sidebar-logo">
        <div class="top-logo">
          <router-link :to="homeURL">
            <img :src="logo" class="img-fluid" alt="logo" />
            <span>XRay</span>
          </router-link>
        </div>
      </div>
      <div class="iq-menu-horizontal" v-if="horizontal">
        <div class="iq-sidebar-menu">
          <List :items="items" class="d-flex"></List>
        </div>
      </div>
      <nav class="navbar navbar-expand-lg navbar-light p-0">
        <div class="mini-menu">
          <router-link to="" class="mini-menu-item"></router-link>
          <router-link to="/Radio/Crud" class="mini-menu-item">Crud</router-link>
          <router-link to="/Radio/Tabla" class="mini-menu-item">Tabla</router-link>
          <router-link to="/Radio/Dash" class="mini-menu-item">Dashboard</router-link>
        </div>
        <b-navbar-toggle target="nav">
          <i class="ri-menu-3-line"></i>
        </b-navbar-toggle>
        <b-collapse id="nav-collapse" is-nav>
          <slot name="responsiveRight" />
        </b-collapse>
        <slot name="right" />
      </nav>
    </div>
  </div>
  <!-- TOP Nav Bar END -->
</template>

<style scoped>
.mini-menu {
  display: flex;
}

.mini-menu-item {
  margin-right: 20px; /* Ajusta el margen derecho */
}
</style>

<script>
import List from '../menus/ListStyle1'
import SideBarItems from '../../../FackApi/json/SideBar'
export default {
  name: 'NavBarStyle1',
  props: {
    homeURL: { type: Object, default: () => ({ name: 'dashboard' }) },
    title: { type: String, default: 'Dashboard' },
    logo: { type: String, default: require('../../../assets/images/logo.png') },
    horizontal: { type: Boolean, default: false },
    items: { type: Array }
  },
  components: {
    List
  },
  data() {
    return {
      sidebar: SideBarItems,
      globalSearch: '',
      showSearch: false,
      showMenu: false,
      showMiniMenu: false
    }
  }
}
</script>
