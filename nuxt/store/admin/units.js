export const state = () => ({
    units: [],
    loading: false,
})

export const getters = {
    units(state) {
        return state.units
    },
    isLoading(state) {
        return state.loading
    },
}

export const mutations = {
    SET(state, units) {
        state.units = units
        state.loading = false
    },
    LOADING(state, units) {
        state.loading = units
    }
}

export const actions = {
    async get({commit}, search) {
        commit('LOADING', true)
        await this.$axios.get(`admin/units?search=${search}`)
            .then(response => {
                commit('SET', response.data.units)
            })

    },
    async add({commit}, units) {
        await this.$axios.post('admin/units', units)
        .then(response => {
            commit('SET', response.data.units)
        })
    },
    async delete({commit}, units) {
        await this.$axios.delete(`admin/units/${units}`)
            .then(response => {
                commit('SET', response.data.units)
            })
    }

}
