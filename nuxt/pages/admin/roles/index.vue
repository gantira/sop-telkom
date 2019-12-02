<template>
  <section class="section">
    <!-- Main container -->
    <nav class="level">
      <!-- Left side -->
      <div class="level-left">
        <div class="level-item">
          <p class="subtitle is-5">
            <strong>{{ roles.length }}</strong> roles
          </p>
        </div>
        <div class="level-item">
          <form @submit.prevent="find">
            <div class="field has-addons">
              <p class="control">
                <input
                  class="input"
                  v-model="search"
                  @keydown.enter.prevent="find"
                  type="text"
                  placeholder="Find a role"
                />
              </p>
              <p class="control">
                <button class="button">Search</button>
              </p>
            </div>
          </form>
        </div>
      </div>

      <!-- Right side -->
      <div class="level-right">
        <p class="level-item">
          <strong>All</strong>
        </p>
        <p class="level-item">
          <a>Published</a>
        </p>
        <p class="level-item">
          <a>Drafts</a>
        </p>
        <p class="level-item">
          <a>Deleted</a>
        </p>
        <nuxt-link class="level-item button is-success" :to="{name: 'admin-roles-create'}">New</nuxt-link>
      </div>
    </nav>

    <b-field grouped group-multiline>
      <!-- <div class="control">
        <button
          class="button field is-danger align-items-flex-end"
          @click="selected = null"
          :disabled="!selected"
        >
          <b-icon icon="close"></b-icon>
          <span>Clear selected</span>
        </button>
      </div>
      <b-select v-model="checkboxPosition">
        <option value="left">Checkbox at left</option>
        <option value="right">Checkbox at right</option>
      </b-select>
      <b-select v-model="defaultSortDirection">
        <option value="asc">Default sort direction: ASC</option>
        <option value="desc">Default sort direction: DESC</option>
      </b-select>-->
      <b-select v-model="perPage" :disabled="!isPaginated">
        <option value="10">10 per page</option>
        <option value="15">15 per page</option>
        <option value="20">20 per page</option>
      </b-select>
      <!-- <div class="control">
        <button class="button" @click="currentPage = 2" :disabled="!isPaginated">Set page to 2</button>
      </div>-->
      <div class="control is-flex">
        <b-switch v-model="isPaginated">Paginated</b-switch>
      </div>
      <!-- <div class="control is-flex">
        <b-switch v-model="isPaginationSimple" :disabled="!isPaginated">Simple pagination</b-switch>
      </div>
      <b-select v-model="paginationPosition" :disabled="!isPaginated">
        <option value="bottom">bottom pagination</option>
        <option value="top">top pagination</option>
        <option value="both">both</option>
      </b-select>
      <b-select v-model="sortIcon">
        <option value="arrow-up">Arrow sort icon</option>
        <option value="menu-up">Caret sort icon</option>
        <option value="chevron-up">Chevron sort icon</option>
      </b-select>
      <b-select v-model="sortIconSize">
        <option value="is-small">Small sort icon</option>
        <option value>Regular sort icon</option>
        <option value="is-medium">Medium sort icon</option>
        <option value="is-large">Large sort icon</option>
      </b-select>-->
    </b-field>

    <b-tabs v-model="activeTab">
      <b-tab-item label="Table">
        <b-table
          :loading="isLoading"
          :data="roles"
          :columns="columns"
          :selected.sync="selected"
          focusable
          :paginated="isPaginated"
          :per-page="perPage"
          :current-page.sync="currentPage"
          :pagination-simple="isPaginationSimple"
          :pagination-position="paginationPosition"
          :default-sort-direction="defaultSortDirection"
          :sort-icon="sortIcon"
          :sort-icon-size="sortIconSize"
          default-sort="title"
          aria-next-label="Next page"
          aria-previous-label="Previous page"
          aria-page-label="Page"
          aria-current-label="Current page"
          :checked-rows.sync="checkedRows"
          checkable
          :checkbox-position="checkboxPosition"
        >
          <template slot="bottom-left">
            <button
              class="button is-danger"
              :disabled="!checkedRows.length"
              @click="destroy"
            >Delete: {{ checkedRows.length }} item(s)</button>
          </template>
        </b-table>
      </b-tab-item>

      <b-tab-item label="Selected">
        <template v-if="selected">
          <nav class="level">
            <div class="level-left">
              <div class="level-item">
                <b-field grouped group-multiline>{{ selected.name }}</b-field>
              </div>
            </div>

            <div class="level-right">
              <div class="level-item">
                <nuxt-link
                  :to="{name: 'admin-roles-id-edit', params: {id: selected.id}}"
                  class="button is-warning is-small"
                >Edit</nuxt-link>
              </div>
            </div>
          </nav>
        </template>
      </b-tab-item>
    </b-tabs>
  </section>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  layout: "admin",
  data() {
    return {
      search: "",
      isPaginated: true,
      isPaginationSimple: false,
      paginationPosition: "bottom",
      defaultSortDirection: "asc",
      sortIcon: "arrow-up",
      sortIconSize: "is-small",
      currentPage: 1,
      perPage: 10,
      activeTab: 0,
      selected: null,
      checkedRows: [],
      checkboxPosition: "left",
      columns: [
        {
          field: "id",
          label: "ID",
          width: "40",
          sortable: true,
          numeric: true
        },
        {
          field: "name",
          label: "Name",
          sortable: true
        },
        {
          field: "description",
          label: "Description",
          sortable: true
        },
        {
          field: "created_at",
          label: "Created Date",
          centered: true,
          sortable: true
        },
        {
          field: "updated_at",
          label: "Last Update",
          sortable: true
        }
      ]
    };
  },

  mounted() {
    this.$store.dispatch("admin/roles/get");
  },

  computed: {
    ...mapGetters("admin/roles", ["roles", "isLoading"])
  },

  watch: {
    search(val) {
      if (val == "") {
        this.$store.dispatch("admin/roles/get");
      }
    }
  },
  methods: {
    close(role) {
      alert(role.name);
    },
    async destroy() {
      this.$buefy.dialog.confirm({
        title: "Deleting role",
        message:
          "Apakah Anda yakin ingin <b> menghapus </b> role? Tindakan ini tidak bisa dibatalkan.",
        confirmText: "Delete role",
        type: "is-danger",
        hasIcon: true,
        onConfirm: () => {
          for (const item of this.checkedRows) {
            this.$store.dispatch("admin/roles/delete", item.id);
          }
          this.checkedRows = [];
          this.$buefy.toast.open("role deleted!");
        }
      });
    },
    find() {
      this.$store.dispatch("admin/roles/get", this.search);
    }
  }
};
</script>
