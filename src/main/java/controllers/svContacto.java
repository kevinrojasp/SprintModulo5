package controllers;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

/**
 * Servlet implementation class servlets.svContacto
 */
@WebServlet(name = "svContacto", value = "/svContacto")
public class svContacto extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svContacto() {
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
        // TODO Auto-generated method stub
        request.setAttribute("nombreSalida", request.getParameter("nombre"));
        request.setAttribute("apellidoSalida", request.getParameter("apellido"));
        request.setAttribute("telefonoSalida", request.getParameter("telefono"));
        request.setAttribute("emailSalida", request.getParameter("email"));
        System.out.println("Nombre:");
        System.out.println(request.getParameter("nombre"));
        System.out.println("Mensaje:");
        System.out.println(request.getParameter("mensaje"));
        String[] generos = request.getParameterValues("genero");

        if (generos != null) {
            for (String genero : generos) {
                request.setAttribute("sexoSalida", request.getParameter("genero"));
            }
        }
        mostrarAlerta3(request,response);
    }
    private void mostrarAlerta3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mensaje3 = "El formulario ha sido enviado.";
        request.setAttribute("mensajeAlerta3", mensaje3);
        RequestDispatcher rd = request.getRequestDispatcher("/contacto-mesa-ayuda.jsp");
        rd.forward(request, response);
    }
}
