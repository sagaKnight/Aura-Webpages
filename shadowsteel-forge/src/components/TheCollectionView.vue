<template>
    <div>
      <div v-if="collectionJSON">
        <div v-for="(content, index) in collectionJSON" :key="index">
          <div class="container text-center">
            <div class="row mt-3 d-flex justify-content-center align-items-center mb-1"> 
              <div class="col-8 col-xl-5 col-lg-6 col-md-7 col-sm-7">
                <img :src="getImageSrc(content, 'headerImage')" alt="Header Image" class="rounded product-collection-img">
              </div>
              <div class="col-10 col-xl-5 col-lg-6 col-md-5 col-sm-5">
                <h1>{{ content.collectionHeading }}</h1>
                <p>A Gouvea and Seetelo Design.</p>
                <p>{{ content.collectionDesc }}</p>
                <button class="btn bg-dark text-white">{{ content.availableBtn }}</button>
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
    //Necessary to watch the route object change when user changes pages.
    '$route'(to) {
      this.collectionName = to.params.collection;
        }
    },
    methods: {
    /*Convulted way to get local images. Constructs a URL based on the this.collectionName and 
    the JSON array found within the <template> and its argument. So its taking the string 
    'item image' and 'header image,' but can do the same for any JSON array.      
    Summarily, it's creating a new URL object which is taking 2 arguments. The 2nd argument
    is importing the URL of the current module. The .href is returning the URL as a string. 
    Frustrating solution, I couldn't find anything better and instead had to make this method.
    */
    getImageSrc(array, imageName) {
        return new URL(`../assets/images/collections/${this.collectionName}page/${array[imageName]}`, import.meta.url).href;
        }
    },
  }
  </script>
  