<template>
  <b-container fluid>
    <b-row>
      <!--
       <b-col lg="6" v-for="(item, index) in charts" :key="index">
          <iq-card>
            <template v-slot:headerTitle>
              <h4>{{ item.title }}</h4>
            </template>
            <template v-slot:body>
              <HighChart :ref="item.type" :option="item.bodyData" />
            </template>
          </iq-card>
        </b-col>
     -->
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Basic Line Chart</h4>
          </template>
          <template v-slot:body>
            <v-chart class="chart" :option="LineChartOption" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Area Chart</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="AreaChartOption" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Bar Chart</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="BarChart" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Doughnut Chart</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="DoughnutChartOption" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Pie Chart</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="PieChartOption" />
            <!-- <CanvasJSChart :options="options" :style="styleOptions" @chart-ref="chartInstance"/> -->
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Radar Chart</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="RadarChartOption" />
            <!-- <CanvasJSChart :options="options" :style="styleOptions" @chart-ref="chartInstance"/> -->
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Bubble Chart</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="scatter" /> -->
            <v-chart class="chart" :option="BubbleChartOption" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Scatter Chart</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="scatter" /> -->
            <v-chart class="chart" :option="ScatterChartOption" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6"> </b-col>
    </b-row>
  </b-container>
</template>
<script>
import iqCard from '../../components/xray/cards/iq-card'
import { xray } from '../../config/pluginInit'
// import HighCharts from "highcharts";
// import More from "highcharts/highcharts-more";
// More(HighCharts);

// Echart
import { use } from 'echarts/core'
import { CanvasRenderer } from 'echarts/renderers'
import { PieChart } from 'echarts/charts'
import { TitleComponent, TooltipComponent, LegendComponent } from 'echarts/components'
import VChart from 'vue-echarts'
import { ref } from 'vue'
// import ECharts from 'vue-echarts'
import * as echarts from 'echarts'

