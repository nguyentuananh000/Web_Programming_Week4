<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        h2 { color: teal; font-size: 1.5em; margin-bottom: 10px; }
        table { border-collapse: collapse; width: 700px; margin-bottom: 15px;}
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        input[type="number"] { width: 50px; }
    </style>
</head>
<body>
    <h2>Your cart</h2>
    <table>
        <tr>
            <th>Quantity</th>
            <th>Description</th>
            <th>Price</th>
            <th>Amount</th>
            <th></th>
        </tr>
        
        <!-- JSTL sẽ tự động lấy đối tượng "cart" từ HttpSession -->
        <c:forEach var="item" items="${cart.items}">
            <tr>
                <td>
                    <form action="cart" method="post" style="margin: 0;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="code" value="${item.product.code}">
                        <input type="number" name="quantity" value="${item.quantity}">
                        <input type="submit" value="Update">
                    </form>
                </td>
                <td>${item.product.description}</td>
                <td>${item.product.priceFormat}</td>
                <td>${item.totalFormat}</td>
                <td>
                    <form action="cart" method="post" style="margin: 0;">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="code" value="${item.product.code}">
                        <input type="submit" value="Remove Item">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <p><b>To change the quantity</b>, enter the new quantity and click on the Update button.</p>

    <form action="cart" method="post" style="display:inline;">
        <input type="hidden" name="action" value="shop">
        <input type="submit" value="Continue Shopping">
    </form>
    
    <form action="checkout.jsp" method="post" style="display:inline;">
        <input type="submit" value="Checkout">
    </form>
</body>
</html>