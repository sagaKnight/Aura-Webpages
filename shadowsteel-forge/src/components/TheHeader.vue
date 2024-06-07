<template>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <RouterLink to="/" class="navbar-brand" href="#">Aura</RouterLink>
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
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Releases
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <RouterLink to="/collection/adriane" class="dropdown-item">Adriane</RouterLink>
                        <RouterLink to="/collection/mike" class="dropdown-item">Mike</RouterLink>
                        <RouterLink to="/collection/stow" class="dropdown-item">Stow</RouterLink>
                        <RouterLink to="/collection/vow" class="dropdown-item">Vow</RouterLink>
                        <RouterLink to="/collection/kelly" class="dropdown-item">Kelly</RouterLink>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item ms-auto">
                    <RouterLink to="/login" class="nav-link">Staff Login</RouterLink>
                </li>
            </ul>
        </div>
    </nav>
</template>