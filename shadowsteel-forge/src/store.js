import { createStore } from 'vuex'

const store = createStore({
  state () {
    return {
      cart: [],
    }
  },
  mutations: {
    addToCart(state, product) {
      state.cart.push(product);
    },
    removeFromCart(state, index) {
        state.cart.splice(index, 1);
    },
    clearCart(state) {
        state.cart = [];
    },
  },
  actions: {
    addItemToCart({ commit }, item) {
        commit('addToCart', item);
    },
    removeItemFromCart({ commit, state}, index) {
        if (index >= 0 && index < state.cart.length) {
            commit('removeFromCart', index);
        }
    },
    clearCart({ commit }) {
        commit('clearCart');
    },
  },
  getters: {
    cartTotalItems(state) {
        return state.cart.length;
    },
    cartTotalPrice(state) {
        return $state.cart.reduce((totalPrice, item) => totalPrice + item.price, 0);
    }
  }
})

export default store
