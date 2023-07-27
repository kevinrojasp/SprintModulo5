
<%@ page import="java.util.List" %>
<%@ page import="models.Capacitacion" %>
<%@ include file="navegador.jsp"%>
<%@ include file="validarUsuarioCliente.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<main>
    <h1 class="h4 mb-4" style="color: rgb(7, 7, 92);">Crear Capacitación</h1><br>
    <div>
        <div>

            <%
                List<Capacitacion> lcapacitaciones = (List<Capacitacion>) request.getAttribute("lista-capacitaciones");
                if (lcapacitaciones != null && !lcapacitaciones.isEmpty()) { %>
            <table>
                <thead>
                <tr>
                    <th title="test">ID</th>
                    <th>Nombre</th>
                    <th>Detalle</th>
                </tr></thead>
                <%
                    for (Capacitacion capacitacion : lcapacitaciones) {
                %>
                <tbody>
                <tr>
                    <td data-column="ID"><%= capacitacion.getId() %></td>
                    <td data-column="Nombre"><%= capacitacion.getNombre() %></td>
                    <td data-column="Detalle"><%= capacitacion.getDetalle() %></td>
                </tr>
                <%
                    }
                } else {
                %>
                <form action="svListarCapacitaciones" method="post"><button style="background-color: grey; border-color: darkgrey; font-size: 18px" type="submit"><a>
                    <div class="option">
                        <h4 style="text-align: left">Listar Capacitaciones</h4>
                    </div>
                </a></button></form>
                <%
                    }
                %></tbody>
            </table>
        </div>
    </div>

</main>
<script src="js/script.js"></script>



</body>

</html>