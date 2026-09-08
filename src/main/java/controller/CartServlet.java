package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Product;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private Product getProduct(String code) {
        if ("8601".equals(code)) return new Product("8601", "86 (the band) - True Life Songs and Pictures", 14.95);
        if ("pf01".equals(code)) return new Product("pf01", "Paddlefoot - The first CD", 12.95);
        if ("pf02".equals(code)) return new Product("pf02", "Paddlefoot - The second CD", 14.95);
        if ("jr01".equals(code)) return new Product("jr01", "Joe Rut - Genuine Wood Grained Finish", 14.95);
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. LẤY SESSION TỪ REQUEST CỦA NGƯỜI DÙNG
        HttpSession session = request.getSession();
        
        // 2. TÌM GIỎ HÀNG TRONG SESSION
        Cart cart = (Cart) session.getAttribute("cart");
        
        // 3. NẾU CHƯA CÓ (LẦN ĐẦU VÀO TRANG), TẠO MỚI VÀ LƯU VÀO SESSION
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart); 
        }

        String action = request.getParameter("action");
        String code = request.getParameter("code");

        // 4. THAY ĐỔI DỮ LIỆU CỦA ĐỐI TƯỢNG CART (ĐÃ NẰM SẴN TRONG SESSION)
        if ("add".equals(action)) {
            Product p = getProduct(code);
            if (p != null) cart.addItem(p);
        } else if ("update".equals(action)) {
            int qty = Integer.parseInt(request.getParameter("quantity"));
            cart.updateQuantity(code, qty);
        } else if ("remove".equals(action)) {
            cart.removeItem(code);
        }

        // 5. ĐIỀU HƯỚNG MÀ VẪN GIỮ NGUYÊN ĐƯỢC SESSION
        if ("shop".equals(action)) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("cart.jsp");
        }
    }
}