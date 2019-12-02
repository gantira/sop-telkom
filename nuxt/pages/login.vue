<template>
  <div class="columns is-mobile is-centered">
    <div class="column is-3">
      <form @submit.prevent="login">
        <section>
          <b-field
            label="Email"

            :type="{ 'is-danger': hasError }"
            :message="{ 'form.email is not available': hasError }"
          >
            <b-input placeholder="Email" v-model="form.email" maxlength="30"></b-input>
          </b-field>

          <b-field
            label="Password"
            :type="{ 'is-danger': hasError }"
            :message="[
                { 'Password is too short': hasError },
                { 'Password must have at least 8 characters': hasError }
            ]"
          >
            <b-input placeholder="Password" v-model="form.password" type="password" maxlength="30"></b-input>
          </b-field>

          <b-field>
            <b-button native-type="submit" class="button is-primary">Login</b-button>
          </b-field>
        </section>

      </form>
    </div>
  </div>
</template>

<script>
export default {
  middleware: "guest",
  data() {
    return {
      form: {
        email: "",
        password: ""
      },

      hasError: false
    };
  },

  methods: {
    async login() {
      try {
        await this.$auth.loginWith("local", {
          data: this.form
        });
      } catch (error) {
          this.$buefy.snackbar.open(error.response.data)
      }

    }
  }
};
</script>
