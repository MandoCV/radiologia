<template>
  <b-container fluid>
    <form @submit="onSubmit">
      <b-row>
        <b-col lg="12">
          <iq-card body-class="p-0">
            <template v-slot:body>
              <!-- Nav tabs -->
              <!-- Tab panes -->
              <div class="iq-edit-list">
                <ul class="nav nav-tabs iq-edit-profile d-flex nav-pills" id="myTab" role="tablist">
                  <li class="nav-item col-md-3 p-0" role="presentation">
                    <a class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#personal-information" href="#personal-information" type="button" role="tab" aria-controls="home" aria-selected="true">Personal Information</a>
                  </li>
                  <li class="nav-item col-md-3 p-0" role="presentation">
                    <a class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#chang-pwd" href="#chang-pwd" type="button" role="tab" aria-controls="profile" aria-selected="false">Change Password</a>
                  </li>
                  <li class="nav-item col-md-3 p-0" role="presentation">
                    <a class="nav-link" id="messages-tab" data-bs-toggle="tab" data-bs-target="#emailandsms" href="#emailandsms" type="button" role="tab" aria-controls="messages" aria-selected="false">Email and SMS</a>
                  </li>
                  <li class="nav-item col-md-3 p-0" role="presentation">
                    <a class="nav-link" id="settings-tab" data-bs-toggle="tab" data-bs-target="#manage-contact" href="#manage-contact" type="button" role="tab" aria-controls="settings" aria-selected="false">Manage Contact</a>
                  </li>
                </ul>
              </div>
            </template>
          </iq-card>
        </b-col>
        <b-col lg="12">
          <div class="iq-edit-list-data">
            <div class="tab-content" id="pills-tabContent-2">
              <div class="tab-pane fade active show" aria-labelledby="''" id="personal-information">
                <iq-card>
                  <template v-slot:headerTitle>
                    <h4 class="card-title">Personal Information</h4>
                  </template>
                  <template v-slot:body>
                    <b-form-group class="row align-items-center">
                      <b-col md="12">
                        <div class="profile-img-edit">
                          <b-img :src="user.profile_image" class="profile-pic height-150 width-150" alt="profile-pic" />
                          <input type="hidden" v-model="user.profile_image" />
                          <div class="p-image">
                            <div class="position-relative">
                              <i class="ri-pencil-line upload-button"></i>
                              <b-form-file class="h-100 position-absolute" accept="image/*" style="opacity: 0" @change="previewImage"></b-form-file>
                            </div>
                          </div>
                        </div>
                      </b-col>
                    </b-form-group>
                    <b-row align-v="center">
                      <b-form-group class="col-md-6" label="First Name" label-for="fname">
                        <ValidationProvider name="First name" rules="required">
                          <b-form-input v-model="user.fname" class="form-control" type="text" placeholder="Bini" name="FirstName"></b-form-input>
                          <div class="invalid-feedback">
                            <!-- <span>{{ errors[0] }}</span> -->
                          </div>
                        </ValidationProvider>
                      </b-form-group>
                      <b-form-group class="col-md-6" label="Last Name" label-for="lname">
                        <ValidationProvider name="Last name" rules="required">
                          <b-form-input v-model="user.lname" class="form-control" type="text" placeholder="Jets" name="LastName"></b-form-input>
                          <div class="invalid-feedback">
                            <!-- <span>{{ errors[0] }}</span> -->
                          </div>
                        </ValidationProvider>
                      </b-form-group>

                      <b-form-group class="col-md-6" label="Username" label-for="uname">
                        <ValidationProvider name="User name" rules="required">
                          <b-form-input v-model="user.username" type="text" class="form-control" placeholder="Bini@01" name="UserName"></b-form-input>
                          <div class="invalid-feedback">
                            <!-- <span>{{ errors.[0] }}</span> -->
                          </div>
                        </ValidationProvider>
                      </b-form-group>
                      <b-form-group class="col-md-6" label="City:" label-for="uname">
                        <b-form-input v-model="user.city" type="text" placeholder="Atlanta"></b-form-input>
                      </b-form-group>
                      <b-form-group class="col-sm-6" label="Gender:" label-class="d-block">
                        <b-form-radio inline v-model="user.gender" value="male">Male</b-form-radio>
                        <b-form-radio inline v-model="user.gender" value="female">Female</b-form-radio>
                      </b-form-group>
                      <b-form-group class="col-sm-6" label="Date Of Birth:" label-for="dob">
                        <b-form-input v-model="user.dob" type="text" placeholder="1984-01-24"></b-form-input>
                      </b-form-group>
                      <b-form-group class="col-md-6" label="Marital Status:" label-for="status">
                        <b-form-input v-model="user.Status" type="text" placeholder="Single"></b-form-input>
                      </b-form-group>
                      <b-form-group class="col-md-6" label="Age:" label-for="age">
                        <b-form-input v-model="user.age" type="text" placeholder="33-45"></b-form-input>
                      </b-form-group>
                      <b-form-group class="col-sm-6" label-for="exampleFormControlSelect3" label="Country:">
                        <b-form-select plain v-model="user.country" :options="countries" id="exampleFormControlSelect3"> </b-form-select>
                      </b-form-group>
                      <b-form-group class="col-sm-6" label-for="exampleFormControlSelect4" label="State:">
                        <b-form-select plain v-model="user.state" :options="states" id="exampleFormControlSelect4"> </b-form-select>
                      </b-form-group>
                      <b-form-group class="col-sm-12" label="Address:">
                        <b-form-textarea name="address" v-model="user.address1" style="line-height: 22px" rows="4"> </b-form-textarea>
                      </b-form-group>
                    </b-row>
                    <b-button type="submit" variant="primary" class="me-2 mt-3">Submit</b-button>
                    <b-button type="reset" variant="none" class="btn iq-bg-danger mt-3">Cancel</b-button>
                  </template>
                </iq-card>
              </div>
              <div class="tab-pane fade" aria-labelledby="''" id="chang-pwd">
                <iq-card>
                  <template v-slot:headerTitle>
                    <h4 class="card-title">Change Password</h4>
                  </template>
                  <template v-slot:body>
                    <b-form-group>
                      <label for="cpass">Current Password:</label>
                      <b-link href="javascripe:void();" class="float-end mb-2">Forgot Password</b-link>
                      <b-form-input @focusout="changePassword()" type="password" id="cpass" v-model="currentPassword"></b-form-input>
                    </b-form-group>
                    <b-form-group class="col-md-12" label="New Password:" label-for="pass">
                      <ValidationProvider name="Password" rules="confirmed:verify_password">
                        <b-form-input v-model="user.password" type="password"></b-form-input>
                        <div class="invalid-feedback">
                          <!-- <span>{{ errors[0] }}</span> -->
                        </div>
                      </ValidationProvider>
                    </b-form-group>
                    <b-form-group class="col-md-12" label="Verify Password:" label-for="vpass">
                      <ValidationProvider vid="verify_password" name="Verify Password" rules="required">
                        <b-form-input v-model="user.verify_password" type="password"></b-form-input>
                        <div class="invalid-feedback">
                          <!-- <span>{{ errors[0] }}</span> -->
                        </div>
                      </ValidationProvider>
                    </b-form-group>
                    <b-button type="submit" variant="primary" class="me-2">Submit</b-button>
                    <b-button type="reset" variant="none" class="iq-bg-danger">Cancel</b-button>
                  </template>
                </iq-card>
              </div>
              <div class="tab-pane fade" aria-labelledby="''" id="emailandsms">
                <iq-card>
                  <template v-slot:headerTitle>
                    <h4 class="card-title">Email and SMS</h4>
                  </template>
                  <template v-slot:body>
                    <div class="form-group row align-items-center">
                      <label class="col-md-3" for="emailnotification">Email Notification:</label>
                      <div class="col-md-9 custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="emailnotification" checked="" />
                        <label class="custom-control-label ms-3" for="emailnotification"></label>
                      </div>
                    </div>
                    <div class="form-group row align-items-center">
                      <label class="col-md-3" for="smsnotification">SMS Notification:</label>
                      <div class="col-md-9 custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="smsnotification" checked="" />
                        <label class="custom-control-label ms-3" for="smsnotification"></label>
                      </div>
                    </div>
                    <div class="form-group row align-items-center">
                      <label class="col-md-3" for="npass">When To Email</label>
                      <div class="col-md-9">
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="email01" />
                          <label class="custom-control-label" for="email01">You have new notifications.</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="email02" />
                          <label class="custom-control-label" for="email02">You're sent a direct message</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="email03" checked="" />
                          <label class="custom-control-label" for="email03">Someone adds you as a connection</label>
                        </div>
                      </div>
                    </div>
                    <div class="form-group row align-items-center">
                      <label class="col-md-3" for="npass">When To Escalate Emails</label>
                      <div class="col-md-9">
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="email04" />
                          <label class="custom-control-label" for="email04"> Upon new order.</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="email05" />
                          <label class="custom-control-label" for="email05"> New membership approval</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="email06" checked="" />
                          <label class="custom-control-label" for="email06"> Member registration</label>
                        </div>
                      </div>
                    </div>
                    <b-button type="submit" variant="primary" class="me-2">Submit</b-button>
                    <b-button type="reset" variant="none" class="iq-bg-danger">Cancel</b-button>
                  </template>
                </iq-card>
              </div>
              <div class="tab-pane fade" aria-labelledby="''" id="manage-contact">
                <iq-card>
                  <template v-slot:headerTitle>
                    <h4 class="card-title">Manage Contact</h4>
                  </template>
                  <template v-slot:body>
                    <b-form>
                      <b-form-group>
                        <label for="contact_no">Contact Number:</label>
                        <b-form-input id="contact_no" type="text" v-model="user.mobile_no"></b-form-input>
                      </b-form-group>
                      <b-form-group>
                        <label for="email">Email:</label>
                        <b-form-input id="email" type="text" v-model="user.email"></b-form-input>
                      </b-form-group>
                      <b-form-group>
                        <label for="url">Url:</label>
                        <b-form-input id="url" type="text" v-model="user.url"></b-form-input>
                      </b-form-group>
                      <b-button type="submit" variant="primary" class="me-2">Submit</b-button>
                      <b-button type="reset" variant="none" class="iq-bg-danger">Cancel</b-button>
                    </b-form>
                  </template>
                </iq-card>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
    </form>
  </b-container>
