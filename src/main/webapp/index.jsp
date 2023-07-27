
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Spring 5</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="css/styleLogin.css" rel="stylesheet" type="text/css">
</head>
<body>
<section class="vh-100 d-flex justify-content-center align-items-center"> <!-- Agregar "d-flex justify-content-center align-items-center" para centrar el contenido verticalmente -->
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <!-- <img src="images/fondo.jpg"  class="img-fluid" alt="Sample image"> -->
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                     class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                <form action="svLogin" method="POST">
                    <!-- Usuario -->
                    <div class="form-outline mb-4">
                        <input type="text" id="form3Example3" class="form-control form-control-lg"
                               placeholder="Ingrese nombre de usuario" name="username">
                        <label class="form-label" >Usuario</label>
                    </div>
                    <!-- Contraseña -->
                    <div class="form-outline mb-3">
                        <input type="password" id="form3Example4" class="form-control form-control-lg"
                               placeholder="Ingrese contraseña" name="password">
                        <label class="form-label" >Contraseña</label>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#!" class="text-body">Olvido la contraseña?</a>
                    </div>
                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;" >Ingresar</button>
                    </div>
                </form> <!-- Agregar etiqueta de cierre </form> -->
            </div>

                <div id="contenedor-error">


                    <% String mensajeAlerta4 = (String) request.getAttribute("mensajeAlerta4"); %>
                    <% if (mensajeAlerta4 != null && !mensajeAlerta4.isEmpty()) { %>

                    <script>
                        document.addEventListener('DOMContentLoaded',function () {
                            Swal.fire({
                                icon: 'error',
                                title: 'Datos erróneos...',
                                text: 'Ingrese sus credenciales nuevamente.'
                            })
                        });
                    </script>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>