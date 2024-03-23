<template>
  <b-container fluid>
    <Form @submit="onSubmit()" :validation-schema="schema" v-slot="{ errors }">
      <b-row>
        <b-col lg="3">
          <iq-card>
            <template v-slot:headerTitle>
              <h4 class="card-title">Add New User</h4>
            </template>
            <template v-slot:body>
              <b-form-group>
                <div class="add-img-user profile-img-edit">
                  <b-img class="profile-pic height-150 width-150" fluid :src="user.profile_image" alt="profile-pic" />
                  <input type="hidden" v-model="user.profile_image" />
                  <div class="p-image">
                    <b-button variant="none" class="upload-button iq-bg-primary position-relative">
                      <input type="file" @change="previewImage" class="h-100 position-absolute" accept="image/*" style="opacity: 0" />
                      File Upload
                    </b-button>
                  </div>
                </div>
                <div class="img-extension mt-3">
                  <div class="d-inline-block align-items-center">
                    <span>Only</span>
                    <b-link href="javascript:void();">.jpg</b-link>
                    <b-link href="javascript:void();">.png</b-link>
                    <b-link href="javascript:void();">.jpeg</b-link>
                    <span>allowed</span>
                  </div>
                </div>
              </b-form-group>
              <b-form-group label="User Role:" label-for="selectuserrole">
                <Field as="select" v-model="user.role" :options="roles" class="form-control form-select py-0" name="userRole" :rules="isRequire" :class="{ 'is-invalid': errors.userRole }">
                  <option value="" disabled>Select</option>
                  <option v-for="item in roles" :key="item" :value="item" :selected="value && value.includes(item)">
                    {{ item.text }}
                  </option>
                </Field>
                <div class="invalid-feedback">
                  <span>{{ errors.userRole }}</span>
                </div>
              </b-form-group>
              <b-form-group label="Facebook Url:" label-for="furl">
                <b-form-input v-model="user.facebook_url" id="furl" name="furl" placeholder="Facebook Url"></b-form-input>
              </b-form-group>
              <b-form-group label="Twitter Url:" label-for="turl">
                <b-form-input v-model="user.twitter_url" id="turl" name="turl" placeholder="Twitter Url"></b-form-input>
              </b-form-group>
              <b-form-group label="Instagram Url:" label-for="turl">
                <b-form-input id="instaurl" name="instaurl" placeholder="Instagram Url"></b-form-input>
              </b-form-group>
              <b-form-group label="Linkedin Url:" label-for="lurl">
                <b-form-input id="lurl" placeholder="Linkedin Url"></b-form-input>
              </b-form-group>
            </template>
          </iq-card>
        </b-col>
        <b-col lg="9">
          <iq-card>
            <template v-slot:headerTitle>
              <h4 class="card-title">New User Information</h4>
            </template>
            <template v-slot:body>
              <div class="new-user-info">
                <b-row>
                  <b-form-group class="col-md-6" label="First Name:" label-for="fname">
                    <Field v-model="user.fname" type="text" placeholder="First Name" class="form-control mb-2" name="FirstName" :rules="isRequire" :class="{ 'is-invalid': errors.FirstName }" />
                    <div class="invalid-feedback">
                      <span>{{ errors.FirstName }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Last Name:" label-for="lname">
                    <Field v-model="user.lname" type="text" class="form-control mb-2" placeholder="Last Name" :rules="isRequire" name="LastName" :class="{ 'is-invalid': errors.LastName }" />

                    <div class="invalid-feedback">
                      <span>{{ errors.LastName }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Street Address 1:" label-for="add1">
                    <Field class="form-control mb-2" v-model="user.address1" type="text" name="Address1" id="add1" placeholder="Street Address 1" :rules="isRequire" :class="{ 'is-invalid': errors.Address1 }" />
                    <div class="invalid-feedback">
                      <span>{{ errors.Address1 }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Street Address 2:" label-for="add2">
                    <Field class="form-control mb-2" v-model="user.address2" type="text" name="Address2" id="add2" placeholder="Street Address 2" :rules="isRequire" :class="{ 'is-invalid': errors.Address2 }"></Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.Address2 }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-12" label="Department Name:" label-for="dname">
                    <Field class="form-control mb-2" v-model="user.company_name" type="text" name="DepartmentName" id="dname" placeholder="Department Name" :rules="isRequire" :class="{ 'is-invalid': errors.DepartmentName }"></Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.DepartmentName }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-sm-12" label-for="selectcountry" label="Country:">
                    <Field as="select" :options="countries" class="form-control form-select py-0 mb-2" v-model="user.country" name="Country" :rules="isRequire" :class="{ 'is-invalid': errors.Country }">
                      <option value="" disabled>Select Country</option>
                      <option v-for="item in countries" :key="item" :value="item" :selected="value && value.includes(item)">
                        {{ item.text }}
                      </option>
                    </Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.Country }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Mobile Number:" label-for="mobno">
                    <Field class="form-control mb-2" v-model="user.mobile_no" type="text" placeholder="Mobile Number" name="MobileNo" :rules="isRequire" :class="{ 'is-invalid': errors.MobileNo }"></Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.MobileNo }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Alternate Contact:" label-for="mobno">
                    <Field class="form-control" v-model="user.alter_contact" type="text" placeholder="Alternate Contact" name="Alt_ContactNO" :rules="isRequire" :class="{ 'is-invalid': errors.Alt_ContactNO }"></Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.Alt_ContactNO }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Email:" label-for="uname">
                    <Field class="form-control mb-2" v-model="user.email" type="text" placeholder="Email" name="Email" :rules="isRequire" :class="{ 'is-invalid': errors.Email }"></Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.Email }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Pin Code:" label-for="pno">
                    <Field class="form-control mb-2" v-model="user.pincode" type="text" name="pincode" id="pno" placeholder="Pin Code" :rules="isRequire" :class="{ 'is-invalid': errors.pincode }"></Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.pincode }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-12" label="Town/City:" label-for="city">
                    <Field class="form-control mb-2" v-model="user.city" type="text" name="city" id="city" placeholder="Town/City" :rules="isRequire" :class="{ 'is-invalid': errors.city }"></Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.city }}</span>
                    </div>
                  </b-form-group>
                </b-row>
                <hr />
                <h5 class="mb-3">Security</h5>
                <b-row>
                  <b-form-group class="col-md-12" label="User Name:" label-for="uname">
                    <Field class="form-control mb-2" v-model="user.username" type="text" placeholder="User Name" name="UserName" :rules="isRequire" :class="{ 'is-invalid': errors.UserName }"></Field>
                    <div class="invalid-feedback">
                      <span>{{ errors.UserName }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Password:" label-for="pass">
                    <Field class="form-control mb-2" v-model="user.password" type="password" placeholder="Password" name="password" :rules="isRequire" :class="{ 'is-invalid': errors.password }"></Field>

                    <div class="invalid-feedback">
                      <span>{{ errors.password }}</span>
                    </div>
                  </b-form-group>
                  <b-form-group class="col-md-6" label="Repeat Password:" label-for="rpass">
                    <Field class="form-control mb-2" v-model="user.repeat_password" type="password" placeholder="Repeat Password" name="repassword" :rules="isRequire" :class="{ 'is-invalid': errors.repassword }"></Field>

                    <div class="invalid-feedback">
                      <span>{{ errors.repassword }}</span>
                    </div>
                  </b-form-group>
                </b-row>
                <div class="checkbox">
                  <label><input class="me-2 mb-4" type="checkbox" />Enable Two-Factor-Authentication</label>
                </div>
                <b-button variant="primary mt-2" type="submit">Add New User</b-button>
              </div>
            </template>
          </iq-card>
        </b-col>
      </b-row>
    </Form>
  </b-container>
</template>
<script>
import { xray } from '../../config/pluginInit'
import iqCard from '../../components/xray/cards/iq-card'

import { Form, Field } from 'vee-validate'
import * as yup from 'yup'

export default {
  name: 'AddUser',
  components: { iqCard, Form, Field },
  mounted() {
    xray.index()
  },
  data() {
    const schema = yup.object({
      userRole: yup.object().required(),
      FirstName: yup.string().required(),
      LastName: yup.string().required(),
      Address1: yup.string().required(),
      Address2: yup.string().required(),
      Country: yup.object().required(),
      DepartmentName: yup.string().required(),
      MobileNo: yup.string().required(),
      Alt_ContactNO: yup.string().required(),
      Email: yup.string().required().email(),
      pincode: yup.string().required(),
      city: yup.string().required(),
      password: yup.string().required().min(8),
      repassword: yup.string().required().min(8),
      UserName: yup.string().required()
    })
    return {
      user: {
        fname: '',
        lname: '',
        name: '',
        username: '',
        email: '',
        password: '',
        address1: '',
        address2: '',
        company_name: '',
        profile_image: require('../../assets/images/user/11.png'),
        mobile_no: '',
        country: '',
        city: '',
        pincode: '',
        role: ''
      },
      roles: [
        { text: 'Web Designer', value: 'Web Designer' },
        { text: 'Web Developer', value: 'Web Developer' },
        { text: 'Tester', value: 'Tester' },
        { text: 'Php Developer', value: 'Php Developer' },
        { text: 'Ios Developer', value: 'Ios Developer' }
      ],
      countries: [
        { value: 'Canada', text: 'Canada' },
        { value: 'Niada', text: 'Niada' },
        { value: 'USA', text: 'USA' },
        { value: 'India', text: 'India' },
        { value: 'Africa', text: 'Africa' }
      ],
      users: [],
      schema
    }
  },
  computed: {
    fullName: function () {
      return this.user.fname + ' ' + this.user.lname
    }
  },
  methods: {
    onSubmit() {
      this.user.name = this.fullName
      xray.showSnackbar('success', 'User has been updated successfully.')
      this.$router.replace('/user/user-list')
    },
    previewImage: function (event) {
      const input = event.target

      if (input.files && input.files[0]) {
        const reader = new FileReader()

        reader.onload = (e) => {
          this.user.profile_image = e.target.result
        }

        reader.readAsDataURL(input.files[0])
      }
    }
  }
}
</script>
