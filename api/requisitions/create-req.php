<?php
    /*
        Este archivo se encarga de registrar una venta en una sucursal.

        Recibe un nombre de cliente y un carrito (lista de productos con cantidad).
        Retorna un json con los errores (si existen).
    */

    // headers necesarios para recibir peticiones externas y recibir un cuerpo en json
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Headers: Content-Type");
    header("Content-Type: application/json; charset=UTF-8");
    header("Accept: application/json;");

    // Requerimos la clase Database
    require '../config/database.php';

    // Inicializamos arreglo para guardar la respuesta
    $data = array();
    $data["errors"] = array();

    // Obtenemos el json del POST, decodificamos la informacion en objetos
    $json = file_get_contents('php://input');
    $parsed = json_decode($json);
    $client_name = $parsed->client;
    $cart = $parsed->cart;

    //Revisar si los datos incluyen un nombre
    if(strlen($client_name) == 0){
        array_push( $data["errors"], "Debes incluir un nombre del cliente.");
    }

    //Revisar si los datos incluyen al menos un producto
    if(sizeof($cart) == 0){
        array_push( $data["errors"], "Debes incluir al menos un producto en la compra.");
    }

    // Si no hay errores, iniciamos la transaccion
    if(sizeof($data["errors"]) == 0){
        $pdo = Database::connect();
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->exec('SET TRANSACTION ISOLATION LEVEL SERIALIZABLE');
        
        try{
            $correct = true;
            $pdo->beginTransaction();

            //Crear cliente
            $sql = "INSERT INTO clients (name, birth, email, phone, password) VALUES (?, '1985-11-9', 'test@test.com', '2221548621','secret');";
            $q = $pdo->prepare($sql);
            $result = $q->execute(array($client_name));
            if(!$result){
                $correct = false;
                array_push( $data["errors"], "Datos inválidos en creación de cliente");
            }
            
            //Obtener id del cliente recien insertado
            $client_id = $pdo->lastInsertId();
            
            //Revisamos que existan suficientes productos en inventario
            foreach($cart as $selection){
                $sql = "SELECT bp.quantity FROM branch_product bp WHERE bp.branch_id = 2 and bp.product_id = ?;";
                $q = $pdo->prepare($sql);
                $result = $q->execute(array($selection->product->id));

                if($result){
                    $row = $q->fetch(PDO::FETCH_ASSOC);
                    extract($row);

                    if($quantity < $selection->quantity){
                        $correct = false;
                        array_push( $data["errors"], "No se cuenta con suficientes ".$selection->product->name." en inventario.");
                    }
                }
                else{
                    $correct = false;
                    array_push( $data["errors"], "Datos inválidos al agregar productos a carrito.");
                }
            } 
            
            //Crear carrito
            $sql = "INSERT INTO carts (client_id) VALUES (?);";
            $q = $pdo->prepare($sql);
            $result = $q->execute(array($client_id));
            if(!$result){
                $correct = false;
                array_push( $data["errors"], "Datos inválidos en creación de carrito");
            }
            
            //Obtener id del carrito recien insertado
            $cart_id = $pdo->lastInsertId();
            
            //Insertar productos
            foreach($cart as $selection){
                $sql = "INSERT INTO cart_product(product_id, cart_id, quantity) VALUES (?, ?, ?);";
                $q = $pdo->prepare($sql);
                $result = $q->execute(array($selection->product->id, $cart_id, $selection->quantity));
                if(!$result){
                    $correct = false;
                    array_push( $data["errors"], "Datos inválidos al agregar productos a carrito");
                }
            }
            
            //Crear requisicion
            $sql = "INSERT INTO requisitions(created_at, cart_id, client_id, delivery_id, payment_type_id, till_id) VALUES (now(), ?, ?, 1, 1, 3);";
            $q = $pdo->prepare($sql);
            $result = $q->execute(array($cart_id, $client_id));
            if(!$result){
                $correct = false;
                array_push( $data["errors"], "Datos inválidos en creación de venta");
            }
            
            //Obtener id de la requisicion recien insertada
            $requisition_id = $pdo->lastInsertId();
            
            //Actualizar estado de requisición
            $sql = "INSERT INTO requisition_status(requisition_id, status_id, created_at) VALUES (?, 4, now());";
            $q = $pdo->prepare($sql);
            $result = $q->execute(array($requisition_id));
            if(!$result){
                array_push( $data["errors"], "Datos inválidos en estado de requisición");
                $correct = false;
            }
            
            //Disminuir stock
            foreach($cart as $selection){
                $newStock = $selection->product->quantity - $selection->quantity;
                $sql = "UPDATE branch_product SET quantity = ? WHERE branch_id = 2 AND product_id = ?";
                $q = $pdo->prepare($sql);
                $result = $q->execute(array($newStock, $selection->product->id));
                if(!$result){
                    $correct = false;
                }
            }
            if($correct){
                $pdo->commit();
            }
            else{
                $pdo->rollBack();
            }
            
            Database::disconnect();
        }catch(PDOException $e){
            array_push( $data["errors"], $e->getMessage());
            if($pdo->inTransaction()){
                $pdo->rollBack();
            }
        }
        
    }

    echo json_encode($data);
?>