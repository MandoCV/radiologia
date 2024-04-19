<template>
  <b-container fluid>
    <b-row>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Notifications</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-1 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>Toasts are as flexible as you need and have very little required markup. At a minimum, we require a single element to contain your “toasted” content and strongly encourage a dismiss button.</p>
            <b-collapse id="collapse-1" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="notification-1">
                    <code>
&lt;b-toast visible static no-auto-hide no-close-button&gt;
  &lt;template v-slot:toast-title&gt;
    &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
      &lt;rect width="100%" height="100%" fill="#007aff"&gt;&lt;/rect&gt;
    &lt;/svg&gt;
    &lt;strong class="mr-auto"&gt;Bootstrap&lt;/strong&gt;
    &lt;small&gt;11 mins ago&lt;/small&gt;
    &lt;button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"&gt;
      &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
    &lt;/button&gt;
  &lt;/template&gt;
  Hello, world! This is a toast message.
&lt;/b-toast&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>

            <div class="toast fade" :class="{ show: toast_fade_1 }" role="alert" aria-live="assertive" aria-atomic="true">
              <div class="toast-header">
                <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                  <rect width="100%" height="100%" fill="#007aff"></rect>
                </svg>
                <strong class="me-auto">Bootstrap</strong>
                <small class="text-muted">11 mins ago</small>
                <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
              </div>
              <div class="toast-body">Hello, world! This is a toast message.</div>
            </div>
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Stacking</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-2 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>When you have multiple toasts, we default to vertically stacking them in a readable manner.</p>
            <b-collapse id="collapse-2" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="notification-2">
                    <code>
&lt;b-toast visible static no-auto-hide no-close-button&gt;
  &lt;template v-slot:toast-title&gt;
    &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
      &lt;rect width="100%" height="100%" fill="#007aff"&gt;&lt;/rect&gt;
    &lt;/svg&gt;
    &lt;strong class="mr-auto"&gt;Bootstrap&lt;/strong&gt;
    &lt;small class="text-muted"&gt;just now&lt;/small&gt;
    &lt;button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"&gt;
      &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
    &lt;/button&gt;
  &lt;/template&gt;
  See? Just like this.
&lt;/b-toast&gt;
&lt;b-toast visible static no-auto-hide no-close-button&gt;
  &lt;template v-slot:toast-title&gt;
    &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
      &lt;rect width="100%" height="100%" fill="#007aff"&gt;&lt;/rect&gt;
    &lt;/svg&gt;
    &lt;strong class="mr-auto"&gt;Bootstrap&lt;/strong&gt;
    &lt;small class="text-muted"&gt;2 seconds ago&lt;/small&gt;
    &lt;button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"&gt;
      &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
    &lt;/button&gt;
  &lt;/template&gt;
  Heads up, toasts will stack automatically
&lt;/b-toast&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <div class="toast fade mb-3" :class="{ show: toast_fade_2 }" role="alert" aria-live="assertive" aria-atomic="true">
              <div class="toast-header">
                <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                  <rect width="100%" height="100%" fill="#007aff"></rect>
                </svg>
                <strong class="me-auto">Bootstrap</strong>
                <small class="text-muted">just now</small>
                <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
              </div>
              <div class="toast-body">See? Just like this.</div>
            </div>
            <div class="toast fade" :class="{ show: toast_fade_3 }" role="alert" aria-live="assertive" aria-atomic="true">
              <div class="toast-header">
                <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                  <rect width="100%" height="100%" fill="#007aff"></rect>
                </svg>
                <strong class="me-auto">Bootstrap</strong>
                <small class="text-muted">2 seconds ago</small>
                <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
              </div>
              <div class="toast-body">Heads up, toasts will stack automatically</div>
            </div>
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Notifications horizontally and/or vertically</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-3 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>You can also get fancy with flexbox utilities to align toasts horizontally and/or vertically.</p>
            <b-collapse id="collapse-3" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="notification-3">
                    <code>
&lt;div class="p-3 bg-dark"&gt;
  &lt;div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center" style="min-height: 200px;"&gt;
    &lt;b-toast visible static no-auto-hide no-close-button&gt;
      &lt;template v-slot:toast-title&gt;
        &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
          &lt;rect width="100%" height="100%" fill="#007aff"&gt;&lt;/rect&gt;
        &lt;/svg&gt;
        &lt;strong class="mr-auto"&gt;Bootstrap&lt;/strong&gt;
        &lt;small&gt;11 mins ago&lt;/small&gt;
        &lt;button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"&gt;
          &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
        &lt;/button&gt;
      &lt;/template&gt;
      Hello, world! This is a toast message.
    &lt;/b-toast&gt;
  &lt;/div&gt;
