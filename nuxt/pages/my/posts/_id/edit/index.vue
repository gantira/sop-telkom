<template>
  <div>
    <section class="section">
      <h2 class="title is-3 has-text-grey">
        "Edit Post
        <b-icon icon="rocket" size="is-large" />"
      </h2>
      <h3 class="subtitle is-6 has-text-grey">
        Author:
        <a href="https://github.com/anteriovieira">{{ loggedInUser.name }}</a>
      </h3>
    </section>

    <section>
      <form @submit.prevent="update">
        <b-field grouped>
          <b-field label>
            <b-dropdown v-model="form.publish_id" aria-role="list">
              <button class="button is-primary" type="button" slot="trigger" v-if="form.publish_id">
                <div v-for="publish in publishes" :key="publish.id">
                  <template v-if="form.publish_id == publish.id">
                    <b-icon icon="earth"></b-icon>
                    <span>{{ publish.type }}</span>
                    <b-icon icon="menu-down"></b-icon>
                  </template>
                </div>
              </button>

              <button class="button is-light" type="button" slot="trigger" v-else>
                <b-icon icon="earth"></b-icon>
                <span>Type</span>
                <b-icon icon="menu-down"></b-icon>
              </button>

              <b-dropdown-item
                v-for="(publish, index) in publishes"
                :key="index"
                :value="publish.id"
                aria-role="listitem"
              >
                <div class="media">
                  <b-icon class="media-left" icon="earth"></b-icon>
                  <div class="media-content">
                    <h3>{{ publish.type }}</h3>
                    <small>{{ publish.description }}</small>
                  </div>
                </div>
              </b-dropdown-item>
            </b-dropdown>
          </b-field>
          <b-field label expanded>
            <b-input v-model="form.title" placeholder="Post Title"></b-input>
          </b-field>
        </b-field>
        <b-field label>
          <b-taginput
            v-model="form.tags"
            ref="autocomplete"
            :data="filteredTags"
            value="id"
            autocomplete
            :allow-new="allowNew"
            field="name"
            icon="label"
            placeholder="Add a tag"
            @typing="getFilteredTags"
          >
            <template slot="footer">
              <a @click="showAddFruit">
                <span>Add new...</span>
              </a>
            </template>
          </b-taginput>
        </b-field>

        <b-field label>
          <vue-editor
            useCustomImageHandler
            @image-added="handleImageAdded"
            @image-removed="handleImageRemoved"
            v-model="form.body"
          ></vue-editor>
        </b-field>

        <b-button native-type="submit" type="is-primary">Update a post</b-button>
      </form>
    </section>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      form: {
        title: "",
        publish_id: "",
        body: "",
        slug: "",
        tags: []
      },
      filteredTags: [],
      isSelectOnly: false,
      allowNew: false,
      selected: null
    };
  },

  async asyncData({ $axios, params }) {
    return await $axios.get(`admin/posts/${params.id}`).then(response => {
      return {
        form: {
          title: response.data.post.title,
          publish_id: response.data.post.publish.id,
          body: response.data.post.body,
          tags: response.data.post.tags
        }
      };
    });
  },

  mounted() {
    this.$store.dispatch("admin/tags/get");
    this.$store.dispatch("admin/publishes/get");
  },

  computed: {
    ...mapGetters("admin/tags", ["tags"]),
    ...mapGetters("admin/publishes", ["publishes"])
  },

  methods: {
    update() {
      this.$axios
        .patch(`posts/${this.$route.params.id}`, this.form)
        .then(response => {
          this.$router.push({ name: "my-posts" });

          this.$buefy.notification.open({
            duration: 5000,
            message: `Berhasil update "${this.form.title}".`,
            position: "is-bottom-right",
            type: "is-success",
            hasIcon: true
          });
        }, 1000);
    },
    getFilteredTags(text) {
      this.filteredTags = this.tags.filter(option => {
        return (
          option
            .toString()
            .toLowerCase()
            .indexOf(text.toLowerCase()) >= 0
        );
      });
    },
    showAddFruit() {
      this.$buefy.dialog.prompt({
        message: `Tag`,
        inputAttrs: {
          placeholder: "e.g. Email, Sppd, KBM, etc",
          maxlength: 20,
          value: this.name,
          focusOn: "confirm"
        },
        confirmText: "Add",
        onConfirm: value => {
          this.$store.dispatch("admin/tags/add", { name: value });

          setTimeout(() => {
            this.$store.dispatch("admin/tags/get");
            this.$buefy.notification.open({
              duration: 5000,
              message: `Tag ${value} sudah ditambahkan.`,
              position: "is-bottom-right",
              type: "is-success",
              hasIcon: true
            });
          }, 1000);
        }
      });
    },
    handleImageAdded(file, Editor, cursorLocation, resetUploader) {
      var formData = new FormData();
      formData.append("image", file);

      this.$axios
        .post("/images-add", formData)
        .then(result => {
          let url = result.data.url; // Get url from response
          Editor.insertEmbed(cursorLocation, "image", url);
          resetUploader();
        })
        .catch(err => {
          console.log(err);
        });
    },
    handleImageRemoved(file, Editor, cursorLocation, resetUploader) {
      this.$axios
        .post("/images-remove", {
          image: file
        })
        .then(response => {
          console.log(response);
          resetUploader();
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>
