<template>
  <div class="container">
    <h1 class="p-3 text-center">Manager Page.</h1>

 
        <div class="row text-center gap-2">
            <RouterLink to="/orders">
                <button class="btn btn-primary btn-lg">Orders</button>
            </RouterLink>
            <RouterLink to="/">
                <button class="btn btn-secondary btn-lg">Edit Collection</button>
            </RouterLink>
        </div>
    </div>
</template>

<script>
import { RouterLink } from "vue-router";
</script>
