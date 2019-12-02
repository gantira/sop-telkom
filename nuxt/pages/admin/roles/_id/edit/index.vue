<template>
  <div>
    <section class="section">
      <h2 class="title is-3 has-text-grey">
        "Edit Role
        <b-icon icon="rocket" size="is-large" />"
      </h2>
      <h3 class="subtitle is-6 has-text-grey">
        Author:
        <a href="https://github.com/anteriovieira">{{ loggedInUser.name }}</a>
      </h3>
    </section>

    <section>
      <form @submit.prevent="update">
         <b-field label="Role">
          <b-input v-model="form.name" placeholder="Role name"></b-input>
        </b-field>

        <b-field label="Description">
          <b-input v-model="form.description" placeholder="Role description"></b-input>
        </b-field>

        <b-button native-type="submit" type="is-primary">Update a role</b-button>
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
        name: ""
      }
    };
  },

  async asyncData({ $axios, params }) {
    return await $axios.get(`admin/roles/${params.id}`).then(response => {
      return {
        form: response.data.role
      };
    });
  },

  methods: {
    update() {
      this.$axios
        .patch(`admin/roles/${this.$route.params.id}`, this.form)
        .then(response => {
          this.$router.push({ name: "admin-roles" });

          this.$buefy.notification.open({
            duration: 5000,
            message: `Update "${this.form.name}" berhasil.`,
            position: "is-bottom-right",
            type: "is-success",
            hasIcon: true
          });
        });
    }
  }
};
</script>
