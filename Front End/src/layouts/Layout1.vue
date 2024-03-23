<template>
  <div>
    <div id="show-overlay"></div>
    <Loader />
    <div class="wrapper">
      <!-- Sidebar  -->
      <SideBarStyle1 :items="verticalMenu" :horizontal="horizontal" :logo="logo" @toggle="sidebarMini" />
      <div id="content-page" class="content-page" :class="horizontal ? 'ml-0' : ''">
        <!-- TOP Nav Bar -->
        <NavBarStyle1 title="Dashboard" :homeURL="{ name: 'dashboard.home-1' }" @toggle="sidebarMini" :logo="logo" :horizontal="horizontal" :items="horizontalMenu">
          <template v-slot:responsiveRight>
            <ul class="navbar-nav ms-auto navbar-list align-items-center">
              <li class="nav-item">
                <a class="search-toggle iq-waves-effect language-title" href="#"><img :src="selectedLang.image" alt="img-flaf" class="img-fluid me-1" style="height: 16px; width: 16px" /> {{ selectedLang.title }} <i class="ri-arrow-down-s-line"></i></a>
                <div class="iq-sub-dropdown">
                  <a class="iq-sub-card" href="javascript:void(0)" v-for="(lang, i) in langsOptions" :key="`Lang${i}`" @click="langChange(lang)"> <img :src="lang.image" alt="img-flaf" class="img-fluid me-2" />{{ lang.title }} </a>
                </div>
              </li>
              <li class="nav-item">
                <a href="javascript:void(0)" class="rtl-switch-toogle">
                  <span class="form-check form-switch">
                    <input class="form-check-input rtl-switch" type="checkbox" role="switch" id="rtl-switch" @click="store.switchDirection(false)" />
                    <span class="rtl-toggle-tooltip ltr-tooltip">Ltr</span>
                    <span class="rtl-toggle-tooltip rtl-tooltip">Rtl</span>
                  </span>
                </a>
              </li>
              <li class="nav-item iq-full-screen">
                <a href="#" class="iq-waves-effect" id="btnFullscreen"><i class="ri-fullscreen-line"></i></a>
              </li>
              <li class="nav-item">
                <a href="#" class="search-toggle iq-waves-effect">
                  <i class="ri-notification-3-fill"></i>
                  <span class="bg-danger dots"></span>
                </a>
                <div class="iq-sub-dropdown">
                  <div class="iq-card shadow-none m-0">
                    <div class="iq-card-body p-0">
                      <div class="bg-primary p-3">
                        <h5 class="mb-0 text-white">{{ $t('nav.allNotifications') }}<small class="badge badge-light float-right pt-1">4</small></h5>
                      </div>
                      <a href="#" class="iq-sub-card" v-for="(item, index) in notification" :key="index">
                        <div class="media align-items-center">
                          <div class="">
                            <img class="avatar-40 rounded" :src="item.image" alt="img" />
                          </div>
                          <div class="media-body ms-3">
                            <h6 class="mb-0">{{ item.name }}</h6>
                            <small class="float-right font-size-12">{{ item.date }}</small>
                            <p class="mb-0">
                              {{ item.description.substring(0, 40) + '...' }}
                            </p>
                          </div>
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
              </li>
              <li class="nav-item">
                <a href="#" class="search-toggle iq-waves-effect">
                  <i class="ri-mail-open-fill"></i>
                  <span class="bg-primary count-mail"></span>
                </a>
                <div class="iq-sub-dropdown">
                  <div class="iq-card shadow-none m-0">
                    <div class="iq-card-body p-0">
                      <div class="bg-primary p-3">
                        <h5 class="mb-0 text-white">{{ $t('nav.allMessages') }}<small class="badge badge-light float-right pt-1">5</small></h5>
                      </div>
                      <a href="#" class="iq-sub-card" v-for="(item, index) in message" :key="index">
                        <div class="media align-items-center">
                          <div class="">
                            <img class="avatar-40 rounded" :src="item.image" alt="img" />
                          </div>
                          <div class="media-body ms-3">
                            <h6 class="mb-0">{{ item.name }}</h6>
                            <small class="float-left font-size-12">{{ item.date }}</small>
                          </div>
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </template>
          <template v-slot:right>
            <ul class="navbar-list">
              <li>
                <a href="#" class="search-toggle iq-waves-effect d-flex align-items-center">
                  <img :src="userProfile" class="img-fluid rounded" alt="user" />
                  <div class="caption">
                    <h6 class="mb-0 line-height">Bini Jets</h6>
                    <span class="font-size-12">{{ $t('nav.user.available') }}</span>
                  </div>
                </a>
                <div class="iq-sub-dropdown iq-dropdown">
                  <div class="iq-card shadow-none m-0">
                    <div class="iq-card-body p-0">
                      <div class="bg-primary p-3">
                        <h5 class="mb-0 text-white line-height">Hello Nik jone</h5>
                        <span class="text-white font-size-12">{{ $t('nav.user.available') }}</span>
                      </div>
                      <a href="#" class="iq-sub-card iq-bg-primary-hover">
                        <div class="media align-items-center">
                          <div class="rounded iq-card-icon iq-bg-primary">
                            <i class="ri-file-line"></i>
                          </div>
                          <div class="media-body ms-3">
                            <h6 class="mb-0">
                              {{ $t('nav.user.profileTitle') }}
                            </h6>
                            <p class="mb-0 font-size-12">
                              {{ $t('nav.user.profileSub') }}
                            </p>
                          </div>
                        </div>
                      </a>
                      <a href="#" class="iq-sub-card iq-bg-primary-success-hover">
                        <div class="media align-items-center">
                          <div class="rounded iq-card-icon iq-bg-success">
                            <i class="ri-profile-line"></i>
                          </div>
                          <div class="media-body ms-3">
                            <h6 class="mb-0">
                              {{ $t('nav.user.profileEditTitle') }}
                            </h6>
                            <p class="mb-0 font-size-12">
                              {{ $t('nav.user.profileEditSub') }}
                            </p>
                          </div>
                        </div>
                      </a>
                      <a href="#" class="iq-sub-card iq-bg-primary-danger-hover">
                        <div class="media align-items-center">
                          <div class="rounded iq-card-icon iq-bg-danger">
                            <i class="ri-account-box-line"></i>
                          </div>
                          <div class="media-body ms-3">
                            <h6 class="mb-0">
                              {{ $t('nav.user.accountSettingTitle') }}
                            </h6>
                            <p class="mb-0 font-size-12">
                              {{ $t('nav.user.accountSettingSub') }}
                            </p>
                          </div>
                        </div>
                      </a>
                      <a href="#" class="iq-sub-card iq-bg-primary-secondary-hover">
                        <div class="media align-items-center">
                          <div class="rounded iq-card-icon iq-bg-secondary">
                            <i class="ri-lock-line"></i>
                          </div>
                          <div class="media-body ms-3">
                            <h6 class="mb-0">
                              {{ $t('nav.user.privacySettingTitle') }}
                            </h6>
                            <p class="mb-0 font-size-12">
                              {{ $t('nav.user.privacySettingSub') }}
                            </p>
                          </div>
                        </div>
                      </a>
                      <div class="d-inline-block w-100 text-center p-3">
                        <a class="iq-bg-danger iq-sign-btn" href="javascript:void(0)" @click="logout" role="button">{{ $t('nav.user.signout') }}<i class="ri-login-box-line ms-2"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </template>
        </NavBarStyle1>
        <!-- TOP Nav Bar END -->
        <router-view />
        <FooterStyle1>
          <template v-slot:left>
            <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            <li class="list-inline-item ms-1"><a href="#">Terms of Use</a></li>
          </template>
          <template v-slot:right>
            Copyright 2020 <a href="#">{{ appName }}</a> All Rights Reserved.
          </template>
        </FooterStyle1>
      </div>
    </div>
  </div>
