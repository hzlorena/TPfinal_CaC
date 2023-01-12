
<%@page import="model.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--JavaScript-->
<script src="turnero/js/eventos.js"></script>

<%@include file="/views/partials/header.jsp" %>

<%
    if (!(boolean)session.getAttribute("isLogin")){
        response.sendRedirect("/turnero/");
    }

    Paciente actualUser = (Paciente) session.getAttribute("actualUser");
    String username = actualUser.getUsername();
    String password = actualUser.getPassword();
    String name = actualUser.getName();
    String last_name = actualUser.getLast_name();
    String nro_turno = actualUser.getNro_turno();
    
%>

<div style="margin-bottom: 75%; margin-top: 7%; text-align:center"> 
    <main class="container d-flex justify-content-center align-items-center">

        <form method="POST" action="/turnero/paciente/updateUser" class="w-50 px-5 py-4 rounded" >
            <h2 class="mb-4 text-center">Mi cuenta</h2>
            <div class="row mb-3">
                <label for="username" class="col-4 formlabel">Usuario:</label>
                <input type="text" id="username" name="username" class="col-8 formcontrol" value="<%= username%>" disabled>
            </div>

            <div class="row mb-3">
                <label for="password" class="col-4 formlabel">Clave:</label>
                <input type="password" id="password" name="password" class="col-8 formcontrol" value="<%= password%>" >
            </div>

            <div class="row mb-3">
                <label for="name" class="col-4 formlabel">Nombre:</label>
                <input type="text" id="name" name="name" class="col-8 formcontrol" value="<%= name%>" >
            </div>

            <div class="row mb-3">
                <label for="last_name" class="col-4 formlabel">Apellido:</label>
                <input type="text" id="last_name" name="last_name" class="col-8 formcontrol" value="<%= last_name%>" >
            </div>

            <div class="row align-items-center justify-content-between" style="position: absolute">
                <div class="col-auto">
                    <button class="btn btn-success" type="submit" onclick="alert('Usuario modificado');">Modificar</button>
                    <a href="/turnero/paciente/deleteUser" class="btn btn-danger">Eliminar</a>
                    <a href="/turnero/paciente/ver" class="btn btn-dark">Solicitar turno</a>
                </div>    
            </div>
        </form>
    </main>
</div>




<%@include file="/views/partials/footer.jsp" %>
