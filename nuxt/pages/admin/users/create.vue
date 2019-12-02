<template>
  <div>
    <section class="section">
      <h2 class="title is-3 has-text-grey">
        "Create User
        <b-icon icon="rocket" size="is-large" />"
      </h2>
      <h3 class="subtitle is-6 has-text-grey">
        Author:
        <a href="https://github.com/anteriovieira">{{ loggedInUser.name }}</a>
      </h3>
    </section>

    <section>
      <form @submit.prevent="add">
        <b-field label="User">
          <b-input v-model="form.name" placeholder="User name"></b-input>
        </b-field>

        <b-field label="Email">
          <b-input v-model="form.email" placeholder="User email"></b-input>
        </b-field>

        <b-field label="Role">
          <b-select v-model="form.role_id" expanded>
            <option :value="role.id" v-for="role in roles" :key="role.id">{{ role.name }}</option>
          </b-select>
        </b-field>

        <b-field label="Unit">
          <b-select v-model="form.unit_id" expanded>
            <option :value="unit.id" v-for="unit in units" :key="unit.id">{{ unit.name }}</option>
          </b-select>
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
      this.$axios.post("admin/units", this.form).then(response => {
        this.$router.push({ name: "admin-units" });

        this.$buefy.notification.open({
          duration: 5000,
          message: `Unit "${this.form.name}" sudah ditambahkan.`,
          position: "is-bottom-right",
          type: "is-success",
          hasIcon: true
        });
      });
    }
  }
};
</script>
