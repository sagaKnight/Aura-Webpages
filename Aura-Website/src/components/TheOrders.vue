<template>
  <div class="container">
    <div class="row text-center">
      <h1>Orders</h1>
    </div>
    <RouterLink to="/manager">
      <button class="btn btn-secondary mb-2">Back</button>
    </RouterLink>
    <div v-for="order in parsedOrders" :key="order.id" class="row border p-3">
      <div class="row">
        <div class="col-6">
          <h3>Order ID: {{ order.id }}</h3>
          <p>Customer Name: {{ order.fName }} {{ order.lName }}</p>
          <p>Email: {{ order.email }}</p>
          <p>Phone Number: {{ order.pNumber }}</p>
          <p>
            Address: {{ order.address
            }}{{ order.aptNumber ? ", " + order.aptNumber : "" }},
            {{ order.city }}, {{ order.state }}, {{ order.country }},
            {{ order.zip }}
          </p>
          <p>Gift: {{ order.gift === "1" ? "Yes" : "No" }}</p>
          <p>Amount Paid: ${{ order.amountPaid }} USD</p>
        </div>
        <div class="col-5">
          <h3>Items:</h3>
          <ul>
            <li
              v-for="(product, productIndex) in order.productDetails"
              :key="productIndex"
            >
              {{ product.itemName }} - Size: {{ product.selectedSize }}
            </li>
          </ul>
        </div>
        <div class="col-1">
          <button class="btn btn-danger" @click="deleteOrder(order.id)">
            Delete
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      orders: [],
    };
  },
  mounted() {
    axios
      .get("http://localhost:3000/orders")
      .then((response) => {
        this.orders = response.data;
      })
      .catch((error) => {
        console.error("Error", error);
      });
  },
  computed: {
    parsedOrders() {
      return this.orders.map((order) => {
        return {
          ...order,
          productDetails: JSON.parse(order.productNames),
        };
      });
    },
  },
  methods: {
    async deleteOrder(orderId) {
      try {
        const response = await axios.delete(
          `http://localhost:3000/orders/${orderId}`
        );
        if ((response.status === 200)) {
            this.orders = this.orders.filter((order) => order.id !== orderId); 
            window.alert("Order ID: " + orderId + " Deleted Successfully");
        }
      } catch (error) {
        console.error("Error deleting order:", error);
        alert("An error occurred while deleting the order.");
      }
    },
  },
};
</script>
