<template>
    <div>
        <div v-if="collectionJSON">
            <div v-for="(content, index) in collectionJSON" :key="index">
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
                        <div v-for="item in content.items" class="col-8 col-xl-3 col-lg-3 col-md-6 col-sm-6">
                            <div class="">
                                <!-- Open Modal Item which sends the item as an argument.
                                    Vue will always reference the same first item,if not 
                                    told otherwise. 
                                -->
                                <button class="btn" data-toggle="modal" data-target="#clothesModal"
                                    @click="itemModal(item)">
                                    <img class="rounded" :src="getImageSrc(item, 'itemImage')" alt="Item Image">
                                </button>
                                <figcaption>{{ item.itemName }}</figcaption>
                                <figcaption>{{ item.itemPrice }}</figcaption>
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
                                                        <h5>Gouvea and Seetelo Design.</h5>
                                                        <hr>
                                                        <p>{{ modalItem.itemDescription }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="row" v-if="content.availableBtn == `Available`">
                                                    <h6 class="col-12">One Item per Person.</h6>
                                                    <div class="row">
                                                        <div class="col-3">
                                                            <select class="form-select" aria-label="Size Select">
                                                                <option selected>Size</option>
                                                                <option value="s">Small</option>
                                                                <option value="xs">Extra Small</option>
                                                                <option value="m">Medium</option>
                                                                <option value="l">Large</option>
                                                                <option value="xl">Extra Large</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-3">
                                                            <select class="form-select" aria-label="Size Select">
                                                                <option selected>Sex</option>
                                                                <option value="male">Male</option>
                                                                <option value="female">Female</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-6">
                                                            <button type="button" class="btn btn-secondary mx-2"
                                                                data-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary">Add to
                                                                Cart</button>
                                                        </div>
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
        <div v-else>
            <h3>Collection Not found.</h3>
        </div>
    </div>

</template>

<script>
import data from '../components/data.json'

export default {
    data() {
        return {
            collectionName: this.$route.params.collection,
            modalItem: {
                itemName: '',
                itemPrice: '',
                itemDescription: '',
            },
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
        }
    },
    methods: {
        /*Convulted way to get local images. 
        Constructs a URL based on the this.collectionName route param and 
        the JSON array found within the <template> and its argument.
        */
        getImageSrc(array, imageName) {
            return new URL(`../assets/images/collections/${this.collectionName}page/${array[imageName]}`, import.meta.url).href;
        },
        itemModal(item) {
            this.modalItem = item;
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