<template>
  <div>
    <section class="section">
      <h2 class="title is-3 has-text-grey">
        "Edit User
        <b-icon icon="rocket" size="is-large" />"
      </h2>
      <h3 class="subtitle is-6 has-text-grey">
        Author:
        <a href="https://github.com/anteriovieira">{{ loggedInUser.name }}</a>
      </h3>
    </section>

    <section>
      <form @submit.prevent="update">
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

        <b-button native-type="submit" type="is-primary">Update a user</b-button>
      </form>
    </section>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  layout: "admin",
  data() {
    return {
      form: {
        name: "",
        email: "",
        role_id: "",
        unit_id: ""
      }
    };
  },

  mounted() {
    this.$store.dispatch("admin/roles/get");
    this.$store.dispatch("admin/units/get");
  },

  computed: {
    ...mapGetters("admin/roles", ["roles", "isLoading"]),
    ...mapGetters("admin/units", ["units", "isLoading"])
  },

  async asyncData({ $axios, params }) {
    return await $axios.get(`admin/users/${params.id}`).then(response => {
      return {
        form: response.data.user
      };
    });
  },

  methods: {
    update() {
      this.$axios
        .patch(`admin/users/${this.$route.params.id}`, this.form)
        .then(response => {
          this.$router.push({ name: "admin-users" });

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
