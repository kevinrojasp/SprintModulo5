<%@ include file="navegador.jsp" %>
<%@ include file="validarUsuarioAdministrativo.jsp"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<main>
    <h1>Administrador de chequeos Aseelec</h1><br>
    <h2>Bienvenido, <%= session.getAttribute("username") %></h2>
</main>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="js/script.js"></script>
</body>
</html>

