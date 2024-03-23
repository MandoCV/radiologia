<template>
  <div>
    <h1 class="mb-0">Sign Up</h1>
    <sign-up1-form formType="jwt"></sign-up1-form>
  </div>
</template>
<script>
import SignUp1Form from './Forms/SignUp1Form'

export default {
  name: 'SignUp1',
  components: { SignUp1Form },
  data: () => ({})
}
</script>
