<template>
  <div>
    <section class="section">
      <h2 class="title is-3 has-text-grey">
        "Edit Publish
        <b-icon icon="rocket" size="is-large" />"
      </h2>
      <h3 class="subtitle is-6 has-text-grey">
        Author:
        <a href="https://github.com/anteriovieira">{{ loggedInUser.name }}</a>
      </h3>
    </section>

    <section>
      <form @submit.prevent="update">
        <b-field label="Type">
          <b-input v-model="form.type" placeholder="Publish type"></b-input>
        </b-field>

        <b-field label="Description">
          <b-input v-model="form.description" placeholder="Publish description"></b-input>
        </b-field>

        <b-button native-type="submit" type="is-primary">Update a Publish</b-button>
      </form>
    </section>
  </div>
</template>

<script>
export default {
  layout: "admin",
  data() {
    return {
      form: {
        type: "",
        description: ""
      }
    };
  },

  async asyncData({ $axios, params }) {
    return await $axios.get(`admin/publishes/${params.id}`).then(response => {
      return {
        form: response.data.publish
      };
    });
  },

  methods: {
    update() {
      this.$axios
        .patch(`admin/publishes/${this.$route.params.id}`, this.form)
        .then(response => {
          this.$router.push({ name: "admin-publishes" });

          this.$buefy.notification.open({
            duration: 5000,
            message: `Update publish type "${this.form.type}" berhasil.`,
            position: "is-bottom-right",
            type: "is-success",
            hasIcon: true
          });
        });
    }
  }
};
</script>
