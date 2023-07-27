
<%@include file="navegador.jsp"%>
<%@include file="validarUsuarioCliente.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/estilos-form.css">
<!-- Contenedor principal -->
<div class="container">
  <!-- Primera columna -->
  <div class="column" style="order: 1;">
    <form class="text-center border border-light p-5" action="svContacto" method="POST">
      <h1 class="h4 mb-4" style="color: rgb(7, 7, 92);">Contacto mesa de ayuda</h1><br>
      <h5>Nombre:</h5>
      <input type="text" id="lname" name="nombre" placeholder="Ingrese su nombre"name="nombre" style="width:500px"><br><br>
      <h5>Mensaje</h5>
      <textarea id="subject" placeholder="Mensaje" name="mensaje" style="width:500px;height:200px"></textarea><br><br>
      <!-- Sign in button -->
      <input type="submit" value="Enviar mensaje">
      <!-- <button class="button" type="submit">Enviar mensaje</button> -->
    </form>
    <div id="contenedor-resultados">
      <% String mensajeAlerta3 = (String) request.getAttribute("mensajeAlerta3"); %>
      <% if (mensajeAlerta3 != null && !mensajeAlerta3.isEmpty()) { %>
      <script>
        document.addEventListener('DOMContentLoaded',function () {
          Swal.fire({
            title: 'Su mensaje ha sido enviado exitosamente',
            text: 'Pronto lo ayudaremos.',
            icon: 'success',
            confirmButtonText: 'Aceptar'
          });
        });
      </script>
      <% } %>
    </div>
  </div>

</div>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>