<%@ page import="models.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="impl.UsuarioDAOImpl" %>
<%@ include file="navegador.jsp" %>
<%@ include file="validarUsuarioAdministrativo.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/estilos-form.css">
<%
    UsuarioDAOImpl clientesDao = new UsuarioDAOImpl();
    List<Usuario> listadoClientes = clientesDao.listarUsuarios();
%>


<main>
    <div class="container d-flex justify-content-center align-items-center">
        <div class="ancho">
            <h1 class="h4 mb-4" style="color: rgb(7, 7, 92);">Creación de pagos</h1><br>
            <form class="text-center border border-light p-5" action="svPago" method="POST">
                <h5>Cliente</h5>
                <select class="form-select mx-auto" aria-label="Default select example" name="idCliente" style="width: 500px;">
                    <option selected>Seleccionar usuario</option>
                    <%
                        if (listadoClientes != null && !listadoClientes.isEmpty()) {
                            for (Usuario usuario : listadoClientes) {
                                if (usuario.getTipo().equals("Cliente")){
                    %>
                    <option value="<%= usuario.getId() %>" ><%= usuario.getNombre() %></option>
                    <%
                            }
                        }
                        }
                    %>
                </select>
                <h5>Monto</h5>
                <input type="text" class="form-control mb-4" placeholder="Ingrese monto del pago" name="montoPago" id="montoPago" style="width: 500px;"><br><br>
                <h5>Fecha de pago</h5>
                <input type="date" id="fecha" class="mt-4 form-control mx-auto text-center" name="fechaPago" style="width: 500px;" min="2023-01-01">
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                        crossorigin="anonymous"></script>
                <br><br>
                <!--<button class="button" type="submit" id="botonEnviar">Crear pago</button>-->
                <input type="submit" value="Crear pago">
            </form>


            <div id="contenedor-resultados">
                <% String mensajeAlerta2 = (String) request.getAttribute("mensajeAlerta2"); %>
                <% if (mensajeAlerta2 != null && !mensajeAlerta2.isEmpty()) { %>
                <script>
                    document.addEventListener('DOMContentLoaded',function () {
                        Swal.fire({
                            title: 'Pago creado con éxito',
                            text: 'Se ha agregado el pago a la base de datos.',
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        });
                    });
                </script>
                <% } %>
            </div>
        </div>
    </div>
</main>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>