<template>
    <div class="container">
        <div class="row">
            <div v-if="order" class="receipt">
                <h1>Receipt</h1>
                <p>Order ID: {{ order.id }}</p>
                <p>Product Names: {{ order.productNames }}</p>

                <!-- Use RouterLink component to navigate -->
                <router-link to="/">
                    <button class="btn btn-primary">
                        Back to Home
                    </button>
                </router-link>
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
    name: 'ReceiptPage',
    data() {
        return {
            order: {},
        };
    },
    mounted() {
        console.log('Component mounted');
        axios.get('http://localhost:3000/receipt')
            .then(response => {
                console.log('Response Data:', response.data);
                this.order = response.data;
            })
            .catch(error => {
                console.error("Error", error);
            });
    }

}
</script>
