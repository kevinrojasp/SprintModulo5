package controllers;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import impl.PagoDAOImpl;
import impl.UsuarioDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.Contenedor;
import models.Pago;
import models.Usuario;


@WebServlet(name = "svPago", value = "/svPago")
public class svPago extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svPago() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        PagoDAOImpl pagoDao = new PagoDAOImpl();
        Pago pago = new Pago(Integer.valueOf(request.getParameter("idCliente")), Float.valueOf(request.getParameter("montoPago")), ((String) request.getParameter("fechaPago")));

        if(pagoDao.registrar(pago)){
            Contenedor.agregarPago(pago);
            mostrarAlerta2(request,response);
        }


        // Agregar la capacitacion a la lista


    }
    private void mostrarAlerta2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mensaje2 = "Pago agregado.";
        request.setAttribute("mensajeAlerta2", mensaje2);
        RequestDispatcher rd = request.getRequestDispatcher("/crear-pago.jsp");
        rd.forward(request, response);
    }

    public static String convertirFecha(String fecha) {
        try {
            // Define el formato original y el formato deseado
            SimpleDateFormat formatoOriginal = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat formatoDeseado = new SimpleDateFormat("yyyy-MM-dd");

            // Convierte la cadena de fecha en un objeto Date usando el formato original
            Date fechaDate = formatoOriginal.parse(fecha);

            // Formatea nuevamente la fecha en el formato deseado
            String fechaNueva = formatoDeseado.format(fechaDate);

            return fechaNueva;
        } catch (ParseException e) {
            e.printStackTrace();
            // Manejar la excepción si la fecha no se puede analizar correctamente
            // En este caso, podrías devolver un valor predeterminado o lanzar una excepción personalizada según tus necesidades.
            return null;
        }
    }


}



