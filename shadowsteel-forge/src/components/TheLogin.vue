<template>
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-6 mx-auto mt-3">
                <h1>Login.</h1>
                <form class="mt-3">
                    <div class="login-form">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter Username" autocomplete="off">
                    </div>
                    <div class="login-form">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter Password">
                    </div>
                        <!-- Change this to a proper submit button -->
                        <RouterLink to="/manager" class="btn btn-secondary mt-2">Submit</RouterLink>
                </form>
            </div>
        </div>
    </div>
</template>