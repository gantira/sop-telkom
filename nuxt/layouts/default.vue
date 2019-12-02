<template>
  <div>
    <b-navbar class="has-shadow">
      <template slot="brand">
        <b-navbar-item tag="router-link" :to="{ name: 'index' }">
          <img
            src="https://raw.githubusercontent.com/buefy/buefy/dev/static/img/buefy-logo.png"
            alt="Lightweight UI components for Vue.js based on Bulma"
          />
        </b-navbar-item>
      </template>
      <template slot="start">
        <nuxt-link class="navbar-item" :to="{name: 'posts'}">Posts</nuxt-link>
      </template>

      <template slot="end" v-if="!isAuthenticated">
        <b-navbar-item tag="div">
          <div class="buttons">
            <nuxt-link to="/signup" class="button is-primary">
              <strong>Sign up</strong>
            </nuxt-link>
            <nuxt-link to="/login" class="button is-light">
              <strong>Log in</strong>
            </nuxt-link>
          </div>
        </b-navbar-item>
      </template>
      <template slot="end" v-else>
        <b-navbar-item tag="div">
          <div class="buttons">
              <nuxt-link :to="{ name: 'my-posts' }" class="button is-info has-text-weight-bold">My Post</nuxt-link>
          </div>
        </b-navbar-item>
        <b-navbar-item tag="div">
          <div class="buttons">
            <button @click="logout" class="button is-primary has-text-weight-bold">Logout</button>
          </div>
        </b-navbar-item>
      </template>
    </b-navbar>

    <div class="has-margin-top-10 has-background-white-bis">
        <nuxt />
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  methods: {
    async logout() {
      await this.$auth.logout();
    }
  }
};
</script>