</template>
<script>
import { xray } from '../../config/pluginInit'
import iqCard from '../../components/xray/cards/iq-card'

export default {
  name: 'ProfileEdit',
  components: { iqCard },
  mounted() {
    xray.index()
  },
  data() {
    return {
      user: {
        fname: '',
        lname: '',
        name: '',
        username: '',
        email: '',
        password: '',
        address1: '37 Cardinal Lane Petersburg, VA 23803 United States of America Zip Code: 85001',
        address2: '',
        company_name: '',
        profile_image: require('../../assets/images/user/11.png'),
        mobile_no: '',
        country: '',
        state: '',
        city: '',
        pincode: '',
        role: '',
        gender: '',
        dob: '',
        url: ''
      },
      currentPassword: '',
      countries: [
        { value: 'Canada', text: 'Canada' },
        { value: 'Niada', text: 'Niada' },
        { value: 'USA', text: 'USA' },
        { value: 'India', text: 'India' },
        { value: 'Africa', text: 'Africa' }
      ],
      states: [
        { value: 'California', text: 'California' },
        { value: 'Florida', text: 'Florida' },
        { value: 'Georgia', text: 'Georgia' },
        { value: 'Connecticut', text: 'Connecticut' },
        { value: 'Louisiana', text: 'Louisiana' }
      ]
    }
  },
  methods: {
    onSubmit() {
      this.user.name = this.user.fname + ' ' + this.user.lname

      xray.showSnackbar('success', 'User has been added successfully.')

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
    },
    changePassword: function () {}
  }
}
</script>
