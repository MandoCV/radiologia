<template>
  <div>
    <h1 class="mb-0">Sign in</h1>
    <p>Enter your email address and password to access admin panel.</p>
    <sign-in1-form formType="jwtz" email="Enter email" password="admin123"></sign-in1-form>
  </div>
</template>

<script>
import SignIn1Form from './Forms/SignIn1Form'
export default {
  name: 'SignIn1',
  components: { SignIn1Form },
  data: () => ({}),
  mounted() {
    const loggedIn = localStorage.getItem('access_token')
    if (loggedIn !== undefined && loggedIn !== null) {
      this.$router.push({ name: 'mini.dashboard.home-2' })
    }
  }
}
</script>
