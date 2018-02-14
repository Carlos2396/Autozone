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
    $data["purchases"] = array();

    

    try{
        $pdo = Database::connect(); // inicializamos conexion PDO
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = 'SELECT pur.id as id, p.id as product_id, p.name, b.name as brand, getPurchaseValue(p.id, now()) as price, pur.quantity, pur.created_at, pur.done
        FROM products p, purchases pur, brands b
        WHERE p.id = pur.product_id and p.brand_id = b.id and pur.branch_id = 2
        ORDER BY pur.created_at DESC;'; // realizamos la query
        $result = $pdo->query($sql);
        
        if($result && $result->rowCount() > 0){
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);

                $purchase = array(
                    "id" => $id,
                    "product_id" => $product_id,
                    "name" => $name,
                    "brand" => $brand,
                    "price" => $price,
                    "quantity" => $quantity,
                    "created_at" => $created_at,
                    "done" => $done
                );

                array_push($data["purchases"], $purchase);
            }
        }
        else{
            array_push($data["errors"], "No hay compras registradas.");
        }
    }catch(PDOException $e){
        array_push($data["errors"], $e->getMessage());
    }
    
    echo json_encode($data);
?>