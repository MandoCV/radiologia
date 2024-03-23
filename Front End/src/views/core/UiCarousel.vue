<template>
  <b-container fluid>
    <b-row>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Slides only</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-1 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>
              Here’s a carousel with slides only. Note the presence of the
              <code>.d-block</code> and <code>.img-fluid</code> on carousel images to prevent browser default image alignment.
            </p>
            <b-collapse id="collapse-1" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="slides-only">
                    <code>
&lt;b-carousel
  id="carouselExampleSlidesOnly"
&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
&lt;/b-carousel&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <!-- <b-carousel id="carouselExampleSlidesOnly">
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
            </b-carousel> -->
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
              </div>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Slides With Controls</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-2 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>
              Here’s a carousel with slides only. Note the presence of the
              <code>.d-block</code> and <code>.img-fluid</code> on carousel images to prevent browser default image alignment.
            </p>
            <b-collapse id="collapse-2" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="slides-controls">
                    <code>
&lt;b-carousel
  id="carouselExampleControls"
  controls
&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
&lt;/b-carousel&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" data-bs-interval="1000">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Slides With Indicators</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-3 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>
              Here’s a carousel with slides only. Note the presence of the
              <code>.d-block</code> and <code>.img-fluid</code> on carousel images to prevent browser default image alignment.
            </p>
            <b-collapse id="collapse-3" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="slides-indicators">
                    <code>
&lt;b-carousel
  id="carouselExampleIndicators"
  controls
  indicators
&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
&lt;/b-carousel&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <!-- <b-carousel id="carouselExampleIndicators" controls indicators>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
            </b-carousel> -->
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>

              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Slides With Captions</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-4 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>
              Here’s a carousel with slides only. Note the presence of the
              <code>.d-block</code> and <code>.img-fluid</code> on carousel images to prevent browser default image alignment.
            </p>
            <b-collapse id="collapse-4" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="slides-captions">
                    <code>
&lt;b-carousel
  id="carouselExampleCaptions"
  controls
  indicators
&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
&lt;/b-carousel&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <!-- <b-carousel id="carouselExampleCaptions" controls indicators>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              >
                <h4 class="text-white">First slide label</h4>
                <p>
                  Nulla vitae elit libero, a pharetra augue mollis interdum.
                </p>
              </b-carousel-slide>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              >
                <h4 class="text-white">Second slide label</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
              </b-carousel-slide>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              >
                <h4 class="text-white">Third slide label</h4>
                <p>
                  Praesent commodo cursus magna, vel scelerisque nisl
                  consectetur.
                </p>
              </b-carousel-slide>
            </b-carousel> -->
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="1000">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                  <div class="carousel-caption d-none d-md-block">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                  </div>
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Second slide label</h5>
                    <p>Some representative placeholder content for the second slide.</p>
                  </div>
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Third slide label</h5>
                    <p>Some representative placeholder content for the third slide.</p>
                  </div>
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Slides With Crossfade</h4>
          </template>
          <template v-slot:headerAction>
            <a class="text-primary float-right" v-b-toggle.collapse-5 role="button">
              <i class="ri-code-s-slash-line" />
            </a>
          </template>
          <template v-slot:body>
            <p>
              Here’s a carousel with slides only. Note the presence of the
              <code>.d-block</code> and <code>.img-fluid</code> on carousel images to prevent browser default image alignment.
            </p>
            <b-collapse id="collapse-5" class="mb-2">
              <div class="card">
                <kbd class="bg-dark">
                  <pre class="text-white" id="slides-fade">
                    <code>
&lt;b-carousel
  id="carouselExampleFade"
  fade
  controls
&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
  &lt;b-carousel-slide :img-src="require('../../assets/images/small/img-1.jpg')"&gt;&lt;/b-carousel-slide&gt;
&lt;/b-carousel&gt;
</code></pre>
                </kbd>
              </div>
            </b-collapse>
            <!-- <b-carousel id="carouselExampleFade" fade controls>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
              <b-carousel-slide
                :img-src="require('../../assets/images/small/img-1.jpg')"
              ></b-carousel-slide>
            </b-carousel> -->
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="1000">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                  <img src="../../assets/images/small/img-1.jpg" class="d-block w-100" alt="..." />
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
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
  name: 'UiCarousel',
  components: { iqCard },
  mounted() {
    xray.index()
  }
}
</script>
