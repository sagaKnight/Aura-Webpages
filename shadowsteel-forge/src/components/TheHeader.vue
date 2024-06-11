<template>
    <nav class="navbar navbar-expand-md container-fluid">
        <div class="container-fluid">
            <!-- Cart when small length -->
            <div class="d-md-none">
                <button class="btn" data-toggle="modal" data-target="#cartModal">
                    <i class="bi bi-bag"></i>
                </button>
            </div>

            <!-- Logo small length -->
            <div class="d-md-none">
                <RouterLink to="/" class="navbar-brand">Aura</RouterLink>
            </div>

            <!-- Logo medium length -->
            <div class="d-none d-sm-none d-md-block">
                <RouterLink to="/" class="navbar-brand">Aura</RouterLink>
            </div>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Releases
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                            <RouterLink to="/collection/von" class="dropdown-item">Von Collection</RouterLink>
                            <div class="dropdown-divider"></div>
                            <RouterLink to="/collection/adriane" class="dropdown-item">Adriane Collection</RouterLink>
                            <RouterLink to="/collection/sora" class="dropdown-item">Sora Collection</RouterLink>
                            <RouterLink to="/collection/stow" class="dropdown-item">Stow Collection</RouterLink>
                            <RouterLink to="/collection/kelly" class="dropdown-item">Kelly Collection</RouterLink>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            More
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                            <RouterLink to="/about" class="dropdown-item">About</RouterLink>
                            <RouterLink to="/sizing" class="dropdown-item">Sizing</RouterLink>
                            <RouterLink to="/shipping" class="dropdown-item">Shipping</RouterLink>
                            <RouterLink to="/login" class="dropdown-item">Staff Login</RouterLink>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Cart when medium -->
            <div class="d-none d-sm-none d-md-block">
                <button class="btn" data-toggle="modal" data-target="#cartModal">
                    <i class="bi bi-bag"></i>
                </button>
            </div>
        </div>
    </nav>
    <Cart></Cart>
</template>
