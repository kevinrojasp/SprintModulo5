<%@ include file="navegador.jsp" %>
<%@ include file="validarUsuarioAdministrativo.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/estilos-form.css">
<main>
    <div class="container d-flex justify-content-center align-items-center">
        <div class="ancho">
            <form class="text-center border border-light p-5" action="svCrearUsuario" method="POST">

                <h1 class="h4 mb-4" style="color: rgb(7, 7, 92);">Creación de usuarios</h1><br>

                <h5>Tipo de usuario</h5>
                <div>
                    <input type="radio" id="cliente" name="tipoUsuario" value="Cliente" checked>
                    <label for="cliente">Cliente</label>
                </div>
                <div>
                    <input type="radio" id="administrativo" name="tipoUsuario" value="Administrativo">
                    <label for="administrativo">Administrativo</label>
                </div>
                <div>
                    <input type="radio" id="profesional" name="tipoUsuario" value="Profesional">
                    <label for="profesional">Profesional</label>
                </div>
                <br>

                <h5>Nombre de usuario</h5>
                <input type="text" class="form-control mb-4" placeholder="Ingrese nombre de usuario" name="nombreUsuario" id="nombreUsuario" style="width: 500px"><br>
                <p id="mensajeAlerta2" style="display: none; color: red;">Nombre de usuario no disponible</p><br>

                <h5>Contraseña</h5>
                <div style="position: relative;">
                    <input type="password" class="form-control mb-4" placeholder="Ingrese contraseña" name="password" id="password" style="width: 500px">
                    <input type="checkbox" id="verContrasenas">
                    <label for="verContrasenas" style="cursor: pointer;">Ver contraseñas</label>
                </div><br><br>

                <h5>Reingresar contraseña</h5>
                <div style="position: relative;">
                    <input type="password" class="form-control mb-4" placeholder="Reingrese contraseña" id="repassword" style="width: 500px">
                    <input type="checkbox" id="verReContrasenas">
                    <label for="verReContrasenas" style="cursor: pointer;">Ver contraseñas</label>
                </div><br><br>


                <p id="mensajeAlerta" style="display: none; color: red;">Las contraseñas no coinciden.</p>


                <!--<button class="button" type="submit" id="botonEnviar" style="display: none;">Crear usuario</button>-->
                <input type="submit" id="botonEnviar" style="display:none" value="Crear usuario">
            </form>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const nombreInput = document.getElementById("nombreUsuario");
                    const passwordInput = document.getElementById("password");
                    const repasswordInput = document.getElementById("repassword");
                    const verContrasenasCheckbox = document.getElementById("verContrasenas");
                    const verReContrasenasCheckbox = document.getElementById("verReContrasenas");
                    const mensajeAlerta = document.getElementById("mensajeAlerta");
                    const mensajeAlerta2 = document.getElementById("mensajeAlerta2");
                    const botonEnviar = document.getElementById("botonEnviar");


                    function togglePasswordVisibility(input, checkbox) {
                        if (checkbox.checked) {
                            input.type = "text";
                        } else {
                            input.type = "password";
                        }
                    }


                    verContrasenasCheckbox.addEventListener("change", function () {
                        togglePasswordVisibility(passwordInput, verContrasenasCheckbox);
                    });

                    verReContrasenasCheckbox.addEventListener("change", function () {
                        togglePasswordVisibility(repasswordInput, verReContrasenasCheckbox);
                    });


                    function verificarFormulario() {
                        const nombre = nombreInput.value.trim();
                        const password = passwordInput.value.trim();
                        const repassword = repasswordInput.value.trim();


                        if (nombre.length < 6 || nombre.length > 20) {
                            mensajeAlerta2.style.display = "block";
                        } else {
                            mensajeAlerta2.style.display = "none";
                        }


                        if (password !== repassword) {
                            mensajeAlerta.style.display = "block";
                        } else {
                            mensajeAlerta.style.display = "none";
                        }


                        if (nombre.length >= 6 && nombre.length <= 20 && password === repassword && password!="") {
                            botonEnviar.style.display = "block";
                        } else {
                            botonEnviar.style.display = "none";
                        }
                    }


                    nombreInput.addEventListener("input", verificarFormulario);
                    passwordInput.addEventListener("input", verificarFormulario);
                    repasswordInput.addEventListener("input", verificarFormulario);


                    const tipoUsuarioRadios = document.querySelectorAll('input[name="tipoUsuario"]');
                    for (const radio of tipoUsuarioRadios) {
                        radio.addEventListener("change", verificarFormulario);
                    }
                });
            </script>




            <div id="contenedor-resultados">


                <% String mensajeAlerta2 = (String) request.getAttribute("mensajeAlerta2"); %>
                <% if (mensajeAlerta2 != null && !mensajeAlerta2.isEmpty()) { %>

                <script>
                    document.addEventListener('DOMContentLoaded',function () {
                        Swal.fire({
                            title: 'Usuario creado con éxito',
                            text: 'Se ha agregado usuario a la base de datos.',
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