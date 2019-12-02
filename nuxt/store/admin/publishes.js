export const state = () => ({
    publishes: [],
    loading: false,
})

export const getters = {
    publishes(state) {
        return state.publishes
    },
    isLoading(state) {
        return state.loading
    },
}

export const mutations = {
    SET(state, publishes) {
        state.publishes = publishes
        state.loading = false
    },
    LOADING(state, publishes) {
        state.loading = publishes
    }
}

export const actions = {
    async get({commit}, search) {
        commit('LOADING', true)
        await this.$axios.get(`admin/publishes?search=${search}`)
            .then(response => {
                commit('SET', response.data.publishes)
            })

    },
    async add({commit}, publishes) {
        await this.$axios.post('admin/publishes', publishes)
        .then(response => {
            commit('SET', response.data.publishes)
        })
    },
    async delete({commit}, publishes) {
        await this.$axios.delete(`admin/publishes/${publishes}`)
            .then(response => {
                commit('SET', response.data.publishes)
            })
    }

}
