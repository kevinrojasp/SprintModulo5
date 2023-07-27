
<%@ page import="java.util.List" %>
<%@ page import="models.Usuario" %>
<%@ page import="models.Pago" %>
<%@ page import="dto.DetallePagoDTO" %>
<%@ include file="navegador.jsp"%>
<%@ include file="validarUsuarioAdministrativo.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<main>
  <h1 class="h4 mb-4" style="color: rgb(7, 7, 92);">Listado de pagos</h1><br>
  <div>
    <div>
      <%
        List<DetallePagoDTO> lpagos = (List<DetallePagoDTO>) request.getAttribute("lista-pagos");
        if (lpagos != null && !lpagos.isEmpty()) { %>
      <table>
        <thead>
        <tr>
          <th>ID</th>
          <th>NOMBRE CLIENTE</th>
          <th>MONTO</th>
          <th>FECHA PAGO</th>
        </tr></thead>
        <%
          for (DetallePagoDTO pago : lpagos) {
        %>
        <tbody>
        <tr>
          <td data-column="ID"><%= pago.getId() %></td>
          <td data-column="Nombre Cliente"><%= pago.getNombreCliente() %></td>
          <td data-column="Monto"><%= pago.getMontoPago() %></td>
          <td data-column="Fecha"><%= pago.getFechaPago() %></td>
        </tr>
        <%
          }
        } else {
        %>
        <form action="svListarPagos" method="post"><button style="background-color: grey; border-color: darkgrey; font-size: 18px" type="submit"><a>
          <div class="option">
            <h4 style="text-align: left">Listar pagos</h4>
          </div>7
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