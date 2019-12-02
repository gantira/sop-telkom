<template>
  <div>
    <section class="section">
      <h2 class="title is-3 has-text-grey">
        "Create Tag
        <b-icon icon="rocket" size="is-large" />"
      </h2>
      <h3 class="subtitle is-6 has-text-grey">
        Author:
        <a href="https://github.com/anteriovieira">{{ loggedInUser.name }}</a>
      </h3>
    </section>

    <section>
      <form @submit.prevent="add">
        <b-field label="Tag">
          <b-input v-model="form.name" placeholder="Tag name"></b-input>
        </b-field>

        <b-button native-type="submit" type="is-primary">Create a tag</b-button>
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

  methods: {
    add() {
      this.$axios.post("admin/tags", this.form).then(response => {
        this.$router.push({ name: "admin-tags" });

        this.$buefy.notification.open({
          duration: 5000,
          message: `Tag "${this.form.name}" sudah ditambahkan.`,
          position: "is-bottom-right",
          type: "is-success",
          hasIcon: true
        });
      });
    }
  }
};
</script>
