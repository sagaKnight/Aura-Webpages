<template>
    <div class="modal fade modal-lg" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="Cart Modal"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="d-flex justify-content-center" v-if="cartTotalItems == 0">
                        <h6>Your Cart is Empty</h6>
                    </div>
                    <div v-for="(productObject, index) in this.$store.state.cart"
                        class="row rounded d-flex align-items-center border m-2">
                        <div class="col-2">
                            <h6>${{ productObject.item.itemPrice }} USD</h6>
                        </div>
                        <div class="col-3">
                            <div class="row">
                                <h3>{{ productObject.item.itemName }}.</h3>
                                <h5>{{ productObject.item.collectionName }} collection.</h5>
                                <h6>Selected Size: {{ productObject.selectedSize }}</h6>
                            </div>
                        </div>
                        <div class="col-7 d-flex p-2">
                            <img class="cart-img rounded" :src="productObject.itemImage" alt="Product Image">
                            <button type="button" class="btn-close"
                                @click="removeItemFromCart(index)"></button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer row">
                        <div class="col-3" v-if="cartTotalItems > 0">
                            <h6>Total Price: ${{ cartTotalPrice }} USD</h6>
                        </div>
                            <div class="col-7">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-danger mx-1" @click="clearCart">Clear Cart</button>
                            <RouterLink to="/checkout">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Checkout</button>
                            </RouterLink>
                    </div>
                </div>
            </div>
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
    },
    methods: {
        clearCart() {
            this.$store.dispatch('clearCart');
        },
        removeItemFromCart(index) {
            this.$store.dispatch('removeItemFromCart', index);
        }

    }
}
</script>

<style>
.cart-img {
    max-height: 200px;
    width: 100%;
    object-fit: cover;
}
</style>
