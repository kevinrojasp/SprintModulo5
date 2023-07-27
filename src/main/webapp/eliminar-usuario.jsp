
<%@ page import="models.Usuario" %>
<%@ page import="impl.UsuarioDAOImpl" %>
<%@ include file="navegador.jsp"%>
<%@ include file="validarUsuarioAdministrativo.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/estilos-form.css">
<main>

    <h1>Eliminar Usuario</h1><br><br>

    <%-- Obtener el ID del usuario de la URL --%>
    <% String idUsuario = request.getParameter("id"); %>

    <%
        // Ejemplo de obtención de información del usuario para edición (debes reemplazar esto con tu lógica de base de datos)
        UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl();
        Usuario usuario = usuarioDAO.modificarUsuario(Integer.parseInt(idUsuario));
        if (usuario.getId() != 0 && usuario.getNombre()!=null && usuario.getTipo()!=null) {
    %>
    <form action="svEliminarUsuario" method="post">
        <input type="hidden" name="idUsuario" value="<%= usuario.getId() %>">
        <label>Nombre de usuario</label><br>
        <input type="text" name="nombreUsuario" value="<%= usuario.getNombre() %>" disabled><br><br>
        <label>Tipo de usuario</label><br>
        <input type="text" name="tipoUsuario" value="<%= usuario.getTipo() %>" disabled><br><br>
        <label>Contraseña</label><br>
        <input type="password" name="password" value="<%= usuario.getPass() %>" disabled><br><br>
        <input type="submit" value="Eliminar usuario">
    </form>

    <% } else { %>
    <p>El usuario no existe o no se pudo encontrar.</p>
    <% } %>


</main>
<script src="js/script.js"></script>



</body>

</html>