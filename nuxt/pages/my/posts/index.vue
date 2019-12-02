<template>
  <div>
    <nav class="level">
      <!-- Left side -->
      <div class="level-left">
        <b-field grouped group-multiline>
          <div class="control">
            <b-switch v-model="showDetailIcon">Show detail icon</b-switch>
          </div>
        </b-field>
      </div>

      <!-- Right side -->
      <div class="level-right">
        <nuxt-link
          class="level-item button is-success"
          :to="{name: 'my-posts-create'}"
        >Create a new post</nuxt-link>
      </div>
    </nav>

    <b-table
      :data="posts"
      ref="table"
      paginated
      per-page="10"
      detailed
      detail-key="id"
      @details-open="(row, index) => $buefy.toast.open(`Expanded ${row.title}`)"
      :show-detail-icon="showDetailIcon"
      aria-next-label="Next page"
      aria-previous-label="Previous page"
      aria-page-label="Page"
      aria-current-label="Current page"
      :checked-rows.sync="checkedRows"
      checkable
    >
      <template slot="bottom-left">
        <button
          class="button is-danger"
          :disabled="!checkedRows.length"
          @click="destroy"
        >Delete: {{ checkedRows.length }} item(s)</button>
      </template>

      <template slot-scope="props">
        <b-table-column
          field="id"
          label="ID"
          width="40"
          numeric
          sortable
          centered
        >{{ props.row.id }}</b-table-column>

        <b-table-column field="title" label="Title" sortable>
          <template v-if="showDetailIcon">{{ props.row.title }}</template>
          <template v-else>
            <a @click="toggle(props.row)">{{ props.row.title }}</a>
          </template>
        </b-table-column>

        <b-table-column field="type" label="Type" sortable>{{ props.row.publish.type }}</b-table-column>

        <b-table-column field="date" label="Date" sortable centered>
          <span class="tag is-success">{{ props.row.created_at }}</span>
        </b-table-column>
      </template>

      <template slot="detail" slot-scope="props">
        <article class="media">
          <div class="media-content">
            <div class="content">
              <nav class="level">
                <div class="level-left">
                  <div class="level-item">
                    <b-field grouped group-multiline>
                      <div class="control" v-for="(tag, index) in props.row.tags" :key="index">
                        <b-tag
                          type="is-primary"
                          attached
                          aria-close-label="Close tag"
                          closable
                          @close="close(tag)"
                        >{{ tag.name }}</b-tag>
                      </div>
                    </b-field>
                  </div>
                </div>

                <div class="level-right">
                  <div class="level-item">
                    <nuxt-link
                      :to="{name: 'my-posts-id-edit', params: {id: props.row.id}}"
                      class="button is-warning is-small"
                    >Edit</nuxt-link>
                  </div>
                </div>
              </nav>
              <div class="content" v-html="props.row.body"></div>
            </div>
          </div>
        </article>
      </template>
    </b-table>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      checkedRows: [],
      items: [
        {
          title: "Home",
          icon: "home",
          to: {
            name: "index"
          }
        },
        {
          title: "Posts",
          icon: "lightbulb",
          to: {
            name: "my-posts"
          }
        }
      ],
      defaultOpenedDetails: [1],
      showDetailIcon: false
    };
  },

  mounted() {
    this.$store.dispatch("posts/get");
  },

  computed: {
    ...mapGetters("posts", ["posts", "isLoading"])
  },

  methods: {
    async logout() {
      await this.$auth.logout();
    },
    toggle(row) {
      this.$refs.table.toggleDetails(row);
    },
    async destroy() {
      this.$buefy.dialog.confirm({
        title: "Deleting post",
        message:
          "Apakah Anda yakin ingin <b> menghapus </b> postingan Anda? Tindakan ini tidak bisa dibatalkan.",
        confirmText: "Delete Post",
        type: "is-danger",
        hasIcon: true,
        onConfirm: () => {
          for (const item of this.checkedRows) {
            this.$store.dispatch("posts/delete", item.id);
          }
          this.checkedRows = [];
          this.$buefy.toast.open("Post deleted!");
        }
      });
    },
  }
};
</script>



