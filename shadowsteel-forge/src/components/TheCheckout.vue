<template>
    <div class="container">
        <div class="row" v-if="cartTotalItems > 0">
            <div class="col-12 col-sm-7">
                <h3>Order Summary: {{ cartTotalItems }} {{ cartTotalItems > 1 ? 'Items' : 'Item' }}</h3>
                <h6>Total: ${{ cartTotalPrice }} USD</h6>
                <div v-for="(productObject, index) in this.$store.state.cart" :key="index" class="row rounded mt-3">
                    <div class="col-12 col-md-6 d-flex">
                        <img class="cart-img rounded" :src="productObject.itemImage" alt="Product Image">
                    </div>
                    <div class="col-7 col-md-6">
                        <div class="row">
                            <h3>{{ productObject.item.itemName }}.</h3>
                            <h5>{{ productObject.item.collectionName }} collection.</h5>
                            <h6>Selected Size: {{ productObject.selectedSize }}</h6>
                            <h6>${{ productObject.item.itemPrice }} USD</h6>
                            <button type="button" class="btn shadow-none col-4 text-danger"
                                @click="removeItemFromCart(index)">Remove</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-5">
                <h3>Checkout</h3>
                <div>
                    <form name="checkoutInformation" autocomplete="off" @submit.prevent="validateForm">
                        <div>
                            <h4 class="mb-3">Email</h4>
                            <div class="mb-3 form-floating">
                                <input type="email" class="form-control" v-model="email" id="email"
                                    placeholder="name@example.com">
                                <label for="email">Email Address</label>
                                <div v-if="errors.email" class="text-danger">{{ errors.email }}</div>
                            </div>
                        </div>
                        <div class="row">
                            <h4 class="mb-3">Shipping</h4>
                            <div class="col-12">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="fName" id="fName"
                                        placeholder="first name">
                                    <label for="fName">First Name</label>
                                    <div v-if="errors.fName" class="text-danger">{{ errors.fName }}</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="lName" id="lName"
                                        placeholder="last name">
                                    <label for="lName">Last Name</label>
                                    <div v-if="errors.lName" class="text-danger">{{ errors.lName }}</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="pNumber" id="pNumber"
                                        placeholder="0424120120">
                                    <label for="pNumber">Phone Number</label>
                                    <div v-if="errors.pNumber" class="text-danger">{{ errors.pNumber }}</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="address" id="address"
                                        placeholder="120 Tom Drive">
                                    <label for="address">Address</label>
                                    <div v-if="errors.address" class="text-danger">{{ errors.address }}</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="aptNumber" id="aptNumber"
                                        placeholder="12">
                                    <label for="aptNumber">Apt Suite (Optional)</label>
                                    <div v-if="errors.aptNumber" class="text-danger">{{ errors.address }}</div>
                                </div>
                            </div>
                            <div class="col-12 col-md-12 col-lg-4">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="city" id="city"
                                        placeholder="Melbourne">
                                    <label for="city">City</label>
                                    <div v-if="errors.city" class="text-danger">{{ errors.city }}</div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="state" id="state"
                                        placeholder="VIC">
                                    <label for="state">State</label>
                                    <div v-if="errors.state" class="text-danger text-center">{{ errors.state }}</div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="zipCode" id="zipCode"
                                        placeholder="1222">
                                    <label for="zipCode">ZIP</label>
                                    <div v-if="errors.zipCode" class="text-danger text-center">{{ errors.zipCode }}
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3 form-floating">
                                    <input type="text" class="form-control" v-model="country" id="country"
                                        placeholder="Australia">
                                    <label for="country">Country</label>
                                    <div v-if="errors.country" class="text-danger">{{ errors.country }}</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" v-model="gift" id="gift">
                                    <label class="form-check-label" for="gift">This order is a gift.</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <h4>Payment Method</h4>
                            <div class="">
                                <button class="p-3 mb-2 border rounded d-flex btn col-12">
                                    <h6 class="m-1">Credit Card</h6><i class="bi bi-credit-card-fill"></i>
                                </button>
                                <button class="p-3 mb-2 border rounded d-flex btn col-12">
                                    <h6 class="m-1">Paypal</h6><i class="bi bi-paypal"></i>
                                </button>
                                <button class="p-3 mb-2 border rounded d-flex btn col-12">
                                    <h6 class="m-1">Pay Over Time</h6><i class="bi bi-stripe"></i>
                                </button>
                            </div>
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
    data() {
        return {
            email: '',
            fName: '',
            lName: '',
            pNumber: '',
            address: '',
            aptNumber: '',
            city: '',
            state: '',
            country: '',
            gift: false,
            errors: {}
        };
    },
    computed: {
        cartTotalPrice() {
            return this.$store.getters.cartTotalPrice;
        },
        cartTotalItems() {
            return this.$store.getters.cartTotalItems;
        }
    },
    methods: {
        removeItemFromCart(index) {
            this.$store.dispatch('removeItemFromCart', index);
        },
        validateForm() {
            this.errors = {};

            if (!this.email) {
                this.errors.email = 'Email is required';
            } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email)) {
                this.errors.email = 'Invalid email';
            }

            if (!this.fName) {
                this.errors.fName = 'First name is required';
            } else if (/\d/.test(this.fName)) {
                this.errors.fName = 'First name cannot contain numbers';
            }

            if (!this.lName) {
                this.errors.lName = 'Last name is required';
            } else if (/\d/.test(this.lName)) {
                this.errors.lName = 'Last name cannot contain numbers';
            }

            if (!this.pNumber) {
                this.errors.pNumber = 'Phone number is required';
            } else if (!/^\d{10,15}$/.test(this.pNumber)) {
                this.errors.pNumber = 'Phone number must be between 10 and 15 digits';
            }

            if (!this.address) {
                this.errors.address = 'Address is required';
            }

            if (/\d/.test(this.aptNumber)) {
                this.errors.aptNumber = "Apt Number cannot container numbers";
            }

            if (!this.city) {
                this.errors.city = 'City is required';
            } else if (/\d/.test(this.city)) {
                this.errors.city = 'City cannot contain numbers';
            }

            if (!this.state) {
                this.errors.state = 'State is required';
            } else if (/\d/.test(this.state)) {
                this.errors.state = 'State cannot contain numbers';
            }

            if (!this.zipCode) {
                this.errors.zipCode = 'ZIP code is required';
            } else if (!/^\d{4,5}$/.test(this.zipCode)) {
                this.errors.zipCode = 'ZIP code must be 4 or 5 digits';
            }

            if (!this.country) {
                this.errors.country = 'Country is required';
            } else if (/\d/.test(this.country)) {
                this.errors.country = 'Country cannot contain numbers';
            }

            //Create a method to then push a button 
            // To Remove Testing button.
            if (Object.keys(this.errors).length === 0) {
                console.log({
                    email: this.email,
                    fName: this.fName,
                    lName: this.lName,
                    pNumber: this.pNumber,
                    address: this.address,
                    aptNumber: this.aptNumber,
                    city: this.city,
                    state: this.state,
                    country: this.country,
                    gift: this.gift
                });
                alert('Form submitted successfully!');
            }
        },
        removeItemFromCart(index) {
            this.$store.dispatch('removeItemFromCart', index);
        }
    }
}
</script>