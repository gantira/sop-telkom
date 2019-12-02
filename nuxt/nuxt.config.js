const axios = require('axios')

export default {
  mode: 'universal',
  /*
   ** Headers of the page
   */
  head: {
    title: process.env.npm_package_name || '',
    meta: [{
        charset: 'utf-8'
      },
      {
        name: 'viewport',
        content: 'width=device-width, initial-scale=1'
      },
      {
        hid: 'description',
        name: 'description',
        content: process.env.npm_package_description || ''
      }
    ],
    link: [{
      rel: 'icon',
      type: 'image/x-icon',
      href: '/favicon.ico'
    }]
  },
  /*
   ** Customize the progress-bar color
   */
  loading: {
    color: '#fff'
  },
  /*
   ** Global CSS
   */
  css: [
    '@/node_modules/bulma-helpers/css/bulma-helpers.css'
  ],
  /*
   ** Plugins to load before mounting the App
   */
  plugins: [{
      src: '~plugins/vue2editor',
      ssr: false
    },
    '~/plugins/mixins/authUser.js',
  ],
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: [],
  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://buefy.github.io/#/documentation
    '@nuxtjs/axios',
    '@nuxtjs/auth',
    'nuxt-buefy',
  ],
  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    extend(config, ctx) {}
  },

  router: {
    linkExactActiveClass: 'is-active',
    base: '/sop/'
  },

  axios: {
    baseURL: 'http://10.2.16.250/newdiglife/public/api'
  },

  auth: {
    strategies: {
      'laravel.passport': {
        url: 'http://localhost',
        client_id: 3,
        client_secret: 'VDCrZAFNQMEo6wMji3SSZQDdAr0j4Q0lFr5hIrCl'
      },
      local: {
        endpoints: {
          login: {
            url: '/auth/login',
            method: 'post',
            propertyName: 'access_token'
          },
          logout: {
            url: '/auth/logout',
            method: 'post'
          },
          user: {
            url: '/auth/user',
            method: 'get',
            propertyName: false
          }
        },
      }
    }
  },

  generate: {
    fallback: true,
    exclude: [
      /^(?=.*\bignore\b).*$/,
    ],
    routes: function () {
      return axios.get('http://10.2.16.250/newdiglife/public/api/home')
        .then((res) => {
          return res.data.posts.map((post) => {
            return {
              route: `/posts/${post.slug}`,
              payload: post
            }
          })
        })
    }
  }
}
