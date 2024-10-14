<template>
    <div>
        <div v-if="collectionData">
            <div v-for="(content, index) in collectionData" :key="index">
                <div class="container text-center">
                    <div class="row mt-3 d-flex justify-content-center align-items-center mb-1">
                        <div class="col-8 col-xl-5 col-lg-6 col-md-7 col-sm-7">
                            <img :src="getImageSrc(content, 'headerImage')" alt="Header Image"
                                class="rounded product-collection-img">
                        </div>
                        <div class="col-10 col-xl-5 col-lg-6 col-md-5 col-sm-5">
                            <h1>{{ content.collectionHeading }}</h1>
                            <p>A Gouvea and Seetelo Design.</p>
                            <p>{{ content.collectionDesc }}</p>
                            <h6 class="col-12">{{ content.availableBtn }}.</h6>
                        </div>
                    </div>
                </div>
                <div class="container text-center mt-5">
                    <div class="row  d-flex justify-content-center align-items-center">
                        <div class="col-4 col-xl-2 col-md-3 mb-2">
                            <h3>The Pieces.</h3>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div v-for="item in itemsData" class="col-8 col-xl-3 col-lg-3 col-md-6 col-sm-6">
                            <!-- Open Modal Item which sends the item as an argument.
                                    Vue will always reference the same first item,if not 
                                    told otherwise. 
                                -->
                            <button class="btn" data-toggle="modal" data-target="#clothesModal"
                                @click="itemModal(item)">
                                <img class="rounded" :src="getImageSrc(item, 'itemImage')" alt="Item Image">
                            </button>
                            <figcaption>{{ item.itemName }}</figcaption>
                            <figcaption>${{ item.itemPrice }} USD</figcaption>
                            <!-- Modal -->
                            <div class="modal fade" id="clothesModal" tabindex="-1" role="dialog"
                                aria-labelledby="formModal" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="formModal">{{ modalItem.itemName }}</h5>
                                            <button type="button" class="btn-close" data-dismiss="modal" 
                                                aria-label="Close">
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row justify-content-center">
                                                <img class="col-9 mb-2" :src="getImageSrc(modalItem, 'itemImage')">
                                                <div class="col-12">
                                                    <p>Gouvea and Seetelo Design.</p>
                                                    <hr>
                                                    <p>{{ modalItem.itemDescription }}</p>
                                                    <h6>${{ modalItem.itemPrice }} USD</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer justify-content-center">
                                            <div class="row justify-content-center" v-if="content.availableBtn == `Available`">
                                                    <div class="col-8 mb-3">
                                                        <select class="form-select" aria-label="Size Select"
                                                            v-model="selectedSize">
                                                            <option disabled value="">Select Size</option>
                                                            <option value="XS">Extra Small</option>
                                                            <option value="S">Small</option>
                                                            <option value="M">Medium</option>
                                                            <option value="L">Large</option>
                                                            <option value="XL">Extra Large</option>
                                                        </select>
                                                        <div class="mt-2">{{ errorMsg }}</div>
                                                    </div>
                                                    <div class="col-12">
                                                        <button type="button" class="btn btn-secondary mx-2"
                                                            data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-primary"
                                                            @click="addToCart" :disabled="addedButtonDisabled">{{ buttonText }}</button>
                                                    </div>
                                                </div>
                                            <div class="row" v-else>
                                                <div class="col-12">
                                                    <button type="button" class="btn btn-secondary mx-2"
                                                        data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-secondary"
                                                        disabled>Unavailable.</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>

<script>

export default {
    data() {
        return {
            collectionName: this.$route.params.collection,
            collectionData: null,
            itemsData: null,
            modalItem: {
                itemName: '',
                itemPrice: '',
                itemDescription: '',
                selectedSize: '',
            },
            errorMsg: '',
            buttonText: "Add to Cart",
            addedButtonDisabled: false
        }
    },
    computed: {
        collectionJSON() {
            return data[this.$route.params.collection];
        },
    },
    watch: {
        //Necessary to watch the route object change when user changes pages.
        '$route'(to) {
            this.collectionName = to.params.collection;
            this.fetchItemsData();
            this.fetchCollectionData();
        },

    },
    async mounted() {
        this.selectedSize = '',
        await this.fetchCollectionData();
        await this.fetchItemsData();
    },
    methods: {
        /*Convulted way to get local images. 
        Constructs a URL based on the this.collectionName route param and 
        the JSON array found within the <template> and its argument.
        */
        getImageSrc(array, imageName) {
            return new URL(`../assets/images/collections/${this.collectionName}page/${array[imageName]}`, import.meta.url).href;
        },
        async fetchCollectionData() {
            const collectionName = this.$route.params.collection;
            const response = await fetch(`http://localhost:3000/specific-collection/${collectionName}`);
            if (response.ok) {
                this.collectionData = await response.json();
            } else {
                console.error('Error fetching data:', response.status);
            }
        },
        async fetchItemsData() {
            const collectionName = this.$route.params.collection;
            const response = await fetch(`http://localhost:3000/specific-items/${collectionName}`);
            if (response.ok) {
                this.itemsData = await response.json();
            } else {
                console.error('Error fetching data:', response.status);
            }
        },
        itemModal(item) {
            this.modalItem = item;
        },
        addToCart() {
            if (!this.selectedSize) {
                    this.errorMsg = "Please select a size."
                    return;
                }
            const cartItem = {
                item: this.modalItem,
                itemImage: this.getImageSrc(this.modalItem, 'itemImage'),
                selectedSize: this.selectedSize,
            };
            this.$store.dispatch('addItemToCart', cartItem);
            this.buttonText = "Added!";
            this.addedButtonDisabled = true;
            this.selectedSize = '',
            this.errorMsg = ''

            setTimeout(() => {
                this.buttonText = "Add to Cart";
                this.addedButtonDisabled = false;
            }, 1000);
        }
    },
}
</script>

<style>
.product-collection-img {
    max-height: 400px;
    object-fit: cover;
    width: 100%;
}
</style>