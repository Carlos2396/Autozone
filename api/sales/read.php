<?php
    /*
        Este archivo se encarga de obtener las ventas de una sucursal.

        Retorna un json todas las ventas de una sucursal.
    */

    // headers necesarios para recibir peticiones externas
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    // Requerimos la clase Database
    require '../config/database.php';

    $data = array();
    $data["errors"] = array();
    $data["salesPerHour"] = array();

    try{
        $pdo = Database::connect(); // inicializamos conexion PDO
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = 'SELECT sph.id, sph.total, sph.created_at
        FROM salesPerHour sph
        WHERE DATE(sph.created_at) = DATE(NOW())
        ORDER BY sph.created_at DESC;'; // realizamos la query, ejecuta un stored procedure de la base
        $result = $pdo->query($sql);
        
        if($result && $result->rowCount() > 0){
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);

                $salePerHour = array(
                    "id" => $id,
                    "total" => $total,
                    "created_at" => $created_at,
                );

                array_push($data["salesPerHour"], $salePerHour);
            }
        }
        else{
            array_push($data["errors"], "No hay totales para el día de hoy.");
        }
    }catch(PDOException $e){
        array_push($data["errors"], $e->getMessage());
    }
    
    echo json_encode($data);

?>