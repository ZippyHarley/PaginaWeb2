<?php
require_once("../config/conexion.php");

class Usuario extends Conectar {
    public function login($email, $password) {
        $conectar = parent::getConexion();
        parent::set_names();

        try {
            $sql = "SELECT * FROM usuarios WHERE usu_correo = :email";
            $stmt = $conectar->prepare($sql);
            $stmt->bindParam(":email", $email);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

                // Si la contraseña es correcta
                if ($password === $usuario["contrasena"]) {
                    session_start();
                    $_SESSION["usuario_id"] = $usuario["usuario_id"];
                    $_SESSION["nombre"] = $usuario["nombre"];
                    $_SESSION["email"] = $usuario["usu_correo"];

                    header("Location: " . parent::ruta());
                    exit;
                } else {
                    // Contraseña incorrecta
                    echo "Contraseña incorrecta.";
                }
            } else {
                // Correo no encontrado
                echo "Correo no encontrado.";
            }
            return false;
        } catch (PDOException $e) {
            die("Error: " . $e->getMessage());
        }
    }
}
?>
