<%@page import="java.text.DecimalFormat"%>
<%@page import="com.ecommerce.dao.OrderDao"%>
<%@page import="com.ecommerce.connection.DbCon"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.ecommerce.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("person", auth);
        OrderDao orderDao  = new OrderDao(DbCon.getConnection());
        orders = orderDao.userOrders(auth.getId());
    } else {
        response.sendRedirect("login.jsp");
    }

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>E-Commerce Order Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
    <div class="container">
        <div class="card-header my-3">All Orders</div>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Date</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    if (orders != null) {
                        for (Order o : orders) { 
                %>
                            <tr>
                                <td><%= o.getDate() %></td>
                                <td><%= o.getName() %></td>
                                <td><%= o.getCategory() %></td>
                                <td><%= o.getQunatity() %></td>
                                <td><%= dcf.format(o.getPrice()) %></td>
                                <td><button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#cancelModal" data-order-id="<%= o.getOrderId() %>">Cancel Order</button></td>
                            </tr>
                <% 
                        } 
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Modal for confirmation -->
    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cancelModalLabel">Confirm Order Cancellation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to cancel this order?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <a id="cancelOrderBtn" class="btn btn-danger" href="#">Yes, Cancel Order</a>
                </div>
            </div>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Set up the cancel order modal with the correct URL based on the button clicked
        $('#cancelModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var orderId = button.data('order-id'); // Extract the order ID from the data-* attributes
            var modal = $(this);
            var cancelButton = modal.find('#cancelOrderBtn');
            cancelButton.attr('href', 'cancel-order?id=' + orderId); // Set the link to cancel the order
        });
    </script>
</body>
</html>
