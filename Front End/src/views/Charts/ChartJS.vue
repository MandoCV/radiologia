<template>
  <b-container fluid>
    <b-row>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Line chart</h4>
          </template>
          <template v-slot:body>
            <!-- <MorrisChart
              :element="item.type + index"
              :type="item.type"
              :xKeys="item.xKeys"
              :data="item.bodyData"
              :colors="item.colors"
              :yKeys="item.yKeys"
              :labels="item.labels"
            /> -->
            <LineChart :chartData="LineChartData" />
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Area chart</h4>
          </template>
          <template v-slot:body>
            <canvas id="areaChart" :chartData="AreaChartData" height="400" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Bar Chart</h4>
          </template>
          <template v-slot:body>
            <BarChart :chartData="BarChartData" />
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Doughnut chart</h4>
          </template>
          <template v-slot:body>
            <DoughnutChart :chartData="DoughnutChartData" />
          </template>
        </iq-card>
      </b-col>
      <!-- Bubble chart -->
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Bubble chart</h4>
          </template>
          <template v-slot:body>
            <BubbleChart :chartData="BubbleChartData" />
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Pie Charts</h4>
          </template>
          <template v-slot:body>
            <PieChart :chartData="PieChartData" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Scatter Charts</h4>
          </template>
          <template v-slot:body>
            <ScatterChart :chartData="ScatterChartData" />
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Raddar Charts</h4>
          </template>
          <template v-slot:body>
            <RadarChart :chartData="RadarChartData" />
          </template>
        </iq-card>
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
import { xray } from '../../config/pluginInit'
import iqCard from '../../components/xray/cards/iq-card'

