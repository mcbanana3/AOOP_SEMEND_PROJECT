<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/includes/head.jsp" %>
    <title>Order Confirmation</title>
    <style>
        /* Centering content */
        .container {
            text-align: center;
            padding: 50px;
        }

        .thank-you-message {
            font-size: 2rem;
            font-weight: bold;
            margin: 30px 0;
            color: #333;
        }

        .thank-you-image {
            width: 50%;
            height: auto;
            margin-bottom: 20px;
        }

        .btn {
            font-size: 1rem;
            padding: 12px 20px;
            text-transform: uppercase;
            border-radius: 5px;
            margin: 10px;
            text-decoration: none;
            display: inline-block;
        }

        .btn-home {
            background-color: #28a745;
            color: white;
        }

        .btn-home:hover {
            background-color: #218838;
        }

        .btn-orders {
            background-color: #007bff;
            color: white;
        }

        .btn-orders:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%@ include file="/includes/navbar.jsp" %>

    <div class="container">
        <img src="dec_images/thank-you.jpeg" alt="Thank You" class="thank-you-image">
        <div class="thank-you-message">
            Thank you for shopping with us!
        </div>

        <a href="index.jsp" class="btn btn-home">Go to Home</a>
        <a href="orders.jsp" class="btn btn-orders">View Your Orders</a>
    </div>

    <%@ include file="/includes/footer.jsp" %>
</body>
</html>
