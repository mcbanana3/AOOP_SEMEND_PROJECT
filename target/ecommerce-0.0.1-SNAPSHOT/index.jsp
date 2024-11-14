<%@page import="com.ecommerce.connection.DbCon"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.ecommerce.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
    // Get the authenticated user from the session
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }

    // Create a ProductDao instance and fetch the list of products from the database
    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();

    // Get the cart list from the session (if it exists)
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>E-Commerce Cart</title>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
    <%@include file="/includes/hero.jsp"%>    
    
    <div class="promo-banner text-center my-4">
    <strong>? Special Offer!</strong> Get 20% off on your first purchase! Use code: <strong>WELCOME20 ?</strong>
</div>
    
            <%@include file="./includes/motorcycle_banner.jsp"%>
            <br>
            <%@include file="./includes/scooter_banner.jsp"%>
            <br>                        
            <%@include file="./includes/helmets_banner.jsp"%>
            <br>
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
        width: 100%; /* Make buttons take full width */
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
        gap: 10px; /* Add gap between buttons */
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
        letter-spacing: 1px;
    }
</style>

    
    <%@include file="/includes/footer.jsp"%>
</body>
</html>
