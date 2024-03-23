<template>
  <b-container fluid>
    <b-row>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Basic Checkbox</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
            <div class="checkbox d-inline-block me-2" v-for="(item, index) in state" :key="index">
              <input type="checkbox" class="checkbox-input" :id="`basic-checkbox-${index}`" v-model="item.checked" :disabled="item.disabled" />
              <label :for="`basic-checkbox-${index}`" class="ms-1">{{ item.label }}</label>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Custom Checkbox</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>

            <b-form-checkbox v-for="(item, index) in custom_checkbox" class="custom-switch-color" :class="item.checked === true ? 'bg-primary border-primary' : ''" :color="item.color" v-model="item.checked" :disabled="item.disabled" name="check-button" inline v-bind:key="index">
              {{ item.label }}
            </b-form-checkbox>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Custom Color</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
            <div class="d-flex gap-3 flex-wrap">
              <div v-for="(item, index) in customColor" :key="index" class="custom-control custom-checkbox custom-checkbox-color custom-control-inline">
                <div class="custom-control custom-checkbox custom-checkbox-color custom-control-inline">
                  <input type="checkbox" :class="`bg-${item.color} border-${item.color}`" class="custom-control-input" :disabled="item.disabled" :id="item.label" />
                  <label class="custom-control-label" :for="item.label">{{ item.label }}</label>
                </div>
              </div>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Color</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>

            <div class="d-flex gap-3 flex-wrap">
              <div v-for="(item, index) in color" class="custom-control custom-checkbox custom-checkbox-color-check custom-control-inline" v-bind:key="index">
                <input type="checkbox" :class="item.checked === true ? `bg-${item.color} border-${item.color} ` : ''" v-model="item.checked" class="custom-control-input me-1" :id="item.id" />
                <label class="custom-control-label" :for="item.id"> {{ item.label }}</label>
              </div>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Boolean Checkbox</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
            <div class="d-flex gap-3 flex-wrap">
              <b-form-checkbox v-for="(item, index) in bool" v-model="item.checked" :class="custom - control - label" :disabled="item.disabled" name="check-button" v-bind:key="index">
                {{ item.label }}
              </b-form-checkbox>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Change Icon</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
            <div class="d-flex gap-3 flex-wrap">
              <div v-for="(item, index) in icon" class="custom-control custom-checkbox checkbox-icon custom-control-inline" v-bind:key="index">
                <input type="checkbox" class="custom-control-input" :id="`customSwitch-1-${index}`" v-model="item.checked" />
                <label class="custom-control-label" :for="`customSwitch-1-${index}`" v-html="item.label"></label>
              </div>
            </div>
          </template>
        </iq-card>
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
import { xray } from '../../config/pluginInit'
import iqCard from '../../components/xray/cards/iq-card'
export default {
  name: 'FormCheckboxes',
  components: { iqCard },
  mounted() {
    xray.index()
  },
  data() {
    return {
      state: [
        {
          label: 'Primary / Inactive',
          checked: false,
          disabled: false
        },
        {
          label: 'Primary / Active',
          checked: true,
          disabled: false
        },
        {
          label: 'Disabled / Inactive',
          checked: false,
          disabled: false
        },
        {
          label: 'Active / Disable',
          checked: true,
          disabled: true
        }
      ],
      custom_checkbox: [
        {
          label: 'Primary / Inactive',
          checked: false,
          disabled: false
        },
        {
          label: 'Primary / Active',
          checked: true,
          disabled: false
        },
        {
          label: 'Primary - inactive - disabled',
          checked: false,
          disabled: false
        },
        {
          label: 'Primary - active - disabled',
          checked: true,
          disabled: true
        }
      ],
      text: [
        {
          activeLabel: 'On',
          inactiveLabel: 'Off',
          label: 'Primary',
          class: 'primary',
          checked: true
        },
        {
          activeLabel: 'True',
          inactiveLabel: 'False',
          label: 'Success',
          class: 'success',
          checked: true
        },
        {
          activeLabel: 'Yes',
          inactiveLabel: 'No',
          label: 'Danger',
          class: 'danger',
          checked: true
        }
      ],
      customColor: [
        {
          label: 'Primary',
          color: 'primary',
          checked: true
        },
        {
          label: 'Success',
          color: 'success',
          checked: true
        },
        {
          label: 'Danger',
          color: 'danger',
          checked: true
        },
        {
          label: 'Warning',
          color: 'warning',
          checked: true
        },
        {
          label: 'Dark',
          color: 'dark',
          checked: true
        },
        {
          label: 'Info',
          color: 'info',
          checked: true
        }
      ],
      color: [
        {
          id: 1,
          label: 'Primary',
          color: 'primary',
          checked: true
        },
        {
          id: 2,
          label: 'Success',
          color: 'success',
          checked: true
        },
        {
          id: 3,
          label: 'Danger',
          color: 'danger',
          checked: true
        },
        {
          id: 4,
          label: 'Warning',
          color: 'warning',
          checked: true
        },
        {
          id: 5,
          label: 'Dark',
          color: 'dark',
          checked: true
        },
        {
          id: 6,
          label: 'Info',
          color: 'info',
          checked: true
        }
      ],
      icon: [
        {
          label: '<i class="fa fa-music"></i> Music',
          checked: true
        },
        {
          label: '<i class="fa fa-commenting-o"></i> SMS',
          checked: true
        },
        {
          label: '<i class="fa fa-times"></i> Cancel',
          checked: true
        },
        {
          label: '<i class="fa fa-file"></i> File',
          checked: true
        },
        {
          label: '<i class="fa fa-bold"></i> Bold',
          checked: true
        },
        {
          label: '<i class="fa fa-map-marker"></i> Location',
          checked: true
        },
        {
          label: '<i class="fa fa-camera"></i> Camera',
          checked: true
        }
      ],
      bool: [
        {
          label: 'True',
          checked: true
        },
        {
          label: 'False',
          checked: false
        }
      ]
    }
  }
}
</script>
