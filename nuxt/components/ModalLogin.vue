<template>
  <div>
    <form @submit.prevent="login">
      <div class="modal-card" style="width: auto">
        <header class="modal-card-head">
          <p class="modal-card-title">Login</p>
        </header>
        <section class="modal-card-body">
          <b-field label="Email">
            <b-input type="email" v-model="form.email" placeholder="Your email" required></b-input>
          </b-field>

          <b-field label="Password">
            <b-input
              type="password"
              v-model="form.password"
              password-reveal
              placeholder="Your password"
              required
            ></b-input>
          </b-field>

          <b-checkbox>Remember me</b-checkbox>
        </section>
        <footer class="modal-card-foot">
          <button class="button" type="button" @click="$parent.close()">Close</button>
          <button type="submit" class="button is-primary">Login</button>
        </footer>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        email: "",
        password: ""
      }
    };
  },

  methods: {
    async login() {
      try {
        await this.$auth.loginWith("local", {
          data: this.form
        });

        this.$parent.close()

      } catch (e) {}
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
