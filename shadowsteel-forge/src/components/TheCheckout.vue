<template>
    <div class="container">
        <div class="row" v-if="cartTotalItems > 0">
            <div class="col-8">
                <h3>Order Summary: {{ cartTotalItems }} {{ cartTotalItems > 1 ? 'Items' : 'Item' }}</h3>
                <div v-for="(productObject, index) in this.$store.state.cart"
                    class="row rounded d-flex align-items-center">
                    <div class="col-2">
                        <h6>${{ productObject.item.itemPrice }} USD</h6>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <h3>{{ productObject.item.itemName }}.</h3>
                            <h5>{{ productObject.item.collectionName }} collection.</h5>
                            <h6>Selected Size: {{ productObject.selectedSize }}</h6>
                        </div>
                    </div>
                    <div class="col-4">
                        <img class="cart-img rounded p-1" :src="productObject.itemImage" alt="Product Image">
                    </div>
                </div>
            </div>
            <div class="col-4">
                <h3>Checkout</h3>
                <div>
                    <form name="checkoutInformation" class="d-flex flex-direction-column">
                        <div>
                            <label for="fName">First Name</label>
                            <input v-model="fName" id="fName">
                        </div>
                        <div>
                            <label for="lName">Last Name</label>
                            <input v-model="lName" id="lName">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="text-center" v-else>
            <h3>Cart is Empty.</h3>
        </div>
    </div>
</template>

<script>
export default {
    computed: {
        cartTotalPrice() {
            return this.$store.getters.cartTotalPrice;
        },
        cartTotalItems() {
            return this.$store.getters.cartTotalItems;
        }
    }
}
</script>