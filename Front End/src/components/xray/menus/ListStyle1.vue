<template>
  <ul :class="className">
    <li v-for="(item, index) in items" :key="index" :class="item.is_heading ? 'iq-menu-title' : activeLink(item) && item.children ? 'active menu-open' : activeLink(item) ? 'active' : ''">
      <i v-if="item.is_heading" class="ri-subtract-line" />
      <span v-if="item.is_heading">{{ $t(item.name) }}</span>
      <router-link :to="item.link" v-if="!item.is_heading" class="iq-waves-effect">
        <i :class="item.icon" v-if="item.is_icon_class" />
        <!-- <template v-else v-html="item.icon">
            </template> -->
        <span>{{ $t(item.name) }}</span>
        <span class="badge badge-danger" v-if="item.badge">New</span>
        <i v-if="item.children" class="ri-arrow-right-s-line iq-arrow-right" />
        <small v-html="item.append" :class="item.append_class" />
      </router-link>
      <ListPage v-if="item.children" :items="item.children" :className="activeLink(item) ? 'iq-submenu menu-open' : 'iq-submenu'" />
    </li>
  </ul>
</template>
<script>
import ListPage from './ListStyle1'
import { xray } from '../../../config/pluginInit'
export default {
  name: 'ListPage',
  props: {
    items: Array,
    className: { type: String, default: 'iq-menu' },
    horizontal: Boolean
  },
  components: {
    ListPage
  },
  mounted() {},
  methods: {
    activeLink(item) {
      return xray.getActiveLink(item, this.$route.name)
    }
  }
}
</script>
