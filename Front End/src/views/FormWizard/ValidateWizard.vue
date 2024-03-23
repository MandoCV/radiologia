<template>
  <b-row>
    <b-col sm="12">
      <iq-card no-body>
        <template v-slot:headerTitle>
          <b-card-title>{{ $t('Validate Wizard') }}</b-card-title>
        </template>

        <template v-slot:body>
          <div class="stepwizard mt-4">
            <ul class="stepwizard-row setup-panel">
              <div id="user" class="wizard-step active" :class="`${currentindex == 1 ? 'active' : ''} ${currentindex > 1 ? 'done active' : ''}`">
                <a href="#user-detail" class="active btn"> <i class="ri-lock-unlock-line text-primary"></i><span>User Detail</span> </a>
              </div>
              <div id="document" class="wizard-step" :class="`${currentindex == 2 ? 'active' : ''} ${currentindex > 2 ? 'done active' : ''}`">
                <a href="#document-detail" class="btn btn-default disabled active"> <i class="ri-user-fill text-danger"></i><span>Document Detail</span> </a>
              </div>
              <div id="bank" class="wizard-step" :class="`${currentindex == 3 ? 'active' : ''} ${currentindex > 3 ? 'done active' : ''}`">
                <a href="#bank-detail" class="btn btn-default disabled active"> <i class="ri-camera-fill text-success"></i><span>Bank Detail</span> </a>
              </div>
              <div id="confirm" class="wizard-step" :class="`${currentindex == 4 ? 'active' : ''} ${currentindex > 4 ? 'done active' : ''}`">
                <a href="#cpnfirm-data" class="btn btn-default disabled active"> <i class="ri-check-fill text-warning"></i><span>Confirm</span> </a>
              </div>
            </ul>
          </div>
          <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors }" class="text-center mt-3">
            <!-- <b-form id="form-wizard1" class="text-center mt-3"> -->
            <div :class="`${currentindex == 1 ? 'show' : 'd-none'}`">
              <fieldset>
                <div class="form-card text-start">
                  <b-row>
                    <div class="col-7">
                      <h3 class="mb-4">User Information:</h3>
                    </div>
                  </b-row>
                  <b-row>
                    <b-col md="6">
                      <b-form-group label="First Name: *">
                        <Field v-model="user.fname" type="text" class="form-control" name="FirstName" placeholder="Enter First Name" :rules="isRequire" :class="{ 'is-invalid': errors.FirstName }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.FirstName }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Last Name: *">
                        <Field v-model="user.fname" type="text" class="form-control" name="LastName" placeholder="Enter Last Name" :rules="isRequire" :class="{ 'is-invalid': errors.LastName }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.LastName }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="User Name: *">
                        <Field v-model="user.username" type="text" class="form-control" name="UserName" placeholder="Enter User Name" :rules="isRequire" :class="{ 'is-invalid': errors.UserName }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.UserName }}</span>
                        </div>
                      </b-form-group>
                    </b-col>

                    <b-col md="6">
                      <b-form-group label="Email Id: *">
                        <Field class="form-control" v-model="user.email" type="text" placeholder="Email ID" name="Email" :rules="isRequire" :class="{ 'is-invalid': errors.Email }"></Field>
                        <div class="invalid-feedback">
                          <span>{{ errors.Email }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Password: *">
                        <Field type="password" class="form-control" name="new_password" :rules="isRequire" :class="{ 'is-invalid': errors.new_password }" placeholder="Password" />
                        <div class="invalid-feedback">
                          <span>{{ errors.new_password }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Confirm Password: *">
                        <Field type="password" class="form-control" name="cnfm_password" placeholder="Confirm Password" :rules="isRequire" :class="{ 'is-invalid': errors.cnfm_password }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.cnfm_password }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Contact Number: *">
                        <Field type="text" class="form-control" name="Contact_no" placeholder="Contact Number" :rules="isRequire" :class="{ 'is-invalid': errors.Contact_no }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Contact_no }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Alternate Contact Number: *">
                        <Field type="text" class="form-control" name="Alt_ContactNO" placeholder="Alternate Contact Number" :rules="isRequire" :class="{ 'is-invalid': errors.Alt_ContactNO }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Alt_ContactNO }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12" class="mb-3">
                      <b-form-group label="Company Address: *">
                        <Field as="textarea" name="Address" class="form-control" id="address" rows="5" v-bind="add" required="required" spellcheck="false" data-ms-editor="true" placeholder="Leave a comment here" :rules="isRequire" :class="{ 'is-invalid': errors.Address }"></Field>
                        <div class="invalid-feedback">
                          <span>{{ errors.Address }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                  </b-row>
                </div>
                <a href="#personal" class="btn btn-primary next action-button float-end" @click="changeTab(2)" value="Next">Next</a>
              </fieldset>
            </div>
            <div :class="`${currentindex == 2 ? 'show' : 'd-none'}`">
              <fieldset>
                <div class="form-card text-start">
                  <b-row>
                    <div class="col-7">
                      <h3 class="mb-4">Document Details:</h3>
                    </div>
                  </b-row>
                  <b-row>
                    <b-col md="6">
                      <b-form-group label="Company Name: *">
                        <Field type="text" class="form-control" name="Company_Name" placeholder="Company Name" :rules="isRequire" :class="{ 'is-invalid': errors.Company_Name }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Company_Name }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Contact Number: *">
                        <Field type="text" class="form-control" name="Contact_no" placeholder="Contact Number" :rules="isRequire" :class="{ 'is-invalid': errors.Contact_no }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Contact_no }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Company Url: *">
                        <Field type="text" class="form-control" name="Company_URL" placeholder="Company Url" :rules="isRequire" :class="{ 'is-invalid': errors.Company_URL }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Company_URL }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Company Mail Id: *">
                        <Field type="text" class="form-control" name="Company_Mail" placeholder="Company Mail Id" :rules="isRequire" :class="{ 'is-invalid': errors.Company_Mail }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Company_Mail }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12" class="mb-3">
                      <b-form-group label="Company Address: *">
                        <Field as="textarea" name="Company_Address" class="form-control" id="Company_address" rows="5" v-bind="add" required="required" spellcheck="false" data-ms-editor="true" :rules="isRequire" :class="{ 'is-invalid': errors.Company_Address }"></Field>
                        <div class="invalid-feedback">
                          <span>{{ errors.Company_Address }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                  </b-row>
                </div>
                <a href="#payment" @click="changeTab(3)" class="btn btn-primary next action-button float-end" value="Next">Next</a>
                <a href="#account" @click="changeTab(1)" class="btn btn-dark previous action-button-previous float-end me-1" value="Previous">Previous</a>
              </fieldset>
            </div>
            <div id="payment" :class="`${currentindex == 3 ? 'show' : 'd-none'}`">
              <fieldset>
                <div class="form-card text-start">
                  <b-row>
                    <div class="col-7">
                      <h3 class="mb-4">Bank Details:</h3>
                    </div>
                  </b-row>
                  <b-row>
                    <b-col md="6">
                      <b-form-group label="PAN No.: *">
                        <Field type="text" class="form-control" name="PanNo" placeholder="Pan No." :rules="isRequire" :class="{ 'is-invalid': errors.PanNo }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.PanNo }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Account No: *">
                        <Field type="text" class="form-control" name="Account_No" placeholder="Account No" :rules="isRequire" :class="{ 'is-invalid': errors.Account_No }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Account_No }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Account Holder Name: *">
                        <Field type="text" class="form-control" name="Account_Holder_Name" placeholder="Account Holder Name" :rules="isRequire" :class="{ 'is-invalid': errors.Account_Holder_Name }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Account_Holder_Name }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="IFSC Code: *">
                        <Field type="text" class="form-control" name="IFSC_Code" placeholder="IFSC Code" :rules="isRequire" :class="{ 'is-invalid': errors.IFSC_Code }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.IFSC_Code }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Bank Name: *">
                        <Field type="text" class="form-control" name="Bank_Name" placeholder="Bank Name" :rules="isRequire" :class="{ 'is-invalid': errors.Bank_Name }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Bank_Name }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                    <b-col md="6">
                      <b-form-group label="Bank Branch Name: *">
                        <Field type="text" class="form-control" name="Bank_Branch" placeholder="Bank Branch Name" :rules="isRequire" :class="{ 'is-invalid': errors.Bank_Branch }" />
                        <div class="invalid-feedback">
                          <span>{{ errors.Bank_Branch }}</span>
                        </div>
                      </b-form-group>
                    </b-col>
                  </b-row>
                </div>
                <a href="#payment" @click="changeTab(4)" class="btn btn-primary next action-button float-end" value="Next">Next</a>
                <a href="#account" @click="changeTab(2)" class="btn btn-dark previous action-button-previous float-end me-1" value="Previous">Previous</a>
              </fieldset>
            </div>
            <div id="confirm" :class="`${currentindex == 4 ? 'show' : 'd-none'}`">
              <fieldset>
                <div class="form-card">
                  <b-row>
                    <div class="col-7">
                      <h3 class="mb-4 text-start">Finish:</h3>
                    </div>
                  </b-row>
                  <br /><br />
                  <h2 class="text-success text-center">
                    <strong>SUCCESS !</strong>
                  </h2>
                  <br />
                  <b-row class="justify-content-center">
                    <div class="col-3">
                      <img src="../../assets/images/page-img/img-success.png" class="img-fluid" alt="fit-image" />
                    </div>
                  </b-row>
                  <br /><br />
                  <b-row class="justify-content-center">
                    <div class="col-7 text-center">
                      <h5 class="purple-text text-center">You Have Successfully Signed Up</h5>
                    </div>
                  </b-row>
                </div>
              </fieldset>
            </div>
            <!-- </b-form> -->
          </Form>
        </template>
      </iq-card>
    </b-col>
  </b-row>
</template>
<script>
import iqCard from '../../components/xray/cards/iq-card'

import { Form, Field } from 'vee-validate'
import * as yup from 'yup'
export default {
  name: 'ValidateWizard',
  components: {
    iqCard,
    Form,
    Field
  },
  data() {
    const schema = yup.object({
      userRole: yup.object().required(),
      FirstName: yup.string().required(),
      LastName: yup.string().required(),
      Address: yup.string().required(),
      Country: yup.object().required(),
      CompanyName: yup.string().required(),
      Contact_no: yup.string().required(),
      Alt_ContactNO: yup.string().required(),
      Email: yup.string().required().email(),
      pincode: yup.string().required(),
      city: yup.string().required(),
      new_password: yup.string().required().min(8),
      cnfm_password: yup.string().required().min(8),
      UserName: yup.string().required(),
      Company_Name: yup.string().required(),
      Company_URL: yup.string().required().url(),
      Company_Mail: yup.string().required().email(),
      Company_Address: yup.string().required(),
      PanNo: yup.string().required(),
      Account_No: yup.number().required(),
      Account_Holder_Name: yup.string().required(),
      IFSC_Code: yup.string().required(),
      Bank_Name: yup.string().required(),
      Bank_Branch: yup.string().required()
    })
    return {
      user: {
        fname: '',
        lname: '',
        name: '',
        username: '',
        email: '',
        new_password: '',
        Address: '',
        address2: '',
        company_name: '',
        profile_image: require('../../assets/images/user/11.png'),
        mobile_no: '',
        alter_contact: '',
        country: null,
        city: '',
        pincode: '',
        role: null
      },
      currentindex: 1,
      schema,
      users: []
    }
  },
  methods: {
    changeTab(val) {
      this.currentindex = val
    },
    onSubmit() {
      this.$router.replace('/user/user-list')
    },
    isRequire(value) {
      if (value && value.trim()) {
        return true
      }
      return 'this is Require'
    }
  }
}
</script>
