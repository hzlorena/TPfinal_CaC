<%@page import="model.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/views/partials/header.jsp" %>

<%
    if (!(boolean)session.getAttribute("isLogin")){
        response.sendRedirect("/turnero/");
    }

    Paciente actualUser = (Paciente) session.getAttribute("actualUser");
    //String username = actualUser.getUsername();
    //String password = actualUser.getPassword();
    String name = actualUser.getName();
    String last_name = actualUser.getLast_name();
    String nro_turno = actualUser.getNro_turno();
    
%>

<div style="margin-bottom: 75%; margin-top: 7%; text-align:center"> 
<main class="container d-flex justify-content-center align-items-center">
    
    

    <form method="POST" action="/turnero/paciente/updateTurno" class="w-50 px-5 py-4 rounded" >
        
        <h2 class="mb-3">Ingresar turno</h2>
        <br>
        
        <div class="row mb-3">
            <label for="name" class="col-4 formlabel">Nombre: </label> <%= name%>
        </div>

        <div class="row mb-3">
            <label for="last_name" class="col-4 formlabel">Apellido:</label><%= last_name%>
        </div>
        
        <div class="row mb-3">
            <label for="nro_turno" class="col-4 formlabel">Turno N°:</label>
            <input type="text" id="nro_turno" name="nro_turno" class="col-8 formcontrol" value="<%= nro_turno%>" >
        </div>
        
        <br>
        <button class="btn btn-success" type="submit">Generar nuevo turno</button>
        <!--<a href="/turnero/paciente/updateTurno" class="btn btn-dark" style="margin-left: 50%; margin-top: 0%">Solicitar</a> -->
    </form>
        
</main>
         </div> 

  


<%@include file="/views/partials/footer.jsp" %>


