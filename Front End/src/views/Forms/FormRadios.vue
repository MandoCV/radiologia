<template>
  <b-container fluid>
    <b-row>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Default Radio Buttons</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
            <!-- <template > -->
            <b-form-radio v-for="(item, index) in state" :key="index" inline v-model="stateActive[item[Object.keys(item)[0]]]" :name="item.name" :value="item.value" :disabled="item.disabled">{{ item.label }}</b-form-radio>
            <!-- </template> -->
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Custom Radio Buttons</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
            <!-- <template> -->
            <b-form-radio v-for="(item, index) in custom" :key="index" inline v-model="stateActive[item[Object.keys(item)[0]]]" :name="item.name" :value="item.value" :disabled="item.disabled">{{ item.label }}</b-form-radio>
            <!-- </template> -->
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Custom Colored Radio Buttons</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
            <div class="d-flex flex-wrap">
              <div v-for="(item, index) in color" :key="index" class="custom-control custom-radio custom-radio-color custom-control-inline">
                <div class="custom-control custom-radio custom-radio-color custom-control-inline">
                  <input type="radio" :class="`bg-${item.color} border-${item.color}`" class="custom-control-input" :disabled="item.disabled" :id="item.label" />
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
            <h4 class="card-title">Colored Radio Buttons</h4>
          </template>
          <template v-slot:body>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
            <!-- <template> -->
            <b-form-radio v-for="(item, index) in color" :key="index" class="custom-radio-color-checked" inline v-model="stateActive.color" :color="item.color" name="color" :value="item.value" :disabled="item.disabled">{{ item.label }}</b-form-radio>
            <!-- </template> -->
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
  name: 'FormRadios',
  components: { iqCard },
  mounted() {
    xray.index()
  },
  data() {
    return {
      stateActive: {
        single: 'active',
        disable: 'active',
        number: 'two',
        colorDisabled: 'six',
        color: 'danger'
      },
      state: [
        {
          name: 'single',
          label: 'Active',
          value: 'active',
          disabled: false
        },
        {
          name: 'single',
          label: 'Inactive',
          value: 'inactive',
          disabled: false
        },
        {
          name: 'disable',
          label: 'Active - Disabled',
          value: 'active',
          disabled: true
        },
        {
          name: 'disable-in',
          label: 'Inactive - Disabled',
          value: '',
          disabled: true
        }
      ],
      custom: [
        {
          name: 'number',
          label: 'One',
          value: 'one',
          disabled: false
        },
        {
          name: 'number',
          label: 'Two',
          value: 'two',
          disabled: false
        },
        {
          name: 'number',
          label: 'Three',
          value: 'three',
          disabled: false
        },
        {
          name: 'checked',
          label: 'Four Checked',
          value: 'four',
          disabled: false
        },
        {
          name: 'seldis',
          label: 'Five disabled',
          value: 'five',
          disabled: true
        },
        {
          name: 'colorDisabled',
          label: 'Six selected and disabled',
          value: 'six',
          disabled: true
        }
      ],
      color: [
        {
          label: 'Primary',
          color: 'primary',
          value: 'primary'
        },
        {
          label: 'Success',
          color: 'success',
          value: 'success'
        },
        {
          label: 'Danger',
          color: 'danger',
          value: 'danger'
        },
        {
          label: 'Warning',
          color: 'warning',
          value: 'warning'
        },
        {
          label: 'Dark',
          color: 'dark',
          value: 'dark'
        },
        {
          label: 'Info',
          color: 'info',
          value: 'info'
        }
      ]
    }
  }
}
</script>
