const { defineConfig } = require('@vue/cli-service');
const webpack = require('webpack'); // No es necesario importar webpack aquí si no lo estás utilizando directamente

module.exports = defineConfig({
  publicPath: process.env.NODE_ENV === 'production' ? process.env.VUE_APP_BASE_URL : '/',

  configureWebpack: {
    plugins: [
      new webpack.ProvidePlugin({
        mapboxgl: 'mapbox-gl'
      })
    ]
  },

  devServer: {
    hot: true, // Habilita el Hot Module Replacement (HMR)
  },

  pluginOptions: {
    i18n: {
      locale: 'en',
      fallbackLocale: 'en',
      localeDir: 'locales',
      enableInSFC: false
    }
  },
  transpileDependencies: true
});
