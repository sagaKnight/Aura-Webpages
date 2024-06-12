<template>
    <div class="container">
        <div class="row">
            <div v-if="order" class="receipt">
                <h1>Receipt</h1>
                <h3>Thanks {{ order.fName }}!</h3>
                <p>Order ID: {{ order.id }}</p>
                <ul class="list-group m-3">
                    <div v-for="item in order.productNames" class="">
                        <li class="list-group-item">{{ item.itemName }} {{ item.selectedSize }}</li>
                    </div>
                </ul>
                <RouterLink to="/">
                    <button class="btn btn-primary">
                        Back to Home
                    </button>
                </RouterLink>
            </div>
            <div v-else>
                <p>Loading...</p>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            order: {},
        };
    },
    mounted() {
        axios.get('http://localhost:3000/receipt')
            .then(response => {
                this.order = response.data;
            })
            .catch(error => {
                console.error("Error", error);
            });
    },
    beforeRouteLeave(to, from, next) {
        this.$store.commit('clearOrderInformation');
        next();
    }

}
</script>
