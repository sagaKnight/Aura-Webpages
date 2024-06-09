<template>
    <div class="container-fluid mt-4">
        <footer class="text-center">
            <div class="container p-4">
                <section class="mb-4">
                    <a class="btn btn-outline-dark m-1" href="https://www.facebook.com" role="button">
                        <i class="bi bi-facebook"></i></a>
                    <a class="btn btn-outline-dark m-1" href="https://www.twitter.com" role="button">
                        <i class="bi bi-twitter-x"></i></a>
                    <a class="btn btn-outline-dark m-1" href="https://www.instagram.com" role="button">
                        <i class="bi bi-instagram"></i></a>
                    <a class="btn btn-outline-dark m-1" href="https://www.youtube.com" role="button">
                        <i class="bi bi-youtube"></i></a>
                </section>
                <section>
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <h5>Releases</h5>
                            <ul class="list-unstyled">
                                <li><router-link to="/collection/von" class="footer-link">Von Collection</router-link></li>
                                <li><router-link to="/collection/adriane" class="footer-link">Adriane Collection</router-link></li>
                                <li><router-link to="/collection/sora" class="footer-link">Sora Collection</router-link></li>
                                <li><router-link to="/collection/stow" class="footer-link">Stow Collection</router-link></li>
                                <li><router-link to="/collection/kelly" class="footer-link">Kelly Collection</router-link></li>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <h5>Resources</h5>
                            <ul class="list-unstyled">
                                <li><router-link to="/about" class="footer-link">About</router-link></li>
                                <li><router-link to="/sizing" class="footer-link">Sizing</router-link></li>
                                <li><router-link to="/shipping" class="footer-link">Shipping</router-link></li>
                                <li><router-link to="/login" class="footer-link">Staff Login</router-link></li>
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