<template>
    <div class="container-fluid p-3 position-relative">
        <div class="row d-flex justify-content-center">
            <div class="col-12 col-xl-9 col-lg-10 col-md-11 col-sm-12">
                <RouterLink to="/">
                    <img src="../assets/images/collections/von-collection.jpg" alt="main collection image"
                        class="on-display-image rounded" />
                </RouterLink>
            </div>
        </div>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-5 col-sm-5 text-end position-absolute
            bg-white p-3 rounded top-50 start-0 translate-middle-y">
                <h1>The Von Collection.</h1>
                <h4>Releasing Internationally.</h4>
                <h6>Raffle Entry Only.</h6>
                <RouterLink to="/" class="btn btn-dark mx-auto col-12 col-sm-6">Find Out More.</RouterLink>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row d-flex justify-content-center mt-3">
            <div class="col-6 col-xl-4 col-lg-4 col-md-5 text-center bg-dark text-white rounded">
                <h1>Previous Releases</h1>
            </div>
        </div>
        <div class="row text-white p-2 d-flex justify-content-center">
            <div class="col-5 col-xl-4 col-lg-4 col-md-5 col-sm-5 p-1 text-black rounded mx-1">
                <RouterLink class="collection-header" to="/">
                    <h3>The Michael Collection.</h3>
                    <img src="../assets/images/collections/mike-collection.jpg" alt="michael image" class="rounded" />
                </RouterLink>
            </div>
        <div class="col-5 col-xl-4 col-lg-4 p-1 col-md-5 col-sm-5 text-black rounded mx-1">
                <RouterLink class="collection-header" to="/">
                    <h3>The Stow Collection.</h3>
                    <img src="../assets/images/collections/stow-collection.jpg" alt="stow image" class="rounded" />
                </RouterLink>
            </div>
        </div>
        <div class="row text-white p-2 d-flex justify-content-center">
        <div class="col-5 col-xl-4 col-lg-4 p-1 col-md-5 col-sm-5 text-black rounded mx-1">
                <RouterLink class="collection-header" to="/">
                    <h3>The Adriane Collection.</h3>
                    <img src="../assets/images/collections/adriane-collection.jpg" alt="stow image" class="rounded" />
                </RouterLink>
            </div>
        </div>
    </div>
</template>
    