<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CD List</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        h2 { color: teal; font-size: 1.5em; margin-bottom: 10px; }
        table { border-collapse: collapse; width: 600px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
    </style>
</head>
<body>
    <h2>CD list</h2>
    <table>
        <tr><th>Description</th><th>Price</th><th></th></tr>
        <tr>
            <td>86 (the band) - True Life Songs and Pictures</td><td>$14.95</td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="code" value="8601">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
        <tr>
            <td>Paddlefoot - The first CD</td><td>$12.95</td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="code" value="pf01">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
        <tr>
            <td>Paddlefoot - The second CD</td><td>$14.95</td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="code" value="pf02">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
        <tr>
            <td>Joe Rut - Genuine Wood Grained Finish</td><td>$14.95</td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="code" value="jr01">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
    </table>
</body>
</html>