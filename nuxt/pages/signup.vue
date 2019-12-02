<template>
  <div class="columns is-mobile is-centered">
    <div class="column is-3">
      <form @submit.prevent="signup">
        <section>
          <b-field label="Name">
            <b-input v-model="form.name" placeholder="Nama lengkapmu"></b-input>
          </b-field>

          <b-field label="Email">
            <b-input v-model="form.email" type="email" placeholder="Email address"></b-input>
          </b-field>

          <b-field label="Password">
            <b-input v-model="form.password" type="password" placeholder="Password"></b-input>
          </b-field>

          <b-field label="Confirm Password" placeholder="Password">
            <b-input
              v-model="form.password_confirmation"
              type="password"
              placeholder="Confirm Password"
            ></b-input>
          </b-field>

          <b-field>
            <b-button native-type="submit" class="button is-primary">Daftar</b-button>
          </b-field>
        </section>
      </form>

    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      form: {
        name: "",
        email: "",
        password: "",
        password_confirmation: ""
      },
    };
  },

  methods: {
    async signup() {
      await this.$axios.post("auth/register", this.form).then(response => {
          this.$router.push({ name: 'login'})
          this.$buefy.snackbar.open(response.data)
        })
        .catch((error) => {
            console.log(error.response);

            this.$buefy.snackbar.open(error.response.data.message)
        });
    }
  }
};
</script>
