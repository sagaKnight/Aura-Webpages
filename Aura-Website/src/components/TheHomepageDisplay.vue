<template>
  <div class="container p-5 position-relative">
    <div class="row justify-content-center align-items-center">
      <div
        class="col-6 col-md-5 bg-white p-2 text-center"
      >
        <h1>The Von Collection.</h1>
        <h4>Releasing Internationally.</h4>
        <h6>Raffle Entry Only.</h6>
        <RouterLink to="/" class="btn btn-dark mx-auto col-12 col-sm-6">
          Find Out More.
        </RouterLink>
      </div>
      <div class="col-6 col-xl-5 col-lg-5 col-md-5 col-sm-4 p-2">
        <RouterLink to="/collection/von">
          <img
            src="../assets/images/collections/thumbnails/von-collection-1.jpg"
            alt="main collection image"
            class="rounded on-display-img"
          />
        </RouterLink>
      </div>
      <div class="col-6 col-xl-5 col-lg-5 col-md-5  col-sm-4 p-2">
        <RouterLink to="/collection/von">
          <img
            src="../assets/images/collections/thumbnails/von-collection-2.jpg"
            alt="main collection image"
            class="rounded on-display-img"
          />
        </RouterLink>
      </div>
      <div class="col-6 col-xl-5 col-lg-5 col-md-5 col-sm-6 p-2">
        <RouterLink to="/collection/von">
          <img
            src="../assets/images/collections/thumbnails/von-collection-3.jpg"
            alt="main collection image"
            class="rounded on-display-img"
          />
        </RouterLink>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row d-flex justify-content-center">
      <div class="col-12 text-center">
        <h1>Previous Releases.</h1>
        <div class="row d-flex justify-content-center m-1">
          <div v-for="(collection, index) in collections" :key="index" class="col-6">
            <h3>{{ collection.collectionHeading }}</h3>
            <RouterLink :to="`/collection/${collection.collectionName}`">
              <img
                :src="getThumbnailSrc(collection)"
                :alt="`${collection.title} image`"
                class="rounded img-fluid home-collection-img"
              />
            </RouterLink>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
.home-collection-img {
  max-height: 300px;
  object-fit: cover;
  width: 100%;
  height: 100%;
}
</style>

<script>
import axios from "axios";

export default {
  data() {
    return {
      collections: [],
    };
  },
  mounted() {
    this.fetchAllCollections();
  },
  methods: {
    async fetchAllCollections() {
      try {
        const response = await axios.get(
          "http://localhost:3000/previous-collections"
        );
        this.collections = response.data;
      } catch (error) {
        console.error(error);
      }
    },
    // New method to get the thumbnail source for each collection
    getThumbnailSrc(collection) {
      return new URL(
        `../assets/images/collections/thumbnails/${collection.thumbnail}`,
        import.meta.url
      ).href;
    },
  },
};
</script>
