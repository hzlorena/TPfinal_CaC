    <!-- Bootstrap CSS -->  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!--mi CSS-->
    <link rel="stylesheet" href="/turnero/css/estilos.css">
<header>
    <nav class="navbar navbar-light bg-info">
        <div class="container-fluid" >
          <a class="navbar-brand" href="/turnero" style="color: white;">
            <h3>
            <img src="/turnero/img/pngegg (1).png" alt="" width="40" height="34" class="d-inline-block align-text-top">
             Dr. Petacas Mario</h3>
          </a>
        </div>
    </nav> 
</header>

<%
  if ((boolean)session.getAttribute("isLogin")){
    response.sendRedirect("/");
  }  
%>

<div style="margin-bottom: 75%; margin-top: 7%; text-align:center"> 
<main class="container d-flex justify-content-center align-items-center">
      

    <form method="POST" action="/turnero/paciente/createUser" class="w-50 px-5 py-4 rounded" >
        <h2 class="mb-4 text-center">Registro</h2>
        <div class="row mb-3">
            <label for="username" class="col-4 formlabel">Usuario:</label>
            <input type="text" id="username" name="username" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="password" class="col-4 formlabel">Clave:</label>
            <input type="password" id="password" name="password" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="name" class="col-4 formlabel">Nombre:</label>
            <input type="text" id="name" name="name" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="last_name" class="col-4 formlabel">Apellido:</label>
            <input type="text" id="last_name" name="last_name" class="col-8 formcontrol">
        </div>
        <!--
        <div class="row mb-3">
            <label for="email" class="col-4 formlabel">Email:</label>
            <input type="email" id="email" name="email" class="col-8 formcontrol">
        </div> 
        -->
        <div class="row align-items-center justify-content-between">
            <div class="col-auto">
                <button class="btn btn-dark" type="submit">Registrar</button>
            </div>
            <div class="col-auto">
                <a href="/turnero/views/login.jsp" class="link-primary">Volver</a>
            </div>
        </div>
    </form>
  </main>  
</div>    

<%@include file="/views/partials/footer.jsp" %>