&lt;/div&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <div class="p-3 bg-dark">
              <div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center" style="min-height: 200px">
                <div class="toast fade" :class="{ show: toast_fade_4 }" role="alert" aria-live="assertive" aria-atomic="true">
                  <div class="toast-header">
                    <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                      <rect width="100%" height="100%" fill="#007aff"></rect>
                    </svg>
                    <strong class="me-auto">Bootstrap</strong>
                    <small class="text-muted">11 mins ago</small>
                    <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
                  </div>
                  <div class="toast-body">Hello, world! This is a toast message.</div>
                </div>
              </div>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Notifications</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-4 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>
              Toasts are slightly translucent, too, so they blend over whatever they might appear over. For browsers that support the
              <code>backdrop-filter</code> CSS property, we’ll also attempt to blur the elements under a toast.
            </p>
            <b-collapse id="collapse-4" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="notification-4">
                    <code>
&lt;div class="p-3 bg-dark"&gt;
  &lt;b-toast visible static no-auto-hide no-close-button&gt;
    &lt;template v-slot:toast-title&gt;
      &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
        &lt;rect width="100%" height="100%" fill="#007aff"&gt;&lt;/rect&gt;
      &lt;/svg&gt;
      &lt;strong class="mr-auto"&gt;Bootstrap&lt;/strong&gt;
      &lt;small&gt;11 mins ago&lt;/small&gt;
      &lt;button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"&gt;
        &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
      &lt;/button&gt;
    &lt;/template&gt;
    Hello, world! This is a toast message.
  &lt;/b-toast&gt;
&lt;/div&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <div class="p-3 bg-dark">
              <div class="toast fade" :class="{ show: toast_fade_5 }" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                  <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <rect width="100%" height="100%" fill="#007aff"></rect>
                  </svg>
                  <strong class="me-auto">Bootstrap</strong>
                  <small class="text-muted">11 mins ago</small>
                  <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">Hello, world! This is a toast message.</div>
              </div>
            </div>
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Stacking Placement</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-5 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>Place toasts with custom CSS as you need them. The top right is often used for notifications, as is the top middle. If you’re only ever going to show one toast at a time, put the positioning styles right on the <code>.toast</code>.</p>
            <b-collapse id="collapse-5" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="notification-5">
                    <code>
&lt;div class="p-3 bg-dark"&gt;
  &lt;div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;"&gt;
    &lt;b-toast visible static no-auto-hide no-close-button toast-class="position-absolute"&gt;
      &lt;template v-slot:toast-title&gt;
        &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
          &lt;rect width="100%" height="100%" fill="#007aff"&gt;&lt;/rect&gt;
        &lt;/svg&gt;
        &lt;strong class="mr-auto"&gt;Bootstrap&lt;/strong&gt;
        &lt;small&gt;11 mins ago&lt;/small&gt;
        &lt;button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"&gt;
          &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
        &lt;/button&gt;
      &lt;/template&gt;
      Hello, world! This is a toast message.
    &lt;/b-toast&gt;
  &lt;/div&gt;
&lt;/div&gt;
&lt;p class="mt-3"&gt;For systems that generate more notifications, consider using a wrapping element so they can easily stack.&lt;/p&gt;
&lt;div class="bg-dark p-3 mt-3"&gt;
  &lt;div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;"&gt;
    &lt;div style="position: absolute; top: 0; right: 0;"&gt;
    &lt;b-toast visible static no-auto-hide no-close-button&gt;
      &lt;template v-slot:toast-title&gt;
        &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
          &lt;rect width="100%" height="100%" fill="#007aff"&gt;&lt;/rect&gt;
        &lt;/svg&gt;
        &lt;strong class="mr-auto"&gt;Bootstrap&lt;/strong&gt;
        &lt;small class="text-muted"&gt;just now&lt;/small&gt;
        &lt;button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"&gt;
          &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
        &lt;/button&gt;
      &lt;/template&gt;
      See? Just like this.
    &lt;/b-toast&gt;
    &lt;b-toast visible static no-auto-hide no-close-button&gt;
      &lt;template v-slot:toast-title&gt;
        &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
          &lt;rect width="100%" height="100%" fill="#007aff"&gt;&lt;/rect&gt;
        &lt;/svg&gt;
        &lt;strong class="mr-auto"&gt;Bootstrap&lt;/strong&gt;
        &lt;small class="text-muted"&gt;2 seconds ago&lt;/small&gt;
        &lt;button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"&gt;
          &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
        &lt;/button&gt;
      &lt;/template&gt;
      Heads up, toasts will stack automatically
    &lt;/b-toast&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <div class="p-3 bg-dark">
              <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px">
                <div class="toast fade" :class="{ show: toast_fade_6 }" role="alert" aria-live="assertive" aria-atomic="true" style="position: absolute; top: 0; right: 0">
                  <div class="toast-header">
                    <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                      <rect width="100%" height="100%" fill="#007aff"></rect>
                    </svg>
                    <strong class="me-auto">Bootstrap</strong>
                    <small class="text-muted">11 mins ago</small>
                    <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
                  </div>
                  <div class="toast-body">Hello, world! This is a toast message.</div>
                </div>
              </div>
            </div>
            <p class="mt-3">For systems that generate more notifications, consider using a wrapping element so they can easily stack.</p>
            <div class="bg-dark p-3 mt-3">
              <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px">
                <div style="position: absolute; top: 0; left: 0">
                  <div class="toast fade mb-3" :class="{ show: toast_fade_7 }" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header">
                      <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <rect width="100%" height="100%" fill="#007aff"></rect>
                      </svg>
                      <strong class="me-auto">Bootstrap</strong>
                      <small class="text-muted">just now</small>
                      <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body">See? Just like this.</div>
                  </div>

                  <div class="toast fade" :class="{ show: toast_fade_8 }" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header">
                      <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <rect width="100%" height="100%" fill="#007aff"></rect>
                      </svg>
                      <strong class="me-auto">Bootstrap</strong>
                      <small class="text-muted">2 seconds ago</small>
                      <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body">Hello, world! This is a toast message.</div>
                  </div>
                </div>
              </div>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Notifications</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-6 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>Toasts are as flexible as you need and have very little required markup. At a minimum, we require a single element to contain your “toasted” content and strongly encourage a dismiss button.</p>
            <b-collapse id="collapse-6" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="notification-6">
                    <code>
