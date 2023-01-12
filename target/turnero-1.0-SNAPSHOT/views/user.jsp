 <!-- Bootstrap CSS -->  
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
 <!--mi CSS-->
<link rel="stylesheet" href="/turnero/css/estilos.css">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/views/partials/header.jsp" %>

<main >
    <div id="padre" >    
        <div id ="hijo">  
           
            <div style="margin-bottom: 75%; text-align:center">     
            
                    <h2 class="mb-3">Informacion de ingreso:</h2>
        
                    <%
                    isLogin = (boolean) session.getAttribute("isLogin");
                    if (isLogin) {
                    %>
                        <h3 class="text-success">Acceso permitido</h3>
                        <h3>¡Bienvenido!</h3>
                        <br>   
                        <!-- Le pido al contolador que me muestre los datos -->
                        <a href="/turnero/paciente/ver" class="mt-3">Solicitar turno</a>
                    <%
                    }
                    else {
                    %>
                        <h3 class="text-danger">Acceso denegado</h3>
                        <br>
                        <!-- Le pido al contolador que me muestre los datos -->
                        <a href="/turnero/views/login.jsp" class="mt-3">Volver</a>
                    <%
                    } 
                    %>
                    
          
                
            </div>
            
        </div>    
    </div> 
            
</main>
            

 <%@include file="/views/partials/footer.jsp" %>
