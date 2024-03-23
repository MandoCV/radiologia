import { defineStore } from 'pinia'
import SideBarItems from '../../FackApi/json/SideBar.json'
const debug = process.env.NODE_ENV !== 'production'
export const useStore = defineStore('store', {
  state: () => ({
    appName: 'MineCode',
    isRTL: false,
    // Chat
    chat: [],

    videoCall: false,
    namespaced: true,
    // Setting
    horizontalMenu: false,
    miniSidebarMenu: false,
    lang: {
      title: 'English',
      value: 'en',
      image: require('../../assets/images/small/flag-01.png')
    },
    langOption: [
      {
        title: 'English',
        value: 'en',
        image: require('../../assets/images/small/flag-01.png')
      },
      {
        title: 'Arabic',
        value: 'ar',
        image: require('../../assets/images/small/flag-500.png')
      },
      {
        title: 'Chinese',
        value: 'chi',
        image: require('../../assets/images/small/flag-300.png')
      },
      {
        title: 'Hindi',
        value: 'hi',
        image: require('../../assets/images/small/flag-100.png')
      },
      {
        title: 'Greek',
        value: 'gr',
        image: require('../../assets/images/small/flag-400.png')
      },
      {
        title: 'Franch',
        value: 'fr',
        image: require('../../assets/images/small/flag-200.png')
      }
    ],
    colors: [
      {
        primary: '#827af3',
        primaryLight: '#b47af3',
        bodyBgLight: '#efeefd',
        bodyBgDark: '#1d203f'
      },
      {
        primary: '#e07af3',
        primaryLight: '#f37ab7',
        bodyBgLight: '#f7eefd',
        bodyBgDark: '#1d203f'
      },
      {
        primary: '#6475c7',
        primaryLight: '#7abbf3',
        bodyBgLight: '#eaf5ff',
        bodyBgDark: '#1d203f'
      },
      {
        primary: '#c76464',
        primaryLight: '#f3c37a',
        bodyBgLight: '#fff8ea',
        bodyBgDark: '#1d203f'
      },
      {
        primary: '#c764ad',
        primaryLight: '#de8ba9',
        bodyBgLight: '#ffeaf5',
        bodyBgDark: '#1d203f'
      },
      {
        primary: '#64c7ac',
        primaryLight: '#a3f37a',
        bodyBgLight: '#f0ffea',
        bodyBgDark: '#1d203f'
      },
      {
        primary: '#8ac764',
        primaryLight: '#dbf37a',
        bodyBgLight: '#f7ffea',
        bodyBgDark: '#1d203f'
      }
    ],
    authUser: {
      auth: false,
      authType: false,
      user: {}
    },
    users: [
      {
        id: 'sh46s546sdg564sdffs4hsd6fh',
        name: 'Admin Xray',
        mobileNo: null,
        email: 'admin@xray.com',
        profileImage: null,
        password: 'admin123'
      }
    ],
    globalSearch: SideBarItems,
    bookmark: [
      {
        title: 'Video Chat',
        link: { name: 'app.chat' },
        is_icon_class: true,
        icon: 'ri-message-line'
      },
      {
        title: 'Product Listing',
        link: { name: 'app.e-commerce.index' },
        is_icon_class: true,
        icon: 'ri-file-list-line'
      },
      {
        title: 'Social App',
        link: { name: 'social.list' },
        is_icon_class: true,
        icon: 'ri-question-answer-line'
      },
      {
        title: 'Todo',
        link: { name: 'app.todo' },
        is_icon_class: true,
        icon: 'ri-chat-check-line'
      },
      {
        title: 'Inbox',
        link: { name: 'app.email' },
        is_icon_class: true,
        icon: 'ri-inbox-line'
      }
    ],
    activePage: {
      name: 'Dashboard',
      breadCrumb: [
        {
          html: '<i class="ri-home-4-line mr-1 float-left"></i>Home',
          to: { name: 'mini.dashboard.home-1' }
        },
        {
          text: '',
          href: '#'
        }
      ]
    }
  }),
  actions: {
    // RTL & LTR Mode
    switchDirection() {
      const element = document.querySelector('html')
      this.isRTL = !this.isRTL
      element.setAttribute('dir', this.isRTL ? 'rtl' : 'ltr')
      console.log(this.isRTL ? 'RTL' : 'LTR')
    },

    // Chat
    listAction() {
      return new Promise((resolve) => {
        this.listCommit = !this.listCommit
        resolve()
      })
    },
    videoCallAction() {
      return new Promise((resolve) => {
        this.videoCallCommit = !this.videoCallCommit
        resolve()
      })
    },
    // Setting
    horizontalMenuAction() {
      this.horizontalMenuCommit = !this.horizontalMenuCommit
    },
    miniSidebarAction() {
      return new Promise((resolve) => {
        if (this.miniSidebarMenu) {
          this.miniSidebarCommit(false)
          resolve(false)
        } else {
          this.miniSidebarCommit(true)
          resolve(true)
        }
      })
    },
    authUserAction() {
      this.authUserCommit = !this.authUserCommit
    },
    addUserAction() {
      this.addUserCommit = !this.addUserCommit
    },
    activePageAction() {
      this.activePageCommit = !this.activePageCommit
    },
    addBookmarkAction() {
      this.addBookmarkCommit = !this.addBookmarkCommit
    },
    removeBookmarkAction() {
      this.removeBookmarkCommit = !this.removeBookmarkCommit
    },
    // setLangAction() {
    //   // context.commit("setLangCommit", payload);
    //   this.setLangCommit = !this.setLangCommit;
    //   console.log("Set Lang Commit " + this.setLangCommit)
    // },
    setLangAction(lang) {
      this.lang = lang
    },
    setRtlAction() {
      document.getElementsByTagName('html')[0].setAttribute('dir', 'rtl')
      let body = document.getElementsByTagName('body')
      body[0].classList.add('rtl')
      body[0].classList.remove('light')
    },
    removeRtlAction() {
      document.getElementsByTagName('html')[0].setAttribute('dir', 'ltr')
      let body = document.getElementsByTagName('body')
      body[0].classList.remove('rtl')
      body[0].classList.add('light')
    }
  },
  getters: {
    // Chat
    chatState: (state) => state.chat,
    videoCallState: (state) => state.videoCall,
    // Setting
    horizontalMenuState: (state) => state.horizontalMenu,
    miniSidebarState: (state) => state.miniSidebarMenu,
    authUserState: (state) => state.authUser,
    usersState: (state) => state.users,
    activePage: (state) => state.activePage,
    langState: (state) => state.lang,
    globalSearchState: (state) => state.globalSearch,
    bookmarkState: (state) => state.bookmark,
    langOptionState: (state) => state.langOption,
    colorState: (state) => state.colors
  },
  mutations: {
    // Chat
    listCommit(state, data) {
      state.chat = data
    },
    videoCallCommit(state, data) {
      state.videoCall = data
    },
    // Setting
    horizontalMenuCommit(state, data) {
      state.horizontalMenu = data
    },
    miniSidebarCommit(state, data) {
      state.miniSidebarMenu = data
    },
    authUserCommit(state, data) {
      state.authUser = data
    },
    addUserCommit(state, data) {
      state.users.push(data)
    },
    activePageCommit(state, data) {
      state.activePage = data
    },
    addBookmarkCommit(state, data) {
      state.bookmark.push(data)
    },
    removeBookmarkCommit(state, data) {
      let book = state.bookmark.findIndex((item) => item.link.name === data.link.name)
      if (book !== -1) {
        state.bookmark.splice(book, 1)
      }
    },
    setLangCommit(state, data) {
      state.lang = data
    }
  },
  plugins: debug,
  strict: debug
})
window.pinia = useStore
