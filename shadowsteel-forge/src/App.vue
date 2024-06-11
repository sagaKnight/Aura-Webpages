<script setup>
import { RouterLink, RouterView } from 'vue-router'
import TheHeader from './components/TheHeader.vue'
import TheFooter from './components/TheFooter.vue'
import TheCart from './components/TheCart.vue'
</script>

<template>
  <TheHeader />
  <RouterView />
  <TheFooter />
  <TheCart />
</template>
