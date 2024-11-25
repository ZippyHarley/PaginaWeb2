<?php
    require_once("../config/conexion.php");
    require_once("../models/SocialMedia.php");
    $social_media = new SocialMedia();

    switch($_GET["op"]){
        case "guardaryeditar":
            if(empty($_POST[$red_id])){
                $social_media->insert_socialMedia($_POST["$icono"],$_POST);
            }else{
                $social_media->update_socialMedia($_POST["$red_id"],$_POST);
            };
            break;
        case "mostrar":
            $datos=$social_media->get_socialMediaXid($_POST["$red_id"]);
            if(is_array($datos) == true and count($datos) <> 0){
                foreach($datos as $row){
                    $output["$icono"] = $row["$icono"];
                    $output["$url"] = $row["$url"];
                }
                echo json_encode($output);
            }
            break;
        case "listar":
            $datos=$social_media->get_socialMedia();
            $data=Array();
            foreach($datos as $row){
                $subarray = array();

                $subarray[] = $row["icono"];
                $subarray[] = $row["url"];
                $subarray[] = '<button type="button" onClick="editar('.$row["red_id"].');" id="'.$row["red_id"].'" class="btn btn-primary">Editar</button>';
                $subarray[] = '<button type="button" onClick="eliminar('.$row["red_id"].');" id="'.$row["red_id"].'" class="btn btn-danger">Eliminar</button>';
            }   
            break;
        case "eliminar":
            $social_media->delete_socialMedia($_POST["red_id"]);
            break;

    }

?>