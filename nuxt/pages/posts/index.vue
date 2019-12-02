<template>
  <div>
    <div class="columns is-mobile">
      <div class="column is-6 is-offset-2">
        <b-field custom-class="is-medium">
          <form @submit.prevent="find">
            <b-input
              @keydown.enter.prevent="find"
              extended
              size="is-medium"
              v-model="search"
              :loading="isLoading"
              placeholder="Search..."
              type="search"
              icon="search-web"
            ></b-input>
          </form>
        </b-field>
        <div class v-for="(post, index) in posts" :key="index">
          <div class="box has-margin-bottom-10 is-paddingless">
            <div class="has-padding-10">
              <div class="level">
                <div class="level-left">
                  <nuxt-link :to="{name: 'posts-id', params: { id: post.slug }}">
                    <strong class="is-size-6">{{ post.title }}</strong>
                  </nuxt-link>
                </div>
                <div class="level-right">
                    <b-tag class="is-light"><span v-if="post.publish.type == 'Team'">{{ post.user.unit.name }}</span> {{ post.publish.type }} </b-tag>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      search: ""
    };
  },

  watch: {
    search(val) {
      if (val == "") {
        this.$store.dispatch("home/get");
      }
    }
  },

  mounted() {
    this.$store.dispatch("home/get");
  },

  computed: {
    ...mapGetters("home", ["posts", "isLoading"])
  },

  methods: {
    find() {
      this.$store.dispatch("home/get", this.search);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
