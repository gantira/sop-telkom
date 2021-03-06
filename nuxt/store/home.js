export const state = () => ({
    posts: [],
    loading: false,
})

export const getters = {
    posts(state) {
        return state.posts
    },
    isLoading(state) {
        return state.loading
    },
}

export const mutations = {
    SET(state, posts) {
        state.posts = posts
        state.loading = false
    },
    LOADING(state, posts) {
        state.loading = posts
    }
}

export const actions = {
    async get({commit}, search) {
        commit('LOADING', true)
        await this.$axios.get(`/home?search=${search}`)
            .then(response => {
                commit('SET', response.data.posts)
            })

    },
    async add({commit}, posts) {
        await this.$axios.post('/home', posts)
        .then(response => {
            commit('SET', response.data.posts)
        })
    },
    async delete({commit}, posts) {
        await this.$axios.delete(`/home/${posts}`)
            .then(response => {
                commit('SET', response.data.posts)
            })
    }

}
