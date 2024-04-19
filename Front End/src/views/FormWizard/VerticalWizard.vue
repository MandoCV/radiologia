<template>
  <div class="container-fluid">
    <b-row>
      <b-col sm="12" lg="12">
        <iq-card class="iq-card">
          <template v-slot:headerTitle>
            <b-card-title>{{ $t('sidebar.verticalWizard') }}</b-card-title>
          </template>
          <template v-slot:body>
            <b-row>
              <b-col md="3">
                <ul id="top-tabbar-vertical" class="p-0">
                  <li class="active" :class="`${currentindex == 1 ? 'active' : ''} ${currentindex > 1 ? 'done active' : ''} `" id="personal">
                    <a href="#"> <i class="ri-lock-unlock-line text-primary"></i><span>Personal</span> </a>
                  </li>
                  <li id="contact" :class="`${currentindex == 2 ? 'active' : ''} ${currentindex > 2 ? 'done active' : ''}`">
                    <a href="#"> <i class="ri-user-fill text-danger"></i><span>Contact</span> </a>
                  </li>
                  <li id="official" :class="`${currentindex == 3 ? 'active' : ''} ${currentindex > 3 ? 'done active' : ''}`">
                    <a href="#"> <i class="ri-camera-fill text-success"></i><span>Official</span> </a>
                  </li>
                  <li id="payment" :class="`${currentindex == 4 ? 'active' : ''} ${currentindex > 4 ? 'done active' : ''}`">
                    <a href="#"> <i class="ri-check-fill text-warning"></i><span>Payment</span> </a>
                  </li>
                </ul>
              </b-col>
              <b-col md="9">
                <b-form id="form-wizard3" class="text-center">
                  <!-- fieldsets -->
                  <div :class="`${currentindex == 1 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-start">
                        <b-row>
                          <b-col>
                            <h3 class="mb-4">User Information:</h3>
                          </b-col>
                        </b-row>
                        <b-row>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="fname" class="mb-2">First Name: *</label>
                              <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name" spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="lname" class="mb-2">Last Name: *</label>
                              <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name" spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label class="my-2">Gender: *</label>
                              <div class="form-check d-flex ps-0">
                                <div class="custom-control custom-radio custom-control-inline me-4">
                                  <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" />
                                  <label class="custom-control-label" for="customRadio1"> Male</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                  <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" />
                                  <label class="custom-control-label" for="customRadio2"> Female</label>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="dob" class="mb-2">Date Of Birth: *</label>
                              <input type="date" class="form-control" id="dob" name="dob" />
                            </div>
                          </div>
                        </b-row>
                      </div>
                      <a href="#personal" class="btn btn-primary next action-button float-end" @click="changeTab(2)" value="Next">Next</a>
                    </fieldset>
                  </div>
                  <div :class="`${currentindex == 2 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-left">
                        <b-row>
                          <b-col>
                            <h3 class="mb-4">Contact Information:</h3>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <b-form-group label="Email ID : *">
                              <!-- <label for="email">Email Id: *</label> -->
                              <b-form-input type="email" class="form-control" id="email" name="email" placeholder="Email Id" />
                            </b-form-group>
                          </b-col>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ccno">Contact Number: *</label>
                              <input type="text" class="form-control" id="ccno" name="ccno" placeholder="Contact Number" spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="city">City: *</label>
                              <input type="text" class="form-control" id="city" name="city" placeholder="City." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="state">State: *</label>
                              <input type="text" class="form-control" id="state" name="state" placeholder="State." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                        </b-row>
                      </div>
                      <a href="#payment" @click="changeTab(3)" class="btn btn-primary next action-button float-end" value="Next">Next</a>
                      <a href="#account" @click="changeTab(1)" class="btn btn-dark previous action-button-previous float-end me-1" value="Previous">Previous</a>
                    </fieldset>
                  </div>
                  <div :class="`${currentindex == 3 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-left">
                        <div class="row">
                          <div class="col-12">
                            <h3 class="mb-4">Official Information:</h3>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="empid">Employee Id: *</label>
                              <input type="email" class="form-control" id="empid" name="empid" placeholder="Employee Id." />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="desg">Designation: *</label>
                              <input type="text" class="form-control" id="desg" name="desg" placeholder="Designation." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="accname">Departmrnt Name: *</label>
                              <input type="text" class="form-control" id="accname" name="accname" placeholder="Departmrnt Name." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="workhour">Working Hour: *</label>
                              <input type="text" class="form-control" id="workhour" name="workhour" placeholder="Working Hour." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <a href="#payment" @click="changeTab(4)" class="btn btn-primary next action-button float-end" value="Next">Next</a>
                      <a href="#account" @click="changeTab(2)" class="btn btn-dark previous action-button-previous float-end me-1" value="Previous">Previous</a>
                    </fieldset>
                  </div>
                  <div :class="`${currentindex == 4 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-left">
                        <div class="row">
                          <div class="col-12">
                            <h3 class="mb-4 text-left">Payment:</h3>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="panno">Pan No: *</label>
                              <input type="text" class="form-control" id="panno" name="panno" placeholder="Pan No." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="accno">Account No: *</label>
                              <input type="text" class="form-control" id="accno" name="accno" placeholder="Account No." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="holname">Account Holder Name: *</label>
                              <input type="text" class="form-control" id="holname" name="accname" placeholder="Account Holder Name." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">IFSC Code: *</label>
                              <input type="text" class="form-control" id="ifsc" name="ifsc" placeholder="IFSC Code." spellcheck="false" data-ms-editor="true" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <a href="#payment" @click="changeTab(1)" class="btn btn-primary next action-button float-end mt-3" value="Next">submit</a>
                      <!-- <a
                  href="#account"
                  @click="changeTab(1)"
                  class="btn btn-dark previous action-button-previous float-end me-1"
                  value="Previous"
                  >Previous</a
                > -->
                    </fieldset>
                  </div>
                </b-form>
              </b-col>
            </b-row>
          </template>
        </iq-card>
      </b-col>
    </b-row>
  </div>
</template>
<script>
import iqCard from '../../components/xray/cards/iq-card'
export default {
  name: 'VerticalWizard',
  components: { iqCard },
  data() {
    return {
      currentindex: 1
    }
  },
  methods: {
    changeTab(val) {
      this.currentindex = val
    }
  }
}
</script>
