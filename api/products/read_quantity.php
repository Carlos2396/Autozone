<?php
    // required headers
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    require '../config/database.php';

    $data = array();
    $data["errors"] = array();
    
    if(!empty($_GET['product_id'])){
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
                FROM products p,branches b, branch_product bp
                WHERE b.id = 2 and p.id = ? and bp.product_id = b.id and bp.branch_id = b.id';
            
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