// Chart
import { LineChart, BarChart, DoughnutChart, ScatterChart, BubbleChart, PieChart, RadarChart } from 'vue-chart-3'
import { Chart, registerables } from 'chart.js'
Chart.register(...registerables)
export default {
  name: 'ChartJs',
  components: { iqCard, LineChart, BarChart, DoughnutChart, ScatterChart, BubbleChart, PieChart, RadarChart },
  mounted() {
    xray.index()
    const ctx = document.getElementById('areaChart')
    new Chart(ctx, this.AreaChartData)
  },
  data() {
    // return {
    // charts: [
    //   {
    //     title: "Line Chart",
    //     type: "line",
    //     bodyData: [
    //       { year: "2013", a: 10, b: 5 },
    //       { year: "2014", a: 40, b: 15 },
    //       { year: "2015", a: 20, b: 25 },
    //       { year: "2016", a: 30, b: 20 },
    //     ],
    //     colors: ["#FF6384", "#36A2EB"],
    //     xKeys: "year",
    //     yKeys: ["a", "b"],
    //     labels: ["Serie A", "Serie B"],
    //   },
    //   {
    //     title: "Bar Chart",
    //     type: "bar",
    //     bodyData: [
    //       { year: 2013, and: 10, ios: 12, win: 2 },
    //       { year: 2014, and: 10, ios: 15, win: 2 },
    //       { year: 2015, and: 20, ios: 25, win: 2 },
    //       { year: 2016, and: 30, ios: 20, win: 2 },
    //     ],
    //     xKeys: "year",
    //     yKeys: ["and", "ios", "win"],
    //     labels: ["Android", "iOS", "Windows"],
    //     colors: ["#FF6384", "#36A2EB", "#FFCE56"],
    //   },
    //   {
    //     title: "Area Chart",
    //     type: "area",
    //     bodyData: [
    //       { year: "2013", a: 10, b: 5 },
    //       { year: "2014", a: 30, b: 20 },
    //       { year: "2015", a: 20, b: 25 },
    //       { year: "2016", a: 40, b: 15 },
    //     ],
    //     xKeys: "year",
    //     yKeys: ["a", "b"],
    //     labels: ["Serie A", "Serie B"],
    //     colors: ["#FF6384", "#36A2EB"],
    //   },
    //   {
    //     title: "Donut Chart",
    //     type: "donut",
    //     bodyData: [
    //       { label: "Download Sales", value: 12 },
    //       { label: "In-Store Sales", value: 30 },
    //       { label: "Mail-Order Sales", value: 20 },
    //     ],
    //     colors: ["#0483ff", "#e64141", "#00ca00"],
    //     yKeys: [],
    //     xKeys: "",
    //     labels: [],
    //   },
    // ],
    // };
    const LineChartData = {
      labels: ['August', 'September', 'October', 'November', 'December', 'January', 'February'],
      datasets: [
        {
          label: 'Line Chart',
          data: [65, 59, 80, 81, 55, 55],

          backgroundColor: 'rgba(8, 155, 171, 1)',
          borderColor: 'rgba(8, 155, 171, 1)',
          tension: 0.1,
          borderSkipped: false
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legends: {
            display: false
          }
        }
      }
    }

    const BarChartData = {
      labels: ['August', 'September', 'October', 'November', 'December', 'January', 'February'],
      datasets: [
        {
          label: 'Fully Rounded',
          data: [65, 59, 80, 81, 55, 55],

          backgroundColor: 'rgba(8, 155, 171, 1)',
          borderColor: 'rgba(8, 155, 171, 1)',
          tension: 0.1,
          borderSkipped: false
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legends: {
            display: false
          }
        }
      }
    }

    const AreaChartData = {
      type: 'line',
      data: {
        labels: ['January', 'February', 'March', 'April', 'May'],
        datasets: [
          {
            label: 'Area Chart',
            data: [10, 20, 15, 30, 25],
            fill: true,
            borderColor: 'rgba(8, 155, 171, 1)',
            backgroundColor: 'rgba(8, 155, 171, 0.2)',
            tension: 0.5,
            borderSkipped: false
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false
          }
        }
      }
    }

    const DoughnutChartData = {
      type: 'doughnut',
      labels: ['January', 'February', 'March', 'April', 'May'],
      datasets: [
        {
          label: 'Donut Chart',
          data: [10, 20, 15, 30, 25],
          backgroundColor: ['rgba(8, 155, 171, 1)', 'rgba(252, 159, 91, 1)', 'rgba(242, 99, 97, 1)', 'rgba(87, 222, 83, 1)', 'rgba(97, 226, 252, 1)'],
          hoverOffset: 4,
          borderSkipped: false
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top'
          },
          title: {
            display: true,
            text: 'Chart.js Doughnut Chart'
          }
        }
      }
    }

    const BubbleChartData = {
      labels: ['August', 'September', 'October', 'November', 'December', 'January', 'February'],
      datasets: [
        {
          label: 'Product One',
          data: [
            { x: 20, y: 29, r: 10 },
            { x: 21, y: 25, r: 10 },
            { x: 22, y: 24, r: 10 },
            { x: 24, y: 28, r: 10 },
            { x: 25, y: 21, r: 10 },
            { x: 26, y: 26, r: 10 },
            { x: 27, y: 25, r: 10 },
            { x: 28, y: 22, r: 10 },
            { x: 29, y: 23, r: 10 },
            { x: 30, y: 20, r: 10 }
          ],
          backgroundColor: 'rgba(242, 99, 97, 1)'
        },
        {
          label: 'Product Two',
          data: [
            { x: 20, y: 22, r: 10 },
            { x: 22, y: 26, r: 10 },
            { x: 23, y: 24, r: 10 },
            { x: 24, y: 22, r: 10 },
            { x: 25, y: 23, r: 10 },
            { x: 26, y: 24, r: 10 },
            { x: 27, y: 28, r: 10 },
            { x: 28, y: 20, r: 10 },
            { x: 29, y: 27, r: 10 },
            { x: 30, y: 29, r: 10 }
          ],
          backgroundColor: 'rgba(8, 155, 171, 1)'
        },
        {
          label: 'Product Three',
          data: [
            { x: 20, y: 26, r: 10 },
            { x: 22, y: 28, r: 10 },
            { x: 23, y: 22, r: 10 },
            { x: 24, y: 25, r: 10 },
            { x: 25, y: 25, r: 10 },
            { x: 26, y: 20, r: 10 },
            { x: 27, y: 30, r: 10 },
            { x: 28, y: 28, r: 10 },
            { x: 29, y: 25, r: 10 },
            { x: 30, y: 22, r: 10 }
          ],
          backgroundColor: 'rgba(97, 226, 252, 1)'
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legends: {
            display: false
          }
        }
      }
    }
    const PieChartData = {
      type: 'pie',
      labels: ['January', 'February', 'March', 'April', 'May'],
      datasets: [
        {
          label: 'Pie Chart',
          data: [10, 20, 15, 30, 25],
          backgroundColor: ['rgba(8, 155, 171, 1)', 'rgba(252, 159, 91, 1)', 'rgba(242, 99, 97, 1)', 'rgba(87, 222, 83, 1)', 'rgba(97, 226, 252, 1)'],
          hoverOffset: 4,
          borderSkipped: false
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top'
          },
          title: {
            display: true,
            text: 'Chart.js Doughnut Chart'
          }
        }
      }
    }

    const ScatterChartData = {
      labels: ['August', 'September', 'October', 'November', 'December', 'January', 'February'],
      datasets: [
        {
          label: 'Product 1',
          data: [
            { x: 10, y: 0.0 },
            { x: 12, y: 0.1 },
            { x: 13, y: 0.2 },
            { x: 14, y: 0.2 },
            { x: 15, y: 0.5 },
            { x: 16, y: 0.4 },
            { x: 17, y: 0.5 },
            { x: 18, y: 0.3 },
            { x: 19, y: 0.1 },
            { x: 20, y: 0.5 },
            { x: 21, y: 0.4 },
            { x: 22, y: 0.2 }
          ],
          backgroundColor: 'rgba(242, 99, 97, 1)'
        },
        {
          label: 'Product 2',
          data: [
            { x: 10, y: 0.5 },
            { x: 12, y: 0.4 },
            { x: 13, y: 0.3 },
            { x: 14, y: 0.2 },
            { x: 15, y: 0.1 },
            { x: 16, y: 0.2 },
            { x: 17, y: 0.1 },
            { x: 18, y: 0.2 },
            { x: 19, y: 0.3 },
            { x: 20, y: 0.4 },
            { x: 21, y: 0.5 },
            { x: 22, y: 0.0 }
          ],
          backgroundColor: 'rgba(8, 155, 171, 1)'
        },
        {
          label: 'Product 3',
          data: [
            { x: 10, y: 0.25 },
            { x: 12, y: 0.3 },
            { x: 13, y: 0.3 },
            { x: 14, y: 0.4 },
            { x: 15, y: 0.3 },
            { x: 16, y: 0.1 },
            { x: 17, y: 0.5 },
            { x: 18, y: 0.2 },
            { x: 19, y: 0.3 },
            { x: 20, y: 0.4 },
            { x: 21, y: 0.5 },
            { x: 22, y: 0.0 }
          ],
          backgroundColor: 'rgba(97, 226, 252, 1)'
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legends: {
            display: false
          }
        }
      }
    }
    const RadarChartData = {
      type: 'radar',
      labels: ['Eating', 'Drinking', 'Sleeping', 'Designing', 'Coding', 'Cycling', 'Running'],
      datasets: [
        {
          label: 'Day 1',
          data: [65, 59, 90, 81, 56, 55, 40],
          fill: true,
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgb(255, 99, 132)',
          pointBackgroundColor: 'rgb(255, 99, 132)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgb(255, 99, 132)'
        },
        {
          label: 'Day 2',
          data: [28, 48, 40, 19, 96, 27, 100],
          fill: true,
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgb(54, 162, 235)',
          pointBackgroundColor: 'rgb(54, 162, 235)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgb(54, 162, 235)'
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top'
          },
          title: {
            display: true,
            text: 'Chart.js Doughnut Chart'
          }
        }
      }
    }

    return { LineChartData, BarChartData, AreaChartData, DoughnutChartData, BubbleChartData, ScatterChartData, PieChartData, RadarChartData }
  }
}
</script>
<style scoped></style>
