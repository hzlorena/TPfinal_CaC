<%-- 
    Document   : userCreado
    Created on : 06/01/2023, 23:09:07
    Author     : Lorena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/views/partials/header.jsp" %>

<main class="d-flex flex-column justify-content-center align-items-center">
    <div id="padre" >    
        <div id ="hijo">  
           
            <div style="margin-bottom: 75%; text-align:center">     
            
                <h2 class="mb-3">Informacion de registro:</h2>
            
            <%
            int uCreado = (int) session.getAttribute("uCreado");
            switch (uCreado) {
                case 1:
                    %>
                    <h3 class="text-success">¡Registro exitoso!</h3>
                    
                    <%
                    break;
                case 2:
                    %>
                    <h3 class="text-danger">¡El usuario ya existe!</h3>
                    <%
                    break;
                default:
                    %>
                    <h3 class="text-danger">¡Registro fallido!</h3>
                    <br><%
                    break;
            }
            %>
            <br>
                    <a href="/turnero" class="mt-3">Volver</a>
            </div>
        </div>
    </div>        
</main>


<%@include file="/views/partials/footer.jsp" %>