&lt;b-toast visible static no-auto-hide no-close-button toast-class="bg-primary" body-class="text-white"  header-class="bg-primary text-white"&gt;
  &lt;template v-slot:toast-title&gt;
    &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
      &lt;rect width="100%" height="100%" fill="#fff"&gt;&lt;/rect&gt;
    &lt;/svg&gt;
    &lt;strong class="mr-auto text-white"&gt;Bootstrap&lt;/strong&gt;
    &lt;small class="text-white"&gt;11 mins ago&lt;/small&gt;
    &lt;button type="button" class="ml-2 mb-1 close text-white" data-dismiss="toast" aria-label="Close"&gt;
      &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
    &lt;/button&gt;
  &lt;/template&gt;
  See? Just like this.
&lt;/b-toast&gt;
&lt;b-toast variant="success" visible static no-auto-hide no-close-button toast-class="bg-success mt-3" body-class="text-white"  header-class="bg-success text-white"&gt;
  &lt;template v-slot:toast-title&gt;
    &lt;svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"&gt;
      &lt;rect width="100%" height="100%" fill="#fff"&gt;&lt;/rect&gt;
    &lt;/svg&gt;
    &lt;strong class="mr-auto text-white"&gt;Bootstrap&lt;/strong&gt;
    &lt;small class="text-white"&gt;11 mins ago&lt;/small&gt;
    &lt;button type="button" class="ml-2 mb-1 close text-white" data-dismiss="toast" aria-label="Close"&gt;
      &lt;span aria-hidden="true"&gt;×&lt;/span&gt;
    &lt;/button&gt;
  &lt;/template&gt;
  Heads up, toasts will stack automatically
&lt;/b-toast&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>

            <div class="toast fade mb-3 bg-primary" :class="{ show: toast_fade_9 }" role="alert" aria-live="assertive" aria-atomic="true">
              <div class="toast-header bg-primary">
                <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                  <rect width="100%" height="100%" fill="#fff"></rect>
                </svg>
                <strong class="me-auto">Bootstrap</strong>
                <small class="text-muted text-white">11 mins ago</small>
                <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
              </div>
              <div class="toast-body">Hello, world! This is a toast message.</div>
            </div>

            <div class="toast fade bg-success" :class="{ show: toast_fade_10 }" role="alert" aria-live="assertive" aria-atomic="true">
              <div class="toast-header bg-success">
                <svg class="rounded bd-placeholder-img me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                  <rect width="100%" height="100%" fill="#fff"></rect>
                </svg>
                <strong class="me-auto">Bootstrap</strong>
                <small class="text-muted text-white">11 mins ago</small>
                <button v-on:click="toast_fade = !toast_fade" type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
              </div>
              <div class="toast-body">Hello, world! This is a toast message.</div>
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
  name: 'UiNotifications',
  components: { iqCard },
  data() {
    return {
      toast_fade_1: true,
      toast_fade_2: true,
      toast_fade_3: true,
      toast_fade_4: true,
      toast_fade_5: true,
      toast_fade_6: true,
      toast_fade_7: true,
      toast_fade_8: true,
      toast_fade_9: true,
      toast_fade_10: true
    }
  },
  mounted() {
    xray.index()
  }
}
</script>
