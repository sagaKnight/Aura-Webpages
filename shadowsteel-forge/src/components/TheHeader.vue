<template>
    <nav class="navbar navbar-expand-md">
        <RouterLink to="/" class="navbar-brand mx-3" href="#">Aura</RouterLink>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <RouterLink to="/" class="nav-link">Home</RouterLink>
                </li>
                <li class="nav-item">
                    <RouterLink to="/about" class="nav-link">About</RouterLink>
                </li>
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
                        <RouterLink to="/sizing" class="dropdown-item">Sizing</RouterLink>
                        <RouterLink to="/shipping" class="dropdown-item">Shipping</RouterLink>
                    </div>
                </li>
                <li class="nav-item">
                    <RouterLink to="/login" class="nav-link">Staff Login</RouterLink>
                </li>
            </ul>
        </div>
    </nav>
</template>
