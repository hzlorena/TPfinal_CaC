
 <!-- Bootstrap CSS -->  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!--mi CSS-->
    <link rel="stylesheet" href="/turnero/css/estilos.css">
                                                                
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
  <header>
    <nav class="navbar navbar-light bg-info">
        <div class="container-fluid" >
          <a class="navbar-brand" href="/turnero" style="color: white;">
            <h3>
            <img src="/turnero/img/pngegg (1).png" alt="" width="40" height="34" class="d-inline-block align-text-top">
             Dr. Petacas Mario</h3>
          </a>
            <%
                boolean isLogin;
                if(session.isNew()){
                    session.setAttribute("isLogin", false); 
                }
                isLogin = (boolean) session.getAttribute("isLogin");
            %>
            
            <ul class="nav nav-pills">
                
                <li class="nav-item mx-2" style="display: <%= isLogin?"none":"initial" %>">
                    <a class="nav-link active" href="/turnero/views/registro.jsp">Registrarme</a>
                </li>
                <!--ver todos los datos-->
                <li class="nav-item mx-2" style="display: <%= !isLogin?"none":"initial" %>">
                    <a class="nav-link active" href="/turnero/paciente/viewUser">Mi cuenta</a>
                </li>
                <li class="nav-item mx-2" style="display: <%= !isLogin?"none":"initial" %>">
                    <a class="nav-link active" href="/turnero/paciente/logoutUser">Salir</a>
                </li>
            </ul>
        </div>
      </nav> 
   </header>
