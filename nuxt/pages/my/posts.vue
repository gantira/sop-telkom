<template>
  <div>
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

      <div class="column is-8" style="overflow: auto">
        <nuxt-child />
      </div>
    </section>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  middleware: "auth",
  data() {
    return {
      items: [
        {
          title: "Home",
          icon: "home",
          to: {
            name: "index"
          }
        },
        {
          title: "Posts",
          icon: "lightbulb",
          to: {
            name: "my-posts"
          }
        }
      ],
      defaultOpenedDetails: [1],
      showDetailIcon: true
    };
  },

  mounted() {
    this.$store.dispatch("posts/get");
  },

  computed: {
    ...mapGetters("posts", ["posts", "isLoading"])
  },

  methods: {
    async logout() {
      await this.$auth.logout();
    },
    toggle(row) {
      this.$refs.table.toggleDetails(row);
    }
  }
};
</script>


<style lang="scss" scoped>
</style>
