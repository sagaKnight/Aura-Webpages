<template>
    <div class="container p-3 position-relative">
        <div class="row d-flex justify-content-center">
            <div class="col-12 col-xl-4 col-lg-4 col-md-4 col-sm-6">
                <RouterLink to="/collection/von">
                    <img src="../assets/images/collections/von-collection-1.jpg" alt="main collection image"
                        class="on-display-image rounded" />
                </RouterLink>
            </div>
            <div class="col-12 col-xl-4 col-lg-4 col-md-4 col-sm-6">
                <RouterLink to="/collection/von">
                    <img src="../assets/images/collections/von-collection-2.jpg" alt="main collection image"
                        class="on-display-image rounded" />
                </RouterLink>
            </div>
            <div class="col-12 col-xl-4 col-lg-4 col-md-4 col-sm-6">
                <RouterLink to="/collection/von">
                    <img src="../assets/images/collections/von-collection-3.jpg" alt="main collection image"
                        class="on-display-image rounded" />
                </RouterLink>
            </div>
        </div>
        <div class="row">
            <div class="col-5  col-sm-5 text-center position-absolute
            bg-white p-3 rounded top-50 start-0 translate-middle-y">
                <h1>The Von Collection.</h1>
                <h4>Releasing Internationally.</h4>
                <h6>Raffle Entry Only.</h6>
                <RouterLink to="/" class="btn btn-dark mx-auto col-12 col-sm-6">Find Out More.</RouterLink>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row d-flex justify-content-center m-3">
            <div class="col-6 col-xl-4 col-lg-4 col-md-6 col-sm-8 text-center">
                <h1>Previous Releases.</h1>
            </div>
        </div>

        <div class="row d-flex justify-content-center m-1">
            <div class="col-5 col-xl-6 col-lg-4 col-md-5 col-sm-8 text-black rounded">
                <h3>The Sora Collection.</h3>
                <RouterLink class="collection-header" to="/collection/sora">
                    <img src="../assets/images/collections/sora-collection.jpg" alt="sora image"
                        class="rounded img-fluid home-collection-img" />
                </RouterLink>
            </div>
            <div class="col-5 col-xl-6 col-lg-4 col-md-5 col-sm-8 text-black rounded">
                <h3>The Stow Collection.</h3>
                <RouterLink class="collection-header" to="/collection/stow">
                    <img src="../assets/images/collections/stow-collection.jpg" alt="stow image"
                        class="rounded img-fluid home-collection-img" />
                </RouterLink>
            </div>
            <div class="col-5 col-xl-6 col-lg-4 col-md-5 col-sm-8 text-black rounded">
                <h3>The Adriane Collection.</h3>
                <RouterLink class="collection-header" to="/collection/adriane">
                    <img src="../assets/images/collections/adriane-collection.jpg" alt="adriane image"
                        class="rounded img-fluid home-collection-img" />
                </RouterLink>
            </div>
            <div class="col-5 col-xl-6 col-lg-4 col-md-5 col-sm-8 text-black rounded">
                <h3>The Kelly Collection.</h3>
                <RouterLink class="collection-header" to="/collection/kelly">
                    <img src="../assets/images/collections/kelly-collection.jpg" alt="kelly image"
                        class="rounded img-fluid home-collection-img" />
                </RouterLink>
            </div>
        </div>

    </div>
</template>