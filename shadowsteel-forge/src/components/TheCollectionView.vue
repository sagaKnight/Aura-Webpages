<template>
    <div>
      <div v-if="collectionContent">
        <div v-for="(content, index) in collectionContent" :key="index">
          <div class="container text-center">
            <div class="row mt-3 d-flex justify-content-center align-items-center mb-1"> 
              <div class="col-8 col-xl-5 col-lg-6 col-md-7 col-sm-7">
                <img :src="headerImageSrc(content)" alt="Header Image">
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
              <div class="col-8 col-xl-3 col-lg-3 col-md-6 col-sm-6">
                <img class="rounded" src="../assets/images/collections/adriane-collection.jpg">
                <figcaption>Name</figcaption>
                <figcaption>700 USD</figcaption>
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
        collectionsJson: data
      }
    },
    computed: {
      collectionContent() {
        return this.collectionsJson[this.$route.params.collection];
      },
    },
    methods: {
    //Overly complicated solution to get images working here...
      headerImageSrc(content) {
        return new URL(`../assets/images/collections/adrianepage/${content.headerImage}`, import.meta.url).href;
      }
    }
  }
  </script>
  