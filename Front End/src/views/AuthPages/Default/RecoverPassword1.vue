<template>
  <div>
    <h1 class="mb-0">Reset Password</h1>
    <p>Enter your email address and we'll send you an email with instructions to reset your password.</p>
    <form class="mt-4">
      <div class="form-group">
        <label for="exampleInputEmail1" class="mb-2">Email address</label>
        <input type="email" class="form-control mb-0" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" />
      </div>

      <div class="d-inline-block w-100 mt-3">
        <button type="submit" class="btn btn-primary float-end">Reset Password</button>
      </div>
    </form>
  </div>
</template>
<script>
export default {
  name: 'RecoverPassword1'
}
</script>