</template>
<script>
import Loader from '../components/xray/loader/Loader'
import SideBarStyle1 from '../components/xray/sidebars/SideBarStyle1'
import NavBarStyle1 from '../components/xray/navbars/NavBarStyle1'
import FooterStyle1 from '../components/xray/footer/FooterStyle1'
import SideBarItems from '../FackApi/json/SideBar'
import HorizontalItems from '../FackApi/json/HorizontalMenu'
import profile from '../assets/images/user/1.jpg'
import loader from '../assets/images/logo.png'
import { xray } from '../config/pluginInit'
import { Users } from '../FackApi/api/chat'
import { useStore } from '../store/pinia/index'

import { mapActions, mapState } from 'pinia'
import { computed, ref } from 'vue'
export default {
  name: 'LayoutOne',
  components: {
    Loader,
    SideBarStyle1,
    NavBarStyle1,
    FooterStyle1
  },
  setup() {
    const customizer = useStore()
    const store = useStore()
    console.log(store.isRTL)
    const appName = computed(() => customizer.appName)
    const isActive = ref(false)
    return { appName, store, isActive }
  },
  mounted() {
    this.updateRadio()
  },
  computed: {
    ...mapState(useStore, {
      selectedLang: 'lang',
      langsOptions: 'langOption',
      colors: 'colors'
    })
  },
  watch: {},
  // sidebarTicket
  data() {
    return {
      horizontal: false,
      mini: false,
      darkMode: false,
      animated: { enter: 'zoomIn', exit: 'zoomOut' },
      animateClass: [
        { value: { enter: 'zoomIn', exit: 'zoomOut' }, text: 'Zoom' },
        { value: { enter: 'fadeInUp', exit: 'fadeOutDown' }, text: 'Fade' },
        {
          value: { enter: 'slideInLeft', exit: 'slideOutRight' },
          text: 'Slide'
        },
        {
          value: { enter: 'rotateInDownLeft', exit: 'rotateOutDownLeft' },
          text: 'Roll'
        }
      ],
      horizontalMenu: HorizontalItems,
      verticalMenu: SideBarItems,
      userProfile: profile,
      logo: loader,
      usersList: Users,
      rtl: false,
      message: [
        {
          image: require('../assets/images/user/01.jpg'),
          name: 'Nik Emma Watson',
          date: '13 jan'
        },
        {
          image: require('../assets/images/user/02.jpg'),
          name: 'Greta Life',
          date: '14 Jun'
        },
        {
          image: require('../assets/images/user/03.jpg'),
          name: 'Barb Ackue',
          date: '16 Aug'
        },
        {
          image: require('../assets/images/user/04.jpg'),
          name: 'Anna Sthesia',
          date: '21 Sept'
        },
        {
          image: require('../assets/images/user/05.jpg'),
          name: 'Bob Frapples',
          date: '29 Sept'
        }
      ],
      notification: [
        {
          image: require('../assets/images/user/01.jpg'),
          name: 'Nik Emma Watson',
          date: '23 hour ago',
          description: 'Enjoy smart access to videos, games'
        },
        {
          image: require('../assets/images/user/02.jpg'),
          name: 'Greta Life',
          date: '14 hour ago',
          description: 'Google Chromecast: Enjoy a world of entertainment'
        },
        {
          image: require('../assets/images/user/03.jpg'),
          name: 'Barb Ackue',
          date: '16 hour ago',
          description: 'Dell Inspiron Laptop: Get speed and performance from'
        },
        {
          image: require('../assets/images/user/04.jpg'),
          name: 'Anna Sthesia',
          date: '21 hour ago',
          description: 'Deliver your favorite playlist anywhere in your home '
        },
        {
          image: require('../assets/images/user/05.jpg'),
          name: 'Bob Frapples',
          date: '11 hour ago',
          description: 'MacBook Air features up to 8GB of memory, a fifth-generation'
        }
      ]
    }
  },
  methods: {
    updateRadio() {
      const store = useStore() // Get the store instance
      this.horizontal = store.horizontalMenu
      this.mini = store.miniSidebarMenu
    },
    sidebarHorizontal() {
      this.$useStore.dispatch('horizontalMenuAction')
      this.updateRadio()
    },
    sidebarMini() {
      xray.triggerSet()
      const store = useStore()
      store.miniSidebarMenu
      this.updateRadio()
    },
    rtlChange() {
      if (this.rtl) {
        this.rtlRemove()
      } else {
        this.rtlAdd()
      }
    },
    changeColor(code) {
      document.documentElement.style.setProperty('--iq-primary', code.primary)
      document.documentElement.style.setProperty('--iq-primary-light', code.primaryLight)
      if (this.darkMode) {
        document.documentElement.style.setProperty('--iq-bg-dark-color', code.bodyBgDark)
      } else {
        document.documentElement.style.setProperty('--iq-bg-light-color', code.bodyBgLight)
      }
    },
    reset() {
      this.changeColor({
        primary: '#827af3',
        primaryLight: '#b47af3',
        bodyBgLight: '#efeefd',
        bodyBgDark: '#1d203f'
      })
      this.animated = { enter: 'zoomIn', exit: 'zoomOut' }
      this.light()
    },
    logout() {
      localStorage.removeItem('user')
      localStorage.removeItem('access_token')
      this.$router.push({ name: 'auth1.sign-in1' })
    },
    langChange(lang) {
      this.langChangeState(lang)
      this.$i18n.locale = lang.value
      document.getElementsByClassName('iq-show')[0].classList.remove('iq-show')
      if (lang.value === 'ar') {
        this.rtlAdd(lang)
      } else {
        this.rtlRemove(lang)
      }
    },
    ...mapActions(useStore, {
      langChangeState: 'setLangAction',
      rtlAdd: 'setRtlAction',
      rtlRemove: 'removeRtlAction'
    })
  }
}
</script>
