<template>
  <div>
    <div class="columns is-mobile is-centered">
      <div class="column is-8">
        <div class="container">
          <strong class="is-size-2 has-text-weight-medium">{{ post.title }}</strong>
          <br />
          <small>by: {{ post.user.name }}</small>
          <small>
            <b-tag rounded>
              <b-icon icon="clock" size="is-small"></b-icon>
              {{ post.created_at }}
            </b-tag>
            <b-tag rounded>
              <b-icon icon="eye" size="is-small"></b-icon>
              {{ post.view }}
            </b-tag>
          </small>
          <b-field grouped group-multiline>
            <div class="control" v-for="(tag, index) in post.tags" :key="index">
              <b-tag class="is-warning" rounded>{{ tag.name }}</b-tag>
            </div>
          </b-field>
          <div class="content" v-html="post.body"></div>

          <!-- Comment -->
          <article class="media" v-for="(comment, index) in post.comments" :key="index">
            <figure class="media-left">
              <p class="image is-64x64">
                <img src="https://bulma.io/images/placeholders/128x128.png" />
              </p>
            </figure>
            <div class="media-content">
              <div class="content">
                <p>
                  <strong>{{ comment.user.name }}</strong>
                  <small>@{{ comment.user.name }}</small>
                  <small>{{ comment.created_at }}</small>
                  <br />
                  {{ comment.body }}
                </p>
              </div>
              <nav class="level is-mobile">
                <div class="level-left">
                  <a class="level-item">
                    <span class="icon is-small">
                      <i class="mdi mdi-reply"></i>
                    </span>
                  </a>
                  <a class="level-item">
                    <span class="icon is-small">
                      <i class="mdi mdi-twitter-retweet"></i>
                    </span>
                  </a>
                  <a class="level-item">
                    <span class="icon is-small">
                      <i class="mdi mdi-heart-outline"></i>
                    </span>
                  </a>
                </div>
              </nav>
            </div>
            <div class="media-right">
              <button class="delete" @click="deleteComment(comment.id)"></button>
            </div>
          </article>

          <article class="media">
            <figure class="media-left">
              <p class="image is-64x64">
                <img src="https://bulma.io/images/placeholders/128x128.png" />
              </p>
            </figure>
            <div class="media-content">
              <div class="field">
                <p class="control">
                  <textarea class="textarea" v-model="body" placeholder="Add a comment..."></textarea>
                </p>
              </div>
              <div class="field">
                <p class="control">
                  <button class="button" @click="addComment">Post comment</button>
                </p>
              </div>
            </div>
          </article>
        </div>
      </div>
    </div>
    {{ payload }}
  </div>
</template>

<script>
import ModalLogin from "~/components/ModalLogin";
export default {
  components: {
    ModalLogin
  },
  data() {
    return {
      body: ""
    };
  },

async asyncData({ $axios, params, error, payload }) {
    if (payload) return { post: payload };
    else {
      return await $axios.get(`posts/${params.id}`).then(response => {
        return {
          post: response.data.post
        };
      });
    }
  },

  methods: {
    async addComment() {
      await this.$axios
        .post(`posts/comments/${this.post.id}`, { body: this.body })
        .then(response => {
          this.body = "";
        })
        .catch(error => {
          if (error.response.status == 401) {
            this.$buefy.modal.open({
              parent: this,
              component: ModalLogin,
              hasModalCard: true,
              customClass: "custom-class custom-class-2"
            });
          } else if (error.response.status == 422) {
            alert(error.response.data.message);
          }
          console.log(error.response);
        });
    },

    async deleteComment(id) {
      await this.$axios
        .delete(`posts/comments/${id}`)
        .then(response => {
          console.log(response.data);
        })
        .catch(error => {
          console.log(error.response);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
