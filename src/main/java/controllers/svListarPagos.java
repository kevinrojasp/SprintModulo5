package controllers;

import java.io.*;
import java.util.List;

import dto.DetallePagoDTO;
import impl.CapacitacionDAOImpl;
import impl.DetallePagoDAOImpl;
import impl.PagoDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.Capacitacion;
import models.Pago;

/**
 * Servlet implementation class servlets.svContacto
 */
@WebServlet(name = "svListarPagos", value = "/svListarPagos")
public class svListarPagos extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svListarPagos() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DetallePagoDAOImpl detallePagoDAO = new DetallePagoDAOImpl();

        List<DetallePagoDTO> detallePago = detallePagoDAO.listadoDetallePago();
        if (!detallePago.isEmpty()) {
            request.setAttribute("lista-pagos", detallePago);
            request.getRequestDispatcher("listado-pagos.jsp").forward(request, response);
        }
    }
}
