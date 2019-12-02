import Vue from 'vue'
import {mapGetters} from 'vuex'

const authUser = {
  install(Vue, options) {
    Vue.mixin({
      computed: {
        ...mapGetters( {
          isAuthenticated: 'auth/isAuthenticated',
          loggedInUser: 'auth/loggedInUser',
        })
      },
    })
  }
}


Vue.use(authUser)
