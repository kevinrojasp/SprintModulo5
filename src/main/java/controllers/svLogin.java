package controllers;

import dao.Conexion;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;


@WebServlet(name = "svLogin", value = "/svLogin")
public class svLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HttpSession session;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svLogin() {
        super();
        // TODO Auto-generated constructor st

    }
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            String userType = validateUser(username, password);
            if (userType != null) {
                if (userType.equals("Cliente")) {
                    session = request.getSession();
                    session.setAttribute("username",request.getParameter("username"));
                    session.setAttribute("tipo","Cliente");
                    RequestDispatcher rd = request.getRequestDispatcher("/dashboard.jsp");
                    rd.forward(request, response);
                } else if (userType.equals("Profesional")) {
                    session = request.getSession();
                    session.setAttribute("username",request.getParameter("username"));
                    session.setAttribute("tipo","Profesional");
                    RequestDispatcher rd = request.getRequestDispatcher("/dashboard.jsp");
                    rd.forward(request, response);
                } else {
                    session = request.getSession();
                    session.setAttribute("username",request.getParameter("username"));
                    session.setAttribute("tipo","Administrativo");
                    RequestDispatcher rd = request.getRequestDispatcher("/dashboard.jsp");
                    rd.forward(request, response);
                }
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
        }

    private String validateUser(String username, String password) {
        try {
            Connection con = null;
            con = Conexion.conectar();
            String sql = "SELECT tipo FROM usuarios WHERE nombre = ? AND pass = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            String userType = null;
            if (rs.next()) {
                userType = rs.getString("tipo");
            }
            rs.close();
            stmt.close();
            con.close();
            return userType;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
