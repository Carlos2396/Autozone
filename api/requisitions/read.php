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
    $data["requisitions"] = array();

    $pdo = Database::connect(); // inicializamos conexion PDO
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    try{
        $sql = 'call getCompletedRequisitions(2);'; // realizamos la query, ejecuta un stored procedure de la base
        $result = $pdo->query($sql);
        
        if($result && $result->rowCount() > 0){
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);

                $requisition = array(
                    "id" => $id,
                    "total" => $total,
                    "branch" => $branch,
                    "status" => $status,
                    "completed" => $completed,
                    "client" => $client,
                    "payment_type" => $payment_type,
                    "delivery" => $delivery,
                    "created_at" => $created_at
                );

                array_push($data["requisitions"], $requisition);
            }
        }
        else{
            array_push($data["errors"], "No hay ventas registradas.");
        }
    }catch(PDOException $e){
        array_push($data["errors"], $e->getMessage());
    }
    
    echo json_encode($data);
?>