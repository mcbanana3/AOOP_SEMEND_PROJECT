<!-- Navbar Section -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand text-white" href="index.jsp">Guntur MotorWays</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link text-white" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="cart.jsp">Cart</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="orders.jsp">Orders</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="privacy-policy.jsp">Register</a></li>
            </ul>
        </div>
    </div>
</nav>

<style>
    
    body {
    padding-top: 80px; /* Adjust this value to the height of your navbar */
}

/* For content sections, if you need more specific control */
.container {
    padding-top: 20px; /* Optional: Add more space if necessary */
}
    /* Navbar Styling */
    .navbar {
        background: linear-gradient(45deg, #bdc3c7, #2c3e50); /* Gradient background */
        padding-top: 10px;
        padding-bottom: 10px;
        z-index: 1000;
    }

    .navbar .navbar-brand {
        font-family: 'Roboto', sans-serif;
        font-weight: 700;
        font-size: 24px;
    }

    .navbar .nav-link {
        font-size: 16px;
        padding: 10px 15px;
    }

    .navbar .nav-link:hover {
        color: #ffcc00; /* Hover effect */
        transition: color 0.3s ease;
    }

    .navbar-toggler-icon {
        background-color: #fff; /* Toggler icon color */
    }

    /* Responsive Adjustments */
    @media (max-width: 767px) {
        .navbar-nav {
            text-align: center;
        }

        .navbar .nav-link {
            padding: 15px 20px;
        }
    }
</style>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
