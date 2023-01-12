<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!--mi CSS-->
    <link rel="stylesheet" href="./css/estilos.css">

    <!--titulo en la pestaña-->
   <title>Final FJS</title>
   
   <%@include file="/views/partials/header.jsp" %>
</head>  
   
<body>
    
  
   <div id="padre">

  <div id="hijo">
   <div class="card text-bg-primary text-bg-primary">
    <img src="./img/240_F_335834959_MDqJduSoYTSjBHFpk0FQvIIEL3bLPJ3b.jpg" class="card-img">
    <div class="card-img-overlay text-end">
      <h2 class="card-title">Medicina familiar</h2>
      <a class="btn" href="/turnero/views/login.jsp" >Turnos</a>
          
    </div>
    <div class="card-footer">
      <center><small class="text-muted">LUNES A VIERNES de 10 a 18 hs</small></center>
    </div>
  </div>

  </div>  


 <%@include file="/views/partials/footer.jsp" %>


</body>
</html>
