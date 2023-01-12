<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    //String name = actualUser.getName();
    //String last_name = actualUser.getLast_name();
    String nro_turno = actualUser.getNro_turno();
    Date signup_date = actualUser.getSignup_date();
    
    String fechaComoCadena = new SimpleDateFormat("dd/MM/yyyy").format(signup_date);
    

    
%>

<div style="margin-bottom: 75%; margin-top: 7%; text-align:center""> 
    <center><h2 class="mb-3">Mi turno:</h2></center><br><br>
        <main class="container d-flex justify-content-center align-items-center">
     
     
        <div class="card mb-3">
            <div class="row g-0">
                <div class="col-md-4">
                <img src="/turnero/img/turnero.jpg" class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body" style="font-family:monospace ">
                      <p class="card-text">Dia <%= fechaComoCadena%></p>
                      <h1 class="card-text">Turno N° <%= nro_turno%></h1>
                      <center><p class="card-text"><small class="text-muted">¡Lo esperamos!</small></p></center>
                    </div>
                </div>
            </div>
        </div>
        
        </main>
        
        <div class="col-auto">
            <a href="/turnero/views/user.jsp" class="btn btn-dark">Home</a>
                </div>       
</div> 

  


<%@include file="/views/partials/footer.jsp" %>
