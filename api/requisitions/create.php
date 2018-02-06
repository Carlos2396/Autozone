<?php
    // required headers
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");
    header("Content-Type: application/json; charset=UTF-8");
    header("Accept: application/json;");

    require '../config/database.php';

    $data = array();
    $data["errors"] = array();

    $json = file_get_contents('php://input');
    $parsed = json_decode($json);
    $client_name = $parsed->client;
    $cart = $parsed->cart;

    if(strlen($client_name) == 0){
        array_push( $data["errors"], "Debes incluir un nombre del cliente.");
    }

    if(sizeof($cart) == 0){
        array_push( $data["errors"], "Debes incluir al menos un producto en la compra.");
    }

    if(sizeof($data["errors"]) == 0){
        for($index = 0; $index < sizeof($cart); $index++){
            if($cart[$index]->quantity <= 0){
                array_push( $data["errors"], "No puedes comprar menos de 1 producto de cualquier tipo");
            }
            if($cart[$index]->product->quantity < $cart[$index]->quantity){
                array_push( $data["errors"], "Sólo se cuenta con " . $cart[$index]->product->quantity ." unidades de " . $cart[$index]->product->name . " en inventario" );
            }
        }
    }

    if(sizeof($data["errors"]) == 0){
        $pdo = Database::connect();
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        //Crear cliente
        $sql = "INSERT INTO clients (name, birth, email, phone, password) VALUES (?, '1985-11-9', 'test@test.com', '2221548621','secret');";
        $q = $pdo->prepare($sql);
        $q->execute(array($client_name));
        //Obtener id del cliente recien insertado
        $client_id = $pdo->lastInsertId();
        //Crear carrito
        $sql = "INSERT INTO carts (client_id) VALUES (?);";
        $q = $pdo->prepare($sql);
        $q->execute(array($client_id));
        //Obtener id del carrito recien insertado
        $cart_id = $pdo->lastInsertId();
        //Insertar productos
        for($index = 0; $index < sizeof($cart); $index++){
            $sql = "INSERT INTO cart_product(product_id, cart_id, quantity) VALUES (?, ?, ?);";
            $q = $pdo->prepare($sql);
            $q->execute(array($cart[$index]->product->id, $cart_id, $cart[$index]->quantity));
        }
        //Crear requisicion
        $sql = "INSERT INTO requisitions(created_at, cart_id, client_id, delivery_id, payment_type_id, till_id) VALUES (now(), ?, ?, 1, 1, 3);";
        $q = $pdo->prepare($sql);
        $q->execute(array($cart_id, $client_id));
        //Obtener id de la requisicion recien insertada
        $requisition_id = $pdo->lastInsertId();
        //Actualizar estado de requisición
        $sql = "INSERT INTO requisition_status(requisition_id, status_id, created_at) VALUES (?, 1, now());";
        $q = $pdo->prepare($sql);
        $q->execute(array($requisition_id));
        //Disminuir stock
        for($index = 0; $index < sizeof(cart); $index++){
            $newStock = $cart[$index]->product->quantity - $cart[$index]->quantity;
            $sql = "UPDATE branch_product SET quantity = ? WHERE branch_id = 2 AND product_id = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($newStock, $cart[$index]->product->id));
        }
        Database::disconnect();
    }

    echo json_encode($data);
?>