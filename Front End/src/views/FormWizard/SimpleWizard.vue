<template>
  <b-row>
    <b-col sm="12">
      <iq-card no-body>
        <template v-slot:headerTitle>
          <b-card-title>{{ $t('sidebar.simpleWizard') }}</b-card-title>
        </template>

        <template v-slot:body>
          <b-form id="form-wizard1" class="text-center mt-4">
            <ul id="top-tab-list" class="p-0">
              <li :class="`${currentindex == 1 ? 'active' : ''} ${currentindex > 1 ? 'done active' : ''} col-lg-3 col-md-6 mb-2 text-start `" id="account">
                <a href="javascript:void(0);" class="d-flex align-items-center">
                  <i class="ri-lock-unlock-line"></i>
                  <span>Account</span>
                </a>
              </li>
              <li :class="`${currentindex == 2 ? 'active' : ''} ${currentindex > 2 ? 'done active' : ''} col-lg-3 col-md-6 mb-2 text-start `" id="personal">
                <a href="javascript:void(0);" class="d-flex align-items-center">
                  <i class="ri-user-fill"></i>
                  <span class="dark-wizard">Personal</span>
                </a>
              </li>
              <li :class="`${currentindex == 3 ? 'active' : ''} ${currentindex > 3 ? 'done active' : ''} col-lg-3 col-md-6 mb-2 text-start `" id="payment">
                <a href="javascript:void(0);" class="d-flex align-items-center">
                  <i class="ri-camera-fill"></i>
                  <span class="dark-wizard">Image</span>
                </a>
              </li>
              <li :class="`${currentindex == 4 ? 'active' : ''} ${currentindex > 4 ? 'done' : ''} col-lg-3 col-md-6 mb-2 text-start `" id="confirm">
                <a href="javascript:void(0);" class="d-flex align-items-center">
                  <i class="ri-check-fill"></i>
                  <span class="dark-wizard">Finish</span>
                </a>
              </li>
            </ul>
            <div :class="`${currentindex == 1 ? 'show' : 'd-none'}`">
              <account-component @onClick="changeTab"></account-component>
            </div>
            <div :class="`${currentindex == 2 ? 'show' : 'd-none'}`">
              <personal-component @onClick="changeTab"></personal-component>
            </div>
            <div id="payment" :class="`${currentindex == 3 ? 'show' : 'd-none'}`">
              <image-component @onClick="changeTab"></image-component>
            </div>
            <div id="confirm" :class="`${currentindex == 4 ? 'show' : 'd-none'}`">
              <finish-component @onClick="changeTab"></finish-component>
            </div>
          </b-form>
        </template>
      </iq-card>
    </b-col>
  </b-row>
</template>
<script>
// src/components/xray/wizard/AccountComponent.vue
import iqCard from '../../components/xray/cards/iq-card'
import AccountComponent from '../../components/xray/wizard/AccountComponent.vue'
import PersonalComponent from '../../components/xray/wizard/PersonalComponent.vue'
import ImageComponent from '../../components/xray/wizard/ImageComponent.vue'
import FinishComponent from '../../components/xray/wizard/FinishComponent.vue'
export default {
  name: 'WizardPage',
  components: {
    iqCard,
    AccountComponent,
    PersonalComponent,
    ImageComponent,
    FinishComponent
  },
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
