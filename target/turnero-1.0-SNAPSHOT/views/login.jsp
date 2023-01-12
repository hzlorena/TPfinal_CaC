
<%@include file="/views/partials/header.jsp" %>

<%
  if ((boolean)session.getAttribute("isLogin")){
    response.sendRedirect("/");
  }  
%>


<main class="container d-flex justify-content-center align-items-center">
    
    <!-- /homebanking/usuario/loginUser no es una ruta (aunque parezca), sino una accion
        del proyecto homebanking, usando el servlet nombrado usuario (el archivo que lo 
        contiene es UsuarioController) que contiene la accion loginUser-->
<div id="padre">
    <div id="hijo">
 
    <form method="POST" action="/turnero/paciente/loginUser" class="py-4 px-5 rounded" >
        <img src="/turnero/img/login2.png" style="width: 25%; margin-left: 55%">
        <br><br>
        <div class="row mb-3">
            <label for="username" class="col-4 formlabel">Usuario:</label>
            <input type="text" id="username" name="username" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="password" class="col-4 formlabel">Clave:</label>
            <input type="password" id="password" name="password" class="col-8 formcontrol">
        </div>

        <div class="row align-items-center justify-content-between" style=" margin-left: 50%">
            <div class="col-auto">
                <button class="btn btn-dark" type="submit">Ingresar</button>
            </div>
        </div>
    </form>
    </div>
</div>        
</main>

<%@include file="/views/partials/footer.jsp" %>
