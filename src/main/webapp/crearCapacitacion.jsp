
<%@ include file="navegador.jsp"%>
<%@ include file="validarUsuarioCliente.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/estilos-form.css">
<main>
    <div class="container d-flex justify-content-center align-items-center">
        <div class="ancho">
            <form class="text-center border border-light p-5" action="svCrearCapacitacion" method="POST">

                <h1 class="h4 mb-4" style="color: rgb(7, 7, 92);">Crear Capacitación</h1><br>

                <h5>Nombre capacitacion</h5>
                <input type="text" class="form-control mb-4" placeholder="Nombre capacitación"
                       name="nombreCapacitacion" style="width: 500px"><br><br>
                <h5>Detalle</h5>
                <textarea type="text" class="form-control mb-4" placeholder="Ingrese detalle capacitación" name="detalle" style="width: 500px;height: 200px"></textarea><br><br>

                </select><br><br>
                <!-- Sign in button -->
                <button class="button" type="submit">Crear capacitación</button>
            </form>
            <div id="contenedor-resultados">


                <% String mensajeAlerta2 = (String) request.getAttribute("mensajeAlerta2"); %>
                <% if (mensajeAlerta2 != null && !mensajeAlerta2.isEmpty()) { %>

                <script>
                    document.addEventListener('DOMContentLoaded',function () {
                        Swal.fire({
                            title: 'Capacitación creada con éxito',
                            text: 'Se ha agregado la capacitación la base de datos.',
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