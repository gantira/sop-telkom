export const state = () => ({
    roles: [],
    loading: false,
})

export const getters = {
    roles(state) {
        return state.roles
    },
    isLoading(state) {
        return state.loading
    },
}

export const mutations = {
    SET(state, roles) {
        state.roles = roles
        state.loading = false
    },
    LOADING(state, roles) {
        state.loading = roles
    }
}

export const actions = {
    async get({commit}, search) {
        commit('LOADING', true)
        await this.$axios.get(`admin/roles?search=${search}`)
            .then(response => {
                commit('SET', response.data.roles)
            })

    },
    async add({commit}, roles) {
        await this.$axios.post('admin/roles', roles)
        .then(response => {
            commit('SET', response.data.roles)
        })
    },
    async delete({commit}, roles) {
        await this.$axios.delete(`admin/roles/${roles}`)
            .then(response => {
                commit('SET', response.data.roles)
            })
    }

}