export default {
  name: 'HighCharts',
  components: { iqCard, VChart },
  mounted() {
    xray.index()
  },
  setup() {
    use([CanvasRenderer, PieChart, TitleComponent, TooltipComponent, LegendComponent])

    // const LineChartOption = ref({
    //   xAxis: {
    //     type: "category",
    //     boundaryGap: false,
    //     data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
    //   },
    //   yAxis: {
    //     type: "value",
    //   },
    //   series: [{
    //         data: [150, 230, 224, 218, 135, 147, 260],
    //         type: 'line',
    //         itemStyle: {
    //             color: 'rgba(8, 155, 171, 1)'
    //         }
    //     }],
    // });

    const LineChartOption = ref({
      xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: [150, 230, 224, 218, 135, 147, 260],
          type: 'line',
          itemStyle: {
            color: 'rgba(8, 155, 171, 1)'
          }
        }
      ]
    })
    const ColumnBarChartOption = ref({
      // title: {
      //   text: 'World Population',
      //   left: 'center'
      // },
      color: ['#81C2FF', '#FFBF00'],
      title: {
        text: 'US and USSR nuclear stockpiles',
        subtext: 'Sources: thebulletin.org',
        left: 'center'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'cross',
          label: {
            backgroundColor: '#6a7985'
          }
        }
      },
      toolbox: {
        feature: {
          saveAsImage: {}
        }
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis: [
        {
          type: 'category',
          boundaryGap: false,
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        }
      ],
      yAxis: [
        {
          type: 'value'
        }
      ],
      series: [
        {
          name: 'Line 4',
          type: 'line',
          stack: 'Total',
          smooth: true,
          lineStyle: {
            width: 0
          },
          showSymbol: false,
          areaStyle: {
            opacity: 0.8,
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              {
                offset: 0,
                color: '#81C2FF'
              },
              {
                offset: 1,
                color: '#81C2FF'
              }
            ])
          },
          emphasis: {
            focus: 'series'
          },
          data: [220, 402, 231, 134, 190, 230, 120]
        },
        {
          name: 'Line 5',
          type: 'line',
          stack: 'Total',
          smooth: true,
          lineStyle: {
            width: 0
          },
          showSymbol: false,
          label: {
            show: true,
            position: 'top'
          },
          areaStyle: {
            opacity: 0.8,
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              {
                offset: 0,
                color: '#63D584'
              },
              {
                offset: 1,
                color: '#63D584'
              }
            ])
          },
          emphasis: {
            focus: 'series'
          },
          data: [220, 302, 181, 234, 210, 290, 150]
        }
      ]
    })

    const PieChartOption = ref({
      tooltip: {
        trigger: 'item'
      },
      legend: {
        orient: 'vertical',
        left: 'left'
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: '50%',
          data: [
            { value: 1048, name: 'January' },
            { value: 735, name: 'February' },
            { value: 580, name: 'March' },
            { value: 484, name: 'April' },
            { value: 300, name: 'May' }
          ],
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }
      ]
    })
    const GaugeChartOption = ref({
      title: {
        text: 'Speedometer',
        left: 'center'
      },
      series: [
        {
          type: 'gauge',
          axisLine: {
            lineStyle: {
              width: 20,
              color: [
                [0.3, '#67e0e3'],
                [0.7, '#37a2da'],
                [1, '#fd666d']
              ]
            }
          },
          pointer: {
            itemStyle: {
              color: 'auto'
            }
          },
          axisTick: {
            distance: -10,
            length: 10,
            lineStyle: {
              color: '#fff',
              width: 2
            }
          },
          splitLine: {
            distance: -50,
            length: 50,
            lineStyle: {
              color: '#fff',
              width: 4
            }
          },
          axisLabel: {
            color: 'inherit',
            distance: 30,
            fontSize: 15
          },
          detail: {
            valueAnimation: true,
            formatter: '{value} km/h',
            fontSize: 20,
            color: 'inherit'
          },
          data: [
            {
              value: 70
            }
          ]
        }
      ]
    })
    const AreaChartOption = ref({
      color: ['#80FFA5', '#00DDFF', '#37A2FF', '#FF0087', '#FFBF00'],

      xAxis: [
        {
          type: 'category',
          boundaryGap: false,
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        }
      ],
      yAxis: [
        {
          type: 'value'
        }
      ],
      series: [
        {
          data: [820, 932, 901, 934, 1290, 1330, 1320],
          type: 'line',
          areaStyle: {},
          itemStyle: {
            color: 'rgba(8, 155, 171, 1)'
          }
        }
      ]
    })
    const ScatterChartOption = ref({
      xAxis: {},
      yAxis: {},
      series: [
        {
          symbolSize: 20,
          data: [
            [10.0, 8.04],
            [8.07, 6.95],
            [13.0, 7.58],
            [9.05, 8.81],
            [11.0, 8.33],
            [14.0, 7.66],
            [13.4, 6.81],
            [10.0, 6.33],
            [14.0, 8.96],
            [12.5, 6.82],
            [9.15, 7.2],
            [11.5, 7.2],
            [3.03, 4.23],
            [12.2, 7.83],
            [2.02, 4.47],
            [1.05, 3.33],
            [4.05, 4.96],
            [6.03, 7.24],
            [12.0, 6.26],
            [12.0, 8.84],
            [7.08, 5.82],
            [5.02, 5.68]
          ],
          type: 'scatter',
          itemStyle: {
            color: 'rgba(8, 155, 171, 1)'
          }
        }
      ]
    })
    const DualAxesLineColumnOption = ref({
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'cross',
          crossStyle: {
            color: '#999'
          }
        }
      },
      toolbox: {
        feature: {
          dataView: { show: true, readOnly: false },
          magicType: { show: true, type: ['line', 'bar'] },
          restore: { show: true },
          saveAsImage: { show: true }
        }
      },
      legend: {
        data: ['Evaporation', 'Precipitation', 'Temperature']
      },
      xAxis: [
        {
          type: 'category',
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
          axisPointer: {
            type: 'shadow'
          }
        }
      ],
      yAxis: [
        {
          type: 'value',
          name: 'Precipitation',
          min: 0,
          max: 250,
          interval: 50,
          axisLabel: {
            formatter: '{value} ml'
          }
        },
        {
          type: 'value',
          name: 'Temperature',
          min: 0,
          max: 25,
          interval: 5,
          axisLabel: {
            formatter: '{value} °C'
          }
        }
      ],
      series: [
        {
          name: 'Evaporation',
          type: 'bar',
          tooltip: {
            valueFormatter: function (value) {
              return value + ' ml'
            }
          },
          data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
        },
        {
          name: 'Precipitation',
          type: 'bar',
          tooltip: {
            valueFormatter: function (value) {
              return value + ' ml'
            }
          },
          data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
        },
        {
          name: 'Temperature',
          type: 'line',
          yAxisIndex: 1,
          tooltip: {
            valueFormatter: function (value) {
              return value + ' °C'
            }
          },
          data: [2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
        }
      ]
    })
    const BarChart = ref({
      xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: [120, 200, 150, 80, 70, 110, 130],
          type: 'bar',
          itemStyle: {
            color: 'rgba(8, 155, 171, 1)'
          }
        }
      ]
    })
    const DoughnutChartOption = ref({
      tooltip: {
        trigger: 'item'
      },
      legend: {
        top: '5%',
        left: 'center'
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          label: {
            show: false,
            position: 'center'
          },
          emphasis: {
            label: {
              show: true,
              fontSize: 40,
              fontWeight: 'bold'
            }
          },
          labelLine: {
            show: false
          },
          data: [
            { value: 1048, name: 'January' },
            { value: 735, name: 'February' },
            { value: 580, name: 'March' },
            { value: 484, name: 'April' },
            { value: 300, name: 'May' }
          ]
        }
      ]
    })
    const RadarChartOption = ref({
      tooltip: {
        trigger: 'item'
      },
      legend: {
        data: ['Day 1', 'Day 2']
      },
      radar: {
        indicator: [
          { name: 'Eating', max: 6500 },
          { name: 'Exercising', max: 16000 },
          { name: 'Running', max: 30000 },
          { name: 'Cycling', max: 38000 },
          { name: 'Sleeping', max: 52000 },
          { name: 'Drinking', max: 25000 }
        ]
      },
      series: [
        {
          name: 'Budget vs spending',
          type: 'radar',
          data: [
            {
              value: [4200, 3000, 20000, 35000, 50000, 18000],
              name: 'Day 1'
            },
            {
              value: [5000, 14000, 28000, 26000, 42000, 21000],
              name: 'Day 2'
            }
          ]
        }
      ]
    })
    const echartBubbleData = [
      [
        [5, 30, 27662440, 'Product 1'],
        [10, 50, 27662441, 'Product 1'],
        [20, 60, 27662442, 'Product 1'],
        [30, 50, 27662443, 'Product 1'],
        [40, 77.4, 27662444, 'Product 1']
      ],
      [
        [10, 60, 276624470, 'Product 2'],
        [20, 45, 276624471, 'Product 2'],
        [30, 60, 276624472, 'Product 2'],
        [40, 40, 276624473, 'Product 2'],
        [50, 50, 276624474, 'Product 2']
      ],
      [
        [5, 40, 276624450, 'Product 3'],
        [20, 70, 276624451, 'Product 3'],
        [30, 40, 276624452, 'Product 3'],
        [40, 55, 276624453, 'Product 3'],
        [50, 65, 276624454, 'Product 3']
      ]
    ]
    const BubbleChartOption = ref({
      tooltip: {
        trigger: 'item'
      },
      legend: {
        left: '25%',
        bottom: '3%',
        data: ['Product 1', 'Product 2', 'Product 3']
      },
      grid: {
        left: '8%',
        top: '10%'
      },
      xAxis: {
        splitLine: {
          lineStyle: {
            type: 'dashed'
          }
        }
      },
      yAxis: {
        splitLine: {
          lineStyle: {
            type: 'dashed'
          }
        },
        scale: true
      },
      series: [
        {
          name: 'Product 1',
          data: echartBubbleData[0],
          type: 'scatter',
          symbolSize: function (data) {
            return Math.sqrt(data[2]) / 5e2
          },
          emphasis: {
            focus: 'series',
            label: {
              show: true,
              formatter: function (param) {
                return param.data[3]
              },
              position: 'top'
            }
          },
          itemStyle: {
            color: 'rgba(8, 155, 171, 1)'
          }
        },
        {
          name: 'Product 2',
          data: echartBubbleData[1],
          type: 'scatter',
          symbolSize: function (data) {
            return Math.sqrt(data[2]) / 5e2
          },
          emphasis: {
            focus: 'series',
            label: {
              show: true,
              formatter: function (param) {
                return param.data[3]
              },
              position: 'top'
            }
          },
          itemStyle: {
            color: 'rgba(97, 226, 252, 1)'
          }
        },
        {
          name: 'Product 3',
          data: echartBubbleData[2],
          type: 'scatter',
          symbolSize: function (data) {
            return Math.sqrt(data[2]) / 5e2
          },
          emphasis: {
            focus: 'series',
            label: {
              show: true,
              formatter: function (param) {
                return param.data[3]
              },
              position: 'top'
            }
          },
          itemStyle: {
            color: 'rgba(242, 99, 97, 1)'
          }
        }
      ]
    })

    return {
      LineChartOption,
      ColumnBarChartOption,
      PieChartOption,
      GaugeChartOption,
      AreaChartOption,
      ScatterChartOption,
      DualAxesLineColumnOption,
      DoughnutChartOption,
      BarChart,
      RadarChartOption,
      BubbleChartOption
    }
  },
  data() {
    return {
      chart: null,
      xVal: 0,
      options: {
        exportEnabled: true,
        title: {
          text: 'live random data'
        },
        data: [
          {
            type: 'line',
            dataPoints: []
          }
        ]
      },
      styleOptions: {
        width: '100%',
        height: '345px',
        fontSize: '18px'
      }
    }
  },
  methods: {
    updateChart(count) {
      count = count || 1
      var yVal = 100
      for (var j = 0; j < count; j++) {
        yVal = yVal + Math.round(5 + Math.random() * (-5 - 5))
        this?.options.data[0].dataPoints.push({
          x: this.xVal++,
          y: yVal
        })
      }
      if (!!this.options.data[0].dataPoints.length > 10) {
        this.options.data[0].dataPoints.shift()
      }
      this.chart.render()
      setTimeout(this.updateChart, 1000)
    },
    chartInstance(chart) {
      this.chart = chart
      this.updateChart(100)
    }
  }
}
</script>
<style scoped>
.chart {
  height: 342px;
  width: 785px;
}
</style>
