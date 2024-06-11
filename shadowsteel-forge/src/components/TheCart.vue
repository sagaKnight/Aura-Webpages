<template>
    <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
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
                    <h6 class="mr-auto">Total Price: {{ cartTotalPrice }}</h6>
                    <div>
                        <button type="button" class="btn btn-secondary mx-1" data-dismiss="modal">Close</button>
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
