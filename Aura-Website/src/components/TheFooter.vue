<template>
  <div class="container-fluid mt-4">
    <footer class="text-center">
      <div class="container p-4">
        <section class="mb-4">
          <a
            class="btn btn-outline-dark m-1"
            href="https://www.facebook.com"
            role="button"
          >
            <i class="bi bi-facebook"></i
          ></a>
          <a
            class="btn btn-outline-dark m-1"
            href="https://www.twitter.com"
            role="button"
          >
            <i class="bi bi-twitter-x"></i
          ></a>
          <a
            class="btn btn-outline-dark m-1"
            href="https://www.instagram.com"
            role="button"
          >
            <i class="bi bi-instagram"></i
          ></a>
          <a
            class="btn btn-outline-dark m-1"
            href="https://www.youtube.com"
            role="button"
          >
            <i class="bi bi-youtube"></i
          ></a>
        </section>
        <section>
          <div class="row">
            <div class="col-lg-6 col-md-6">
              <h5>Releases</h5>
              <ul class="list-unstyled">
                <li
                  v-for="collection in collections"
                  :key="collection.collectionName"
                >
                  <RouterLink
                    class="footer-link"
                    :to="`/collection/${collection.collectionName}`"
                  >
                    {{
                      collection.collectionName[0].toUpperCase() +
                      collection.collectionName.slice(1)
                    }}
                    Collection
                  </RouterLink>
                </li>
              </ul>
            </div>
            <div class="col-lg-6 col-md-6">
              <h5>Resources</h5>
              <ul class="list-unstyled">
                <li>
                  <router-link to="/about" class="footer-link"
                    >About</router-link
                  >
                </li>
                <li>
                  <router-link to="/sizing" class="footer-link"
                    >Sizing</router-link
                  >
                </li>
                <li>
                  <router-link to="/shipping" class="footer-link"
                    >Shipping</router-link
                  >
                </li>
                <li>
                  <router-link to="/login" class="footer-link"
                    >Staff Login</router-link
                  >
                </li>
              </ul>
            </div>
          </div>
        </section>
      </div>
    </footer>
  </div>
</template>

<style scoped>
.footer-link {
  color: inherit;
  text-decoration: none;
}
</style>

<script>
import { RouterLink } from "vue-router";
import axios from "axios";

export default {
  data() {
    return {
      collections: [],
    };
  },
  methods: {
    async fetchCollections() {
      try {
        const response = await axios.get(
          "http://localhost:3000/previous-collections"
        );
        this.collections = response.data;
      } catch (error) {
        console.error(error);
      }
    },
  },
  mounted() {
    this.fetchCollections();
  },
};
</script>
