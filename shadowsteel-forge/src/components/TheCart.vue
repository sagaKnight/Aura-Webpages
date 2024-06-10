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
                    <div class="row border rounded d-flex align-items-center m-2">
                        <div class="col-6">
                            <img class="cart-img" src="../assets/images/collections/adriane-collection.jpg">
                        </div>
                        <div class="col-6 p-3">
                            <h3>Item Name</h3>
                            <p>Item Price</p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-between align-items-center">
                    <h6 class="mr-auto">Total: $1000</h6>
                    <div>
                        <button type="button" class="btn btn-secondary mx-1" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Checkout</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>



<style>
.cart-img {
    max-height: 100px;
    width: 100%;
    object-fit: cover;
}
</style>
