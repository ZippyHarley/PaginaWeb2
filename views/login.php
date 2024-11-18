<?php 

require_once("../config/conexion.php");

if (isset($_POST["enviar"]) && $_POST["enviar"] == "ok") {
    require_once("../models/Usuario.php");
    $usuario = new Usuario();

    $email = trim($_POST["email"]);
    $password = trim($_POST["password"]);

    if (empty($email) || empty($password)) {
      header("Location: login.php?m=2");
      exit();
  }
  
  $resultado = $usuario->login($email, $password);
  
  if ($resultado) {
      header("Location: home.php");
      exit();
  } else {
      header("Location: login.php?m=1");
      exit();
  }
}
?>


<!DOCTYPE html> 
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ZH</title>

  <?php require_once("modulos/css.php"); ?> 
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Zippy</b>Harley</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Ingresa tus datos para iniciar tu sesion</p>

      <form method="post">
        <?php
          if(isset($_GET["m"])){
              switch($_GET["m"]){
                case "1":
                  ?>            
                  <div class="alert alert-danger" role="alert">
                    Los datos del formulario son incorrectos
                  </div>
                  <?php    
                  break;
                
                case "2":
                  ?>
                  <div class="alert alert-warning" role="alert">
                    El formulario esta vacio!
                    </div>
                  <?php            
                  break;
              }
          }
        ?>  
        <div class="input-group mb-3">
        <input type="email" class="form-control" placeholder="Email" name="email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
        <input type="password" class="form-control" placeholder="Password" name="password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span> 
            </div>
          </div>
        </div>  
          <div class="col-4">
            <input type="hidden" name="enviar" value="ok">
            <button type="submit" class="btn btn-primary btn-block">Enviar</button>
          </div>
          <!-- /.col -->    
        </div>
      </form>

    </div>
    <!-- /.login-card-body -->
  </div>
</div>

<!-- /.login-box -->

<!-- jQuery -->
<?php require_once("modulos/js.php"); ?>  
</html>