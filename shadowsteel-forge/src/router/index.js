import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import CollectionView from '../views/CollectionView.vue'
import ShippingView from '../views/ShippingView.vue'
import SizingView from '../views/SizingView.vue'
import CartList from '../store/modules/cart/CartList.vue';
import ProductList from '../store/modules/cart/ProductList.vue';


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView
    },
    {
      path: '/collection/:collection',
      name: 'collection',
      component: CollectionView
    },
    {
      path: '/shipping',
      name: 'shipping',
      component: ShippingView
    },
    {
      path: '/sizing',
      name: 'sizing',
      component: SizingView
    },
    {
      path: '/inventory',
      component: ProductList
    },
    {
      path: '/cart',
      component: CartList
    },
  ],
})

export default router
