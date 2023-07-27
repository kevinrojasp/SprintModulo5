
<%@ page import="java.util.List" %>
<%@ page import="models.Usuario" %>
<%@ include file="navegador.jsp"%>
<%@ include file="validarUsuarioAdministrativo.jsp"%>



<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<main>

    <div>
        <div>

            <%
                List<Usuario> lusuario = (List<Usuario>) request.getAttribute("lista-usuarios");
                if (lusuario != null && !lusuario.isEmpty()) { %>
            <h2> Filtros de búsqueda</h2>
            <form id="searchForm" align="center">
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" placeholder="Ingrese ID">

                <label for="nombre">Nombre de usuario:</label>
                <input type="text" id="nombre" name="nombre" placeholder="Ingrese nombre">

                <label for="tipo">Tipo de usuario:</label>
                <input type="text" id="tipo" name="tipo" placeholder="Ingrese tipo">

                <button type="button" onclick="filtrarTabla()">Buscar</button>
            </form>


            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre de usuario</th>
                    <th>Tipo de usuario</th>
                    <th>Contraseña</th>
                    <th>Editar</th>
                    <th>Eliminar</th>

                </tr></thead>
                <%
                    for (Usuario usuario : lusuario) {
                %>
                <tbody>
                <tr>
                    <td data-column="ID"><%= usuario.getId() %></td>
                    <td data-column="Nombre"><%= usuario.getNombre() %></td>
                    <td data-column="Tipo"><%= usuario.getTipo() %></td>
                    <td data-column="Pass">[OCULTA]</td>
                    <td data-column="Editar"><a href="editarUsuario.jsp?id=<%= usuario.getId() %>"><i class="fa-solid fa-pencil"></i></a></td>
                    <td data-column="Eliminar"><a href="eliminar-usuario.jsp?id=<%= usuario.getId() %>"><i class="fa-solid fa-trash"></i></a></td>
                </tr>
                <%
                    }
                } else {
                %>
                <form action="svListarUsuarios" method="post"><button style="background-color: grey; border-color: darkgrey; font-size: 18px" type="submit"><a>
                    <div class="option">
                        <h4 style="text-align: left">Listar usuarios</h4>
                    </div>
                </a></button></form>
                <%
                    }
                %></tbody>
            </table>
        </div>
    </div>

    <script>
        function filtrarTabla() {
            // Obtener los valores ingresados en los campos de búsqueda
            var id = document.getElementById("id").value.toLowerCase();
            var nombre = document.getElementById("nombre").value.toLowerCase();
            var tipo = document.getElementById("tipo").value.toLowerCase();

            // Obtener todas las filas de la tabla
            var filas = document.querySelectorAll("tbody tr");

            // Iterar sobre las filas y mostrar solo aquellas que coincidan con los criterios de búsqueda
            for (var i = 0; i < filas.length; i++) {
                var fila = filas[i];
                var columnaId = fila.querySelector("[data-column='ID']").textContent.toLowerCase();
                var columnaNombre = fila.querySelector("[data-column='Nombre de usuario']").textContent.toLowerCase();
                var columnaTipo = fila.querySelector("[data-column='Tipo de usuario']").textContent.toLowerCase();

                if (
                    (id === "" || columnaId.includes(id)) &&
                    (nombre === "" || columnaNombre.includes(nombre)) &&
                    (tipo === "" || columnaTipo.includes(tipo))
                ) {
                    fila.style.display = ""; // Mostrar la fila si coincide con los criterios
                } else {
                    fila.style.display = "none"; // Ocultar la fila si no coincide
                }
            }
        }
    </script>

</main>
<script src="js/script.js"></script>



</body>

</html>