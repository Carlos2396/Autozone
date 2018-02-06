<?php
    /*
        Este archivo se encarga de obtener la cantidad registrada de un producto en usa sucursal.

        Recibe un id de producto a traves de la url.
        Retorna un json con la cantidad del producto.
    */

    // headers necesarios para recibir peticiones externas
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    // Requerimos la clase Database
    require '../config/database.php';

    // Inicializamos arreglo para guardar la respuesta
    $data = array();
    $data["errors"] = array();
    
    if(!empty($_GET['product_id'])){ // si la url incluye un id de producto
        $product_id = (int)$_REQUEST['product_id'];
        $valid = true;

        if(empty($product_id)){
            array_push($data["errors"], "No se especificó un id de producto.");
            $valid = false;
        }

        if($valid){
            $pdo = Database::connect();
            $query ='
                SELECT bp.quantity 
                FROM branch_product bp 
                WHERE bp.branch_id = 2 and bp.product_id = ?;';
            
            $statement = $pdo->prepare($query);
            $statement->execute(array($product_id));
            $num = $statement->rowCount();

            if($num){
                $row = $statement->fetch(PDO::FETCH_ASSOC);
                extract($row);
                $data["quantity"] = $quantity;
            }
            else{
                array_push($data["errors"], "Producto no encontrado.");
            }
        }
    }
    else{
        array_push($data["errors"], "Esta llamada debe incluir un id de producto.");
    }

    echo json_encode($data);
?>