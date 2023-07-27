<%@ include file="ayuda.jsp" %>
<% session = request.getSession();
if(session.getAttribute("username")!=null){
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sprint Modulo 5 - Grupo 1</title>
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
</head>

<body id="body">
<!-- SweetAlert si la sesión no es válida -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        <%-- Verifica si no hay sesión o el atributo "user" es nulo --%>
        <% if (session == null || session.getAttribute("username") == null) { %>
        Swal.fire({
            icon: 'error',
            title: 'No hay sesión activa...',
            text: 'Debe iniciar sesión para acceder a esta página.'
        }).then(function() {
            window.location.href = 'index.jsp';
        });
        <% } %>
    });
</script>
<header>
    <div class="icon__menu">
        <i class="fas fa-bars" id="btn_open"></i>
    </div>
</header>
    <%
    if(session.getAttribute("tipo").equals("Cliente") && session!=null){
%>

<!-- NAVEGADOR CLIENTE -->
<div class="menu__side" id="menu_side">
    <div class="name__page">
        <a class="navbar-brand" href="#">
            <img class="logo" src="images/logo.png" alt="">
        </a>
        <h4>Aseelec</h4>
    </div>
    <div class="options__menu">
        <a href="dashboard.jsp">
            <div class="option">
                <i class="fas fa-home" title="Inicio"></i>
                <h4>Inicio</h4>
            </div>
        </a>
        <a href="contacto-mesa-ayuda.jsp">
            <div class="option">
                <i class="fa-solid fa-info" title="Contacto mesa de ayuda"></i>
                <h4>Contacto mesa de ayuda</h4>
            </div>
        </a>
        <a href="crearCapacitacion.jsp">
            <div class="option">
                <i class="fa-solid fa-plus" title="Crear capacitacion"></i>
                <h4>Crear capacitacion</h4>
            </div>
        </a>
        <form action="svListarCapacitaciones" method="post"><button style="background-color: transparent; border-color: transparent; font-size: 18px" type="submit"><a>
            <div class="option">
                <i class="fa-solid fa-list" style="width:20px;margin-right:20px; cursor: pointer" title="Listar capacitaciones"></i>
                <h4 style="text-align: left">Listar Capacitaciones</h4>
            </div>
        </a></button></form>
        <a href="administrar-asistentes.jsp">
            <div class="option">
                <i class="fa-solid fa-user-gear" title="Administrar asistentes "></i>
                <h4>Administrar asistentes</h4>
            </div>
        </a>
        <a href="gestionar-accidentes.jsp">
            <div class="option">
                <i class="fa-solid fa-person-falling-burst" title="Gestionar accidentes "></i>
                <h4>Gestionar accidentes</h4>
            </div>
        </a>
        <form action="svCerrarSesion" method="post"><button style="background-color: transparent; border-color: transparent; font-size: 18px" type="submit"><a>
            <div class="option">
                <i class="fa-solid fa-right-from-bracket fa-rotate-180" style="width:20px;margin-right:20px; cursor: pointer" title="Cerrar sesion"></i>
                <h4>Cerrar sesion</h4>
            </div>
        </a></button></form>
    </div>
</div>

<!-- NAVEGADOR ADMINISTRATIVO -->
<% }else if(session.getAttribute("tipo").equals("Administrativo")) { %>
<div class="menu__side" id="menu_side">
    <div class="name__page">
        <a class="navbar-brand" href="#">
            <img class="logo" src="images/logo.png" alt="">
        </a>
        <h4>Aseelec</h4>
    </div>
    <div class="options__menu">
        <a href="dashboard.jsp">
            <div class="option">
                <i class="fas fa-home" title="Inicio"></i>
                <h4>Inicio</h4>
            </div>
        </a>
        <a href="crear-usuario.jsp">
            <div class="option">
                <i class="fa-solid fa-plus" title="Crear usuario"></i>
                <h4>Crear usuario</h4>
            </div>
        </a>
        <form action="svListarUsuarios" method="post"><button style="background-color: transparent; border-color: transparent; font-size: 18px" type="submit"><a>
            <div class="option">
                <i class="fa-solid fa-list" style="width:20px;margin-right:20px; cursor: pointer" title="Listar usuarios"></i>
                <h4 style="text-align: left">Listar usuarios</h4>
            </div>
        </a></button></form>
        <a href="crear-pago.jsp">
            <div class="option">
                <i class="fa-solid fa-money-bill" title="Crear pago"></i>
                <h4>Crear pago</h4>
            </div>
        </a>
        <form action="svListarPagos" method="post"><button style="background-color: transparent; border-color: transparent; font-size: 18px" type="submit"><a>
            <div class="option">
                <i class="fa-solid fa-list" style="width:20px;margin-right:20px; cursor: pointer" title="Listar pagos"></i>
                <h4 style="text-align: left">Listar pagos</h4>
            </div>
        </a></button></form>
        <a href="administrar-chequeo.jsp">
            <div class="option">
                <i class="fa-solid fa-list-check" title="Administrar chequeo"></i>
                <h4>Administrar chequeo</h4>
            </div>
        </a>
        <form action="svCerrarSesion" method="post"><button style="background-color: transparent; border-color: transparent; font-size: 18px" type="submit"><a>
            <div class="option">
                <i class="fa-solid fa-right-from-bracket fa-rotate-180" style="width:20px;margin-right:20px; cursor: pointer" title="Cerrar sesion"></i>
                <h4>Cerrar sesion</h4>
            </div>
        </a></button></form>
    </div>
</div>

<!-- NAVEGADOR PROFESIONAL -->
<%} else if(session.getAttribute("tipo").equals("Profesional")) {%>
<div class="menu__side" id="menu_side">
    <div class="name__page">
        <a class="navbar-brand" href="#">
            <img class="logo" src="images/logo.png" alt="">
        </a>
        <h4>Aseelec</h4>
    </div>
    <div class="options__menu">
        <a href="dashboard.jsp">
            <div class="option">
                <i class="fas fa-home" title="Inicio"></i>
                <h4>Inicio</h4>
            </div>
        </a>
        <a href="listado-visitas.jsp">
            <div class="option">
                <i class="fa-solid fa-list" style="width:20px;margin-right:20px; cursor: pointer" title="Listar visitas"></i>
                <h4 style="text-align: left">Listar visitas</h4>
            </div>
        </a>
        <a href="responder-checklist.jsp">
            <div class="option">
                <i class="fa-solid fa-list-check" title="Responder checklist"></i>
                <h4>Responder checklist</h4>
            </div>
        </a>
        <a href="crear-asesoria.jsp">
            <div class="option">
                <i class="fa-solid fa-plus" title="Crear asesoría"></i>
                <h4>Crear asesoría</h4>
            </div>
        </a>
        <a href="listado-asesorias.jsp">
            <div class="option">
                <i class="fa-solid fa-list" style="width:20px;margin-right:20px; cursor: pointer" title="Listar asesorias"></i>
                <h4 style="text-align: left">Listar asesorias</h4>
            </div>
        </a>
        <a href="reportes.jsp">
            <div class="option">
                <i class="fa-regular fa-clipboard" title="Reportes"></i>
                <h4>Reportes</h4>
            </div>
        </a>
        <form action="svCerrarSesion" method="post"><button style="background-color: transparent; border-color: transparent; font-size: 18px" type="submit"><a>
            <div class="option">
                <i class="fa-solid fa-right-from-bracket fa-rotate-180" style="width:20px;margin-right:20px; cursor: pointer" title="Cerrar sesion"></i>
                <h4>Cerrar sesion</h4>
            </div>
        </a></button></form>
    </div>
</div>
<%} else{
    response.sendRedirect("index.jsp");
  }
    }
%>
