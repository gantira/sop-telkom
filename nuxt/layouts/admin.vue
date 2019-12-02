<template>
  <div>
    <b-navbar class="has-margin-bottom-20 has-shadow is-primary is-transparent navbar header">
      <template slot="brand">
        <b-navbar-item tag="router-link" :to="{ name: 'admin' }">
          <img src="~assets/buefy.png" alt="Buefy" height="28" />
        </b-navbar-item>
      </template>

      <template slot="end" v-if="isAuthenticated">
        <b-navbar-item tag="div">
          <div class="buttons">
            <button @click="logout" class="button has-text-weight-bold">Logout</button>
          </div>
        </b-navbar-item>
      </template>
    </b-navbar>

    <section class="main-content columns">
      <aside class="column is-2 section">
        <p class="menu-label is-hidden-touch">General</p>
        <ul class="menu-list">
          <li v-for="(item, key) of items" :key="key">
            <nuxt-link :to="item.to">
              <b-icon :icon="item.icon" />
              {{ item.title }}
            </nuxt-link>
          </li>
        </ul>
      </aside>

      <div class="container column is-10" style="overflow: auto">
        <nuxt />
      </div>
    </section>
  </div>
</template>

<script>
export default {
  middleware: ["auth", "admin"],
  layout: "admin",
  data() {
    return {
      items: [
        {
          title: "Home",
          icon: "home",
          to: {
            name: "admin"
          }
        },
        {
          title: "Posts",
          icon: "lightbulb",
          to: {
            name: "admin-posts"
          }
        },
        {
          title: "Tags",
          icon: "lightbulb",
          to: {
            name: "admin-tags"
          }
        },
        {
          title: "Publishes",
          icon: "lightbulb",
          to: {
            name: "admin-publishes"
          }
        },
        {
          title: "Units",
          icon: "lightbulb",
          to: {
            name: "admin-units"
          }
        },
        {
          title: "Roles",
          icon: "lightbulb",
          to: {
            name: "admin-roles"
          }
        },
        {
          title: "Users",
          icon: "lightbulb",
          to: {
            name: "admin-users"
          }
        }
      ]
    };
  },

  methods: {
    async logout() {
      await this.$auth.logout();
    }
  }
};
</script>
