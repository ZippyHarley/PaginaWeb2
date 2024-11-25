<?php
    class SocialMedia extends Conectar{
        public function get_socialMedia(){
            $social = parent::Conexion();
            parent::set_names();
            $sql="SELECT * FROM redes_sociales";
            $sql=$social->prepare($sql);
            $sql->execute();
            return $resultado = $sql->fetchAll();
        } 

        public function get_social_mediaXid($red_id){
            $social = parent::Conexion();
            parent::set_names();
            $sql="SELECT * FROM redes_sociales WHERE red_id=?";
            $sql=$social->prepare($sql);
            $sql->bindValue(1,$red_id);
            $sql->execute();
            return $resultado = $sql->fetchAll();
        }

        public function insert_socialMedia($icono,$url){
            $social = parent::Conexion();
            parent::set_names();
            $sql="INSERT INTO redes_sociales(red_id,icono,url,estado)
                    VALUES(NULL,?,?,1)";
            $sql=$social->prepare($sql);
            $sql->bindValue(1,$icono);
            $sql->bindValue(2,$url);
            $sql->execute();
            return $resultado = $sql->fetchAll();
        }

        public function update_socialMedia($red_id,$icono,$url){
            $social = parent::Conexion();
            parent::set_names();
            $sql="UPDATE redes_sociales 
                    SET
                        red_id = ? 
                        url = ?
                    WHERE
                       red_id = ?";
            $sql=$social->prepare($sql);
            $sql->bindValue(1,$icono);
            $sql->bindValue(2,$url);
            $sql->bindValue(3,$red_id);
            $sql->execute();
            return $resultado = $sql->fetchAll();
        }

        public function delete_socialMedia($red_id){
            $social = parent::Conexion();
            parent::set_names();
            $sql="UPDATE socialmedia
                    SET
                        est = 0
                    WHERE
                        red_id = ?";
            $sql=$social->prepare($sql);
            $sql->bindValue(1,$red_id);
            $sql->execute();
            return $resultado = $sql->fetchAll();
        }
?>