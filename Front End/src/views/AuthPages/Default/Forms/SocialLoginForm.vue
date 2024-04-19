<template>
  <ul class="iq-social-media">
    <li v-for="(socialProvider, index) in socialProviders" :key="index">
      <a href="javascript:void(0)" @click="socialLogin(socialProvider.type)">
        <i :class="socialProvider.icon"></i>
      </a>
    </li>
  </ul>
</template>

<script>
export default {
  name: 'SocialLoginForm',
  data: () => ({
    socialProviders: [
      {
        type: 'facebook',
        icon: 'ri-facebook-box-line'
      },
      {
        type: 'twitter',
        icon: 'ri-twitter-line'
      },
      {
        type: 'instagram',
        icon: 'ri-instagram-line'
      }
    ]
  }),
  methods: {
    socialLogin(type) {
      console.log(type)
      this.$router.push({ name: 'mini.dashboard.home-1' })
    }
  }
}
</script>
