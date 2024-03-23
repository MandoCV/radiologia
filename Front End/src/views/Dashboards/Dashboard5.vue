<template>
  <b-container fluid>
    <b-row>
      <b-col sm="12">
        <b-row>
          <b-col md="6" lg="3">
            <iq-card body-class=" rounded">
              <template v-slot:body>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="text-left">
                    <h4 class="mb-2 mt-2">Confirm</h4>
                    <h3 class="mb-0 line-height">
                      <span><count-up :end-val="183325" duration="5"></count-up></span>
                    </h3>
                  </div>
                  <div class="rounded-circle iq-card-icon bg-primary">
                    <i class="ri-task-line"></i>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card body-class=" rounded">
              <template v-slot:body>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="text-left">
                    <h4 class="mb-2 mt-2">Recovered</h4>
                    <h3 class="mb-0 line-height">
                      <span><count-up :end-val="79908" duration="5"></count-up></span>
                    </h3>
                  </div>
                  <div class="rounded-circle iq-card-icon bg-warning">
                    <i class="ri-hospital-line"></i>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card body-class=" rounded">
              <template v-slot:body>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="text-left">
                    <h4 class="mb-2 mt-2">Death</h4>
                    <h3 class="mb-0 line-height">
                      <span><count-up :end-val="7177" duration="5"></count-up></span>
                    </h3>
                  </div>
                  <div class="rounded-circle iq-card-icon bg-danger">
                    <i class="ri-gradienter-line"></i>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card body-class="rounded py-0">
              <template v-slot:body>
                <div class="iq-card-body p-0 rounded" :style="`background: url(${require('../../assets/images/page-img/44.jpg')}) no-repeat scroll center center; background-size: contain; min-height: 127px;`"></div>
              </template>
            </iq-card>
          </b-col>
        </b-row>
      </b-col>
      <b-col sm="12">
        <iq-card className="iq-card-block iq-card-stretch">
          <template v-slot:body>
            <MapAmChart element="map-chart" style="height: 400px; position: relative"></MapAmChart>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="8">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Global Record</h4>
          </template>
          <template v-slot:body>
            <div class="table-responsive mb-5">
              <table class="table mb-3 table-borderless">
                <thead>
                  <tr>
                    <th scope="col">Country</th>
                    <th scope="col">Confirm</th>
                    <th scope="col">Recover</th>
                    <th scope="col">Death</th>
                  </tr>
                </thead>
                <tbody v-for="data in globalRecord" :key="data.id">
                  <tr>
                    <td v-for="data1 in data.country" :key="data1.id">
                      <img :src="data1.counreyImg" class="img-fluid" alt="country-flag" />
                      <span class="mx-2">{{ data1.countryName }}</span>
                    </td>
                    <td>{{ data.confirm }}</td>
                    <td>{{ data.recover }}</td>
                    <td>{{ data.death }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="4">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">How Avoid Virus infection</h4>
          </template>
          <template v-slot:body>
            <ul class="list-unstyled mb-0">
              <li tag="li" class="mb-2 d-flex gap-3">
                <b-img :src="require('../../assets/images/page-img/45.png')" alt="#" class="me-3 avatar-80"></b-img>
                <div>
                  <h5 class="mt-0">Wash your hands frequently</h5>
                  <p>Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.</p>
                </div>
              </li>

              <li tag="li" class="mb-2 d-flex gap-3">
                <b-img :src="require('../../assets/images/page-img/46.png')" alt="#" class="me-3 avatar-80"></b-img>
                <div>
                  <h5 class="mt-0">Maintain social distancing</h5>
                  <p>Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.</p>
                </div>
              </li>
              <li tag="li" class="mb-2 d-flex gap-3">
                <b-img :src="require('../../assets/images/page-img/47.png')" alt="#" class="me-3 avatar-80"></b-img>
                <div>
                  <h5 class="mt-0">Avoid touching eyes, nose and mouth</h5>
                  <p>Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick.</p>
                </div>
              </li>
              <li tag="li" class="d-flex gap-3">
                <b-img :src="require('../../assets/images/page-img/48.png')" alt="#" class="me-3 avatar-80"></b-img>
                <div>
                  <h5 class="mt-0">Practice respiratory hygiene</h5>
                  <p>Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately</p>
                </div>
              </li>
            </ul>
          </template>
        </iq-card>
      </b-col>
      <b-col sm="12">
        <Swiper
          id="doster-list-slide"
          :loop="true"
          slides-per-view="5"
          class="mySwiper"
          :modules="modules"
          :navigation="{
            nextEl: '#staff-swiper-next',
            prevEl: '#staff-swiper-prev'
          }">
          <SwiperSlide class="docter-list-item-inner rounded text-center" v-for="data in helplineOption" :key="data.id">
            <iq-card class="iq-card-block iq-card-stretch iq-card-height">
              <div class="iq-card-body text-left">
                <img class="arrow-img w-auto mb-3" :src="data.countryImg" alt="iconflag" />
                <h5 class="contact-number">
                  <i aria-hidden="true" class="ion ion-android-call"></i>
                  {{ data.helpLineNo }}
                </h5>
                <p class="mb-0">Help line Iran</p>
              </div>
            </iq-card>
          </SwiperSlide>
        </Swiper>
        <div class="col-sm-12">
          <Swiper
            id="blog-slider"
            :loop="true"
            slides-per-view="3"
            space-between="32"
            :modules="modules"
            :navigation="{
              nextEl: '.swiper-button-next',
              prevEl: '.swiper-button-prev'
            }">
            <SwiperSlide v-for="swip in swipp" :key="swip">
              <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                <div class="image-block">
                  <img :src="swip.img" class="img-fluid w-100" alt="blog-img" />
                </div>
                <div class="iq-card-body">
                  <div class="blog-description">
                    <div class="blog-meta">
                      <a href="#">{{ swip.date }}</a>
                    </div>
                    <h4 class="mb-2">{{ swip.heading }}</h4>
                    <p class="text-ellipsis short-1">{{ swip.discription }}</p>
                    <a href="#">Read More <i class="ri-arrow-right-s-line"></i></a>
                  </div>
                </div>
              </div>
            </SwiperSlide>
            <div class="iqonic-navigation-custom navigation-center">
              <div class="iqonic-navigation">
                <div class="swiper-buttons swiper-button-prev">
                  <i class="ri-arrow-left-s-line"></i>
                </div>
                <div class="swiper-buttons swiper-button-next">
                  <i class="ri-arrow-right-s-line"></i>
                </div>
              </div>
            </div>
          </Swiper>
        </div>
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
import iqCard from '../../components/xray/cards/iq-card.vue'
import MapAmChart from '../../components/xray/charts/MapAmChart.vue'
import { xray } from '../../config/pluginInit'
// Swiper
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Navigation } from 'swiper/modules'
import CountUp from 'vue-countup-v3'
import 'swiper/css'
import 'swiper/scss'
import 'swiper/css/navigation'
export default {
  name: 'CovidDashboard',
  components: { iqCard, Swiper, SwiperSlide, CountUp, MapAmChart },
  setup() {
    return {
      modules: [Navigation]
    }
  },
  mounted() {
    xray.index()
  },
  data() {
    const globalRecord = [
      {
        id: 1,
        country: [
          {
            counreyImg: require('../../assets/images/small/china.png'),
            countryName: 'China'
          }
        ],
        confirm: `80,967`,
        recover: 972,
        death: 3248
      },
      {
        id: 2,
        country: [
          {
            counreyImg: require('../../assets/images/small/france.png'),
            countryName: 'France'
          }
        ],
        confirm: `10,995`,
        recover: 245,
        death: 372
      },
      {
        id: 3,
        country: [
          {
            counreyImg: require('../../assets/images/small/germany.png'),
            countryName: 'Germany'
          }
        ],
        confirm: `15,320`,
        recover: 242,
        death: 40
      },
      {
        id: 4,
        country: [
          {
            counreyImg: require('../../assets/images/small/iran.png'),
            countryName: 'Iran'
          }
        ],
        confirm: `18,407`,
        recover: 520,
        death: 1284
      },
      {
        id: 5,
        country: [
          {
            counreyImg: require('../../assets/images/small/italy.png'),
            countryName: 'Italy'
          }
        ],
        confirm: `41,035`,
        recover: `10,600`,
        death: 3405
      },
      {
        id: 6,
        country: [
          {
            counreyImg: require('../../assets/images/small/netherlands.png'),
            countryName: 'Netherlands'
          }
        ],
        confirm: 2460,
        recover: 24,
        death: 76
      },
      {
        id: 7,
        country: [
          {
            counreyImg: require('../../assets/images/small/norway.png'),
            countryName: 'Norway'
          }
        ],
        confirm: 789,
        recover: 135,
        death: 35
      },

      {
        id: 8,
        country: [
          {
            counreyImg: require('../../assets/images/small/south-koria.png'),
            countryName: 'South Korea'
          }
        ],
        confirm: 1200,
        recover: 500,
        death: 600
      },
      {
        id: 9,
        country: [
          {
            counreyImg: require('../../assets/images/small/flag-900.png'),
            countryName: 'Spain'
          }
        ],
        confirm: `18,077`,
        recover: 150,
        death: 840
      },
      {
        id: 10,
        country: [
          {
            counreyImg: require('../../assets/images/small/flag-700.png'),
            countryName: 'Sweden'
          }
        ],
        confirm: 800,
        recover: 250,
        death: 120
      },
      {
        id: 11,
        country: [
          {
            counreyImg: require('../../assets/images/small/flag-800.png'),
            countryName: 'SwizerLand'
          }
        ],
        confirm: 4222,
        recover: 125,
        death: 43
      },
      {
        id: 12,
        country: [
          {
            counreyImg: require('../../assets/images/small/usa.png'),
            countryName: 'United States'
          }
        ],
        confirm: 14354,
        recover: 150,
        death: 277
      },
      {
        id: 13,
        country: [
          {
            counreyImg: require('../../assets/images/small/india.png'),
            countryName: 'India'
          }
        ],
        confirm: 197,
        recover: 50,
        death: 4
      }
    ]
    const helplineOption = [
      {
        id: 1,
        countryImg: require('../../assets/images/small/flag-100.png'),
        helpLineNo: '+ 1 800 324 2323'
      },
      {
        id: 2,
        countryImg: require('../../assets/images/small/flag-200.png'),
        helpLineNo: '+ 1 800 324 2323'
      },
      {
        id: 3,
        countryImg: require('../../assets/images/small/flag-300.png'),
        helpLineNo: '+ 1 800 324 2323'
      },
      {
        id: 4,
        countryImg: require('../../assets/images/small/flag-400.png'),
        helpLineNo: '+ 1 800 324 2323'
      },
      {
        id: 5,
        countryImg: require('../../assets/images/small/flag-500.png'),
        helpLineNo: '+ 1 800 324 2323'
      },
      {
        id: 6,
        countryImg: require('../../assets/images/small/flag-600.png'),
        helpLineNo: '+ 1 800 324 2323'
      },
      {
        id: 7,
        countryImg: require('../../assets/images/small/flag-01.png'),
        helpLineNo: '+ 1 800 324 2323'
      }
    ]
    const swipp = [
      {
        img: require('../../assets/images/page-img/40.png'),
        date: 'March 21, 2020',
        heading: 'Containing coronavirus spread comes',
        discription: `In the blogpost, the IMF experts observed, "Success in containing the virus comes at the price of slowing economic activity, no matter whether social distancing and reduced mobility are voluntary or enforced.`
      },
      {
        img: require('../../assets/images/page-img/41.png'),
        date: 'March 21, 2020',
        heading: 'Latest coronavirus updates',
        discription: `ABC Action News is committed to providing Tampa Bay area residents all of the updates on the coronavirus, COVID-19, and the impact it's having on our way of life. To help you stay on top of it all, we'll be updating this daily blog as we continue to get through this together.`
      },
      {
        img: require('../../assets/images/page-img/42.png'),
        date: 'March 21, 2020',
        heading: 'False Hope about Coronavirus',
        discription: `While patients can and do recover from coronavirus infections, there are currently no approved treatments that are known to work against COVID-19. He said at his press briefing yesterday, that two drugs, hydroxychloroquine and remdesivir`
      },
      {
        img: require('../../assets/images/page-img/41.png'),
        date: 'March 21, 2020',
        heading: 'Coronavirus in Maine Blog',
        discription: `This now includes cases formerly identified as presumptive positive. This classification applies to samples sent by a health provider directly to HETL that test positive and to samples from non-governmental labs for which HETL validates positive results.`
      }
    ]
    return { globalRecord, helplineOption, swipp }
  }
}
</script>
