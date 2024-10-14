import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import CollectionView from '../views/CollectionView.vue'
import ShippingView from '../views/ShippingView.vue'
import SizingView from '../views/SizingView.vue'
import CheckoutView from '../views/CheckoutView.vue'
import ReceiptView from '../views/ReceiptView.vue'
import store from '../store.js'
import ManagerView from '../views/ManagerView.vue'
import OrdersView from '@/views/OrdersView.vue'
import CollectionEditView from '@/views/CollectionEditView.vue'

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
      path: '/checkout',
      name: 'checkout',
      component: CheckoutView
    },
    {
      path: '/receipt',
      name: 'receipt',
      component: ReceiptView,
      beforeEnter: (to, from, next) => {
        if (store.state.order != null) {
          next();
        } else {
          next({ name: 'home' });
        }
      }
    },
    {
      path: '/manager',
      name: 'manager',
      component: ManagerView
    },
    {
      path:'/orders',
      name: 'orders',
      component: OrdersView
    },
    {
      path: '/edit-collection',
      name: 'edit-collection',
      component: CollectionEditView
    }
  ],
})

export default router
