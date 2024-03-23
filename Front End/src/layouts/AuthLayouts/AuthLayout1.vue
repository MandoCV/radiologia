<template>
  <div>
    <Loader />
    <section class="sign-in-page">
      <b-container class="container sign-in-page-bg mt-5 mb-md-5 mb-0 p-0">
        <div class="row no-gutters">
          <div class="col-md-6 text-center">
            <div class="sign-in-detail text-white">
              <a class="sign-in-logo mb-5" href="#"><img :src="logo" class="img-fluid" alt="logo" /></a>
              <Swiper
                :pagination="{
                  dynamicBullets: true
                }"
                :modules="modules"
                :option="slickOptions"
                :loop="true">
                <SwiperSlide class="item">
                  <img :src="require('../../assets/images/login/1.png')" class="img-fluid mb-4" alt="logo" />
                  <h4 class="mb-1 text-white">Manage your orders</h4>
                  <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                </SwiperSlide>
                <SwiperSlide class="item">
                  <img :src="require('../../assets/images/login/2.png')" class="img-fluid mb-4" alt="logo" />
                  <h4 class="mb-1 text-white">Manage your orders</h4>
                  <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                </SwiperSlide>
                <SwiperSlide class="item">
                  <img :src="require('../../assets/images/login/3.png')" class="img-fluid mb-4" alt="logo" />
                  <h4 class="mb-1 text-white">Manage your orders</h4>
                  <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                </SwiperSlide>
              </Swiper>
            </div>
          </div>
          <div class="col-md-6 position-relative">
            <div class="sign-in-from">
              <router-view></router-view>
            </div>
          </div>
        </div>
      </b-container>
    </section>
  </div>
</template>
<script>
import Loader from '../../components/xray/loader/Loader'
import logo from '../../assets/images/logo-white.png'
import { xray } from '../../config/pluginInit'
import bgImage from '../../assets/images/login/2.png'
import { Swiper, SwiperSlide } from 'swiper/vue'
// import required modules
import { Pagination } from 'swiper/modules'
// Import Swiper styles
import 'swiper/css'
import 'swiper/css/pagination'
export default {
  name: 'AuthLayout1',
  components: {
    Loader,
    Swiper,
    SwiperSlide
  },
  mounted() {
    xray.index()
  },
  data() {
    return {
      slickOptions: {
        slidesToShow: 1,
        arrows: false,
        dots: true
      },
      logo: logo,
      bgImageURL: bgImage
    }
  },
  setup() {
    return {
      modules: [Pagination]
    }
  }
}
</script>
