<%@ page import="com.ecommerce.connection.DbCon" %>
<%@ page import="com.ecommerce.dao.ProductDao" %>
<%@ page import="com.ecommerce.model.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%
    // Get the authenticated user from the session
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }

    // Create a ProductDao instance and fetch the list of all products from the database
    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();

    // Filter the products by the "Sport" category
    List<Product> sportProducts = new ArrayList<>();
    if (products != null && !products.isEmpty()) {
        for (Product p : products) {
            if ("Helmet".equalsIgnoreCase(p.getCategory())) {
                sportProducts.add(p);
            }
        }
    }

    // Get the cart list from the session (if it exists)
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/includes/head.jsp" %>
    <title>E-Commerce - Scooter Products</title>
</head>
<body>
    <%@ include file="/includes/navbar.jsp" %>
    
    <section class="banner1 bg-image text-black text-center py-50">
    <div class="container">
    </div>
</section>
    
    <div class="container">
        <div class="card-header my-3 text-center bg-dark text-primary">Scooters</div>
        <div class="row">
            <%
                // Check if there are sport products available
                if (sportProducts != null && !sportProducts.isEmpty()) {
                    for (Product p : sportProducts) {
            %>
            <div class="col-md-3 my-3">
                <div class="card product-card">
                    <!-- Image Source dynamically pulled from the product-image folder -->
                    <img class="card-img-top product-img" src="product-image/<%= p.getImage() %>" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title text-center"><%= p.getName() %></h5>
                        <h6 class="price text-center">Price: $<%= p.getPrice() %></h6>
                        <h6 class="category text-center">Category: <%= p.getCategory() %></h6>
                        <div class="mt-3 d-flex justify-content-center">
                            <a class="btn btn-dark mr-2" href="add-to-cart?id=<%= p.getId() %>">Add to Cart</a>
                            <a class="btn btn-primary" href="./order-confirmation.jsp">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
                    out.println("There are no products available in the Helmets category.");
                }
            %>
        </div>
    </div>

    <style>
        /* Card Styling */
        .product-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Card Image */
        .product-img {
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }

        /* Card Title */
        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }

        .promo-banner {
            margin-top: 20px;
            background-color: #ffce00;
            padding: 15px;
            font-size: 1.2em;
            color: #333;
            font-weight: bold;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transition: background-color 0.3s ease;
        }
        
        .banner1 {
        background: url('https://shop.yamaha-motor-india.com/cdn/shop/collections/Helmet_1400x_350cf969-cf41-41f6-b944-5c22acf539da_1800x.png?v=1608561304') no-repeat center center;
        background-size: cover; /* Ensure the image covers the entire section */
        color: black;  /* Set text color to black */
        padding: 200px 0;
        text-align: center;
    }

        .promo-banner:hover {
            background-color: #ffb300;
        }

        /* Price and Category */
        .price, .category {
            font-size: 1rem;
            color: #666;
        }

        /* Card Body */
        .card-body {
            padding: 20px;
        }

        /* Button Styling */
        .btn {
            font-size: 1rem;
            padding: 8px 16px;
            text-transform: uppercase;
            width: 100%;
        }

        .btn-dark, .btn-primary {
            transition: background-color 0.3s ease;
        }

        .btn-dark:hover {
            background-color: #343a40;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Align buttons properly */
        .d-flex {
            gap: 10px;
        }

        .row {
            margin-left: 0;
            margin-right: 0;
        }

        /* Header Styling */
        .card-header {
            font-size: 1.5rem;
            font-weight: bold;
            text-transform: uppercase;
            background-color: #ffce00;
            letter-spacing: 1px;
        }
    </style>

    <%@ include file="/includes/footer.jsp" %>
</body>
</html>
