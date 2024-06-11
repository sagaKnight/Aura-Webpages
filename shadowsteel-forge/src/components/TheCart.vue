<template>
    <div class="modal fade cart-modal" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="Cart Modal"
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
                    <div v-for="productObject in this.$store.state.cart" class="row rounded d-flex align-items-center">
                        <div class="col-2">
                            <h6>${{ productObject.item.itemPrice }} USD</h6>
                        </div>
                        <div class="col-4">
                            <div class="row">
                                <h3>{{ productObject.item.itemName }}.</h3>
                                <h5>{{ productObject.item.collectionName }} collection.</h5>
                                <h6>Selected Size: {{ productObject.selectedSize }}</h6>
                            </div>
                        </div>
                        <div class="col-6">
                            <img class="cart-img rounded p-1" :src="productObject.itemImage" alt="Product Image">
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-between align-items-center">
                    <div class="" v-if="cartTotalItems > 0">
                        <h6>Total Price: ${{ cartTotalPrice }} USD</h6>
                        <h6>Items in Cart: {{ cartTotalItems }}</h6>
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger mx-1" @click="clearCart">Clear Cart</button>
                        <button type="button" class="btn btn-primary">Checkout</button>
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
/* 
.cart-modal .modal {
    display: block;
}

.cart-modal .modal-dialog{
    overflow-y: initial;
}

.cart-modal .modal-body{
    height: 70vh;
    overflow-y: auto;
}    
*/

</style>
