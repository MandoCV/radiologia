<template>
  <form class="mt-4" novalidate @submit.prevent="onSubmit">
    <div class="form-group">
      <label for="name">Your Full Name</label>
      <input type="text" v-model="user.name" :class="'form-control mb-0'" id="name" aria-describedby="emailHelp" placeholder="Your Full Name" />
      <div class="invalid-feedback"></div>
    </div>
    <div class="form-group">
      <label for="email">Email address</label>
      <input type="email" v-model="user.email" :class="'form-control mb-0'" id="email" aria-describedby="emailHelp" placeholder="Enter email" />
      <div class="invalid-feedback"></div>
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" v-model="user.password" :class="'form-control mb-0'" id="password" placeholder="Password" />
      <div class="invalid-feedback"></div>
    </div>
    <div class="d-inline-block w-100">
      <div class="custom-control custom-checkbox d-inline-block mt-2 pt-1">
        <input type="checkbox" class="custom-control-input" :id="formType" />
        <label class="custom-control-label" :for="formType">I accept <a href="#">Terms and Conditions</a></label>
      </div>
      <button type="submit" class="btn btn-primary float-end">Sign Up</button>
    </div>
    <div class="sign-info">
      <span class="dark-color d-inline-block line-height-2">
        Already Have Account ?
        <router-link to="/dark/auth/sign-in1" class="iq-waves-effect pr-4" v-if="$route.meta.dark"> Sign in </router-link>
        <router-link to="/auth/sign-in1" class="iq-waves-effect pr-4" v-else> Sign in </router-link>
      </span>
      <social-login-form></social-login-form>
    </div>
  </form>
</template>

<script>
import SocialLoginForm from './SocialLoginForm'
import { mapState } from 'pinia'
import { useStore } from '../../../../store/pinia'
export default {
  name: 'SignUp1Form',
  components: { SocialLoginForm },
  props: ['formType'],
  computed: {
    ...mapState(useStore, {
      users: 'usersState'
    })
  },
  data: () => ({
    user: {
      email: '',
      password: ''
    }
  }),
  methods: {
    onSubmit() {
      this.$router.replace('/auth/sign-in1')
    }
  }
}
</script>
