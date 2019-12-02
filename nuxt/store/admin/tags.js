export const state = () => ({
    tags: [],
    loading: false,
})

export const getters = {
    tags(state) {
        return state.tags
    },
    isLoading(state) {
        return state.loading
    },
}

export const mutations = {
    SET(state, tags) {
        state.tags = tags
        state.loading = false
    },
    LOADING(state, tags) {
        state.loading = tags
    }
}

export const actions = {
    async get({commit}, search) {
        commit('LOADING', true)
        await this.$axios.get(`admin/tags?search=${search}`)
            .then(response => {
                commit('SET', response.data.tags)
            })

    },
    async add({commit}, tags) {
        await this.$axios.post('admin/tags', tags)
            .then(response => {
                commit('SET', response.data.tags)
            })
    },
    async delete({commit}, tags) {
        await this.$axios.delete(`admin/tags/${tags}`)
            .then(response => {
                commit('SET', response.data.tags)
            })
    }

}
