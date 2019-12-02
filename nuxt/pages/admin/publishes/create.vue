<template>
  <div>
    <section class="section">
      <h2 class="title is-3 has-text-grey">
        "Create Publish
        <b-icon icon="rocket" size="is-large" />"
      </h2>
      <h3 class="subtitle is-6 has-text-grey">
        Author:
        <a href="https://github.com/anteriovieira">{{ loggedInUser.name }}</a>
      </h3>
    </section>

    <section>
      <form @submit.prevent="add">
        <b-field label="Type">
          <b-input v-model="form.type" placeholder="Publish type"></b-input>
        </b-field>

        <b-field label="Description">
          <b-input v-model="form.description" placeholder="Publish description"></b-input>
        </b-field>

        <b-button native-type="submit" type="is-primary">Create a Publish</b-button>
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

  methods: {
    add() {
      this.$axios.post("admin/publishes", this.form).then(response => {
        this.$router.push({ name: "admin-publishes" });

        this.$buefy.notification.open({
          duration: 5000,
          message: `Publish type "${this.form.type}" sudah ditambahkan.`,
          position: "is-bottom-right",
          type: "is-success",
          hasIcon: true
        });
      });
    }
  }
};
</script>
