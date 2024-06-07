<template>
    <div>
      <div v-if="collectionJSON">
        <div v-for="(content, index) in collectionJSON" :key="index">
          <div class="container text-center">
            <div class="row mt-3 d-flex justify-content-center align-items-center mb-1"> 
              <div class="col-8 col-xl-5 col-lg-6 col-md-7 col-sm-7">
                <img :src="getImageSrc(content, 'headerImage')" alt="Header Image" class="rounded">
              </div>
              <div class="col-10 col-xl-5 col-lg-6 col-md-4 col-sm-5">
                <h1>{{ content.collectionHeading }}</h1>
                <p>A Gouvea and Seetelo Design.</p>
                <p>{{ content.collectionDesc }}</p>
              </div>
            </div>
          </div>
          <div class="container text-center">
            <div class="row  d-flex justify-content-center">
              <div class="col-4 col-xl-2 col-md-3 bg-dark rounded text-white mb-2"> 
                <h3>The Pieces.</h3>
              </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div v-for="item in content.items" class="col-8 col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <img class="rounded" :src="getImageSrc(item, 'itemImage')" alt="Item Image">
                    <figcaption>{{ item.itemName }}</figcaption>
                    <figcaption>{{ item.itemPrice }}</figcaption>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import data from '../components/data.json'
  
  export default {
    data() {
        return {
            collectionName: this.$route.params.collection
        }
    },
    computed: {
      collectionJSON() {
        return data[this.$route.params.collection];
      },
    },
    watch: {
    '$route'(to) {
      this.collectionName = to.params.collection;
        }
    },
    methods: {
    getImageSrc(JSONobject, imageName) {
        const pagePath = `${this.collectionName}page`
        return new URL(`../assets/images/collections/${pagePath}/${JSONobject[imageName]}`, import.meta.url).href;
        }
    },
  }
  </script>
  