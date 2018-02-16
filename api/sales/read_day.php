<?php
    /*
        Este archivo se encarga de obtener el inventario de productos de una sucursal.

        Retorna un json todos los productos de una sucursal.
    */

    // headers necesarios para recibir peticiones externas
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    // Requerimos la clase Database
    require '../config/database.php';

    $data = array();
    $data["errors"] = array();
    $data["mount"] = 0;

    if(!empty($_GET['date'])){ // si la url incluye un id de carrito
        $date = $_REQUEST['date'];
        $valid = true;

        if(empty($date)){
            array_push($data["errors"], "No se especificó una fecha.");
            $valid = false;
        }

        if($valid){
            try{
                $pdo = Database::connect();
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "SELECT getDayValue(?) AS mount;";
                $q = $pdo->prepare($sql);
                $result = $q->execute(array((string)$date));

                if($result){
                    while($row = $q->fetch(PDO::FETCH_ASSOC)){
                        extract($row);
                        if($mount != null)
                            $data["mount"] = $mount;
                        else
                            array_push($data["errors"], "Datos no encontrados en la fecha especificada.");        
                    }
                }
                else{
                    array_push($data["errors"], "Datos no encontrados en la fecha especificada.");
                }
            }
            catch(PDOException $e){
                array_push($data["errors"], $e->getMessage());
            }
        }
    }
    else{
        array_push($data["errors"], "Esta llamada debe incluir una fecha.");
    }

    echo json_encode($data);
?>