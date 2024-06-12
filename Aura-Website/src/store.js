import { createStore } from 'vuex'
import VuexPersistence from 'vuex-persist'

const store = createStore({
  state () {
    return {
      cart: [],
      order: null,
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
    orderInformation(state, order) {
      state.order = order;
    },
    clearOrderInformation(state) {
      state.order = null;
    }
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
      return state.cart.reduce((totalPrice, productObject) => totalPrice + productObject.item.itemPrice, 0);
    }
  },
  //Using Vuex Persistence Plugin. 
  plugins: [new VuexPersistence().plugin]
})

export default store