<template>
    <div class="container">
        <h1 class="p-3 text-center">Manager Page.</h1>
        <div v-for="order in orders" :key="order.id" class="row">
            <div class="col-6">
                <h3>Order ID: {{ order.id }}</h3>
                <p>Customer Name: {{ order.fName }} {{ order.lName }}</p>
                <p>Email: {{ order.email }}</p>
                <p>Phone Number: {{ order.pNumber }}</p>
                <p>Address: {{ order.address }}{{ order.aptNumber ? ', ' + order.aptNumber : '' }}, {{ order.city }}, {{
            order.state }}, {{ order.country }}, {{ order.zip }}</p>
                <p>Gift: {{ order.gift === '1' ? 'Yes' : 'No' }}</p>
            </div>
            <div class="col-6">
                <ul class="list-group">
                    <li class="list-group-item" v-for="(product, index) in order.productNames" :key="index">
                        {{ product.itemName }} - {{ product.selectedSize }}
                    </li>
                </ul>
            </div>
            <hr>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            orders: {},
        };
    },
    mounted() {
        axios.get('http://localhost:3000/orders')
            .then(response => {
                this.orders = response.data;
            })
            .catch(error => {
                console.error("Error", error);
            });
    },
}
</script>