export const state = () => ({
    users: [],
    loading: false,
})

export const getters = {
    users(state) {
        return state.users
    },
    isLoading(state) {
        return state.loading
    },
}

export const mutations = {
    SET(state, users) {
        state.users = users
        state.loading = false
    },
    LOADING(state, users) {
        state.loading = users
    }
}

export const actions = {
    async get({commit}, search) {
        commit('LOADING', true)
        await this.$axios.get(`admin/users?search=${search}`)
            .then(response => {
                commit('SET', response.data.users)
            })

    },
    async add({commit}, users) {
        await this.$axios.post('admin/users', users)
        .then(response => {
            commit('SET', response.data.users)
        })
    },
    async delete({commit}, users) {
        await this.$axios.delete(`admin/users/${users}`)
            .then(response => {
                commit('SET', response.data.users)
            })
    }

}
