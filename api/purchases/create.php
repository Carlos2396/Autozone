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
    $cart = json_decode($json);

    //Revisar si los datos incluyen al menos un producto
    if(sizeof($cart) == 0){
        array_push( $data["errors"], "Debes incluir al menos un producto en la compra.");
    }

    // Revisar que las cantidades sean positivas
    foreach($cart as $selection){
        if($selection->quantity < 0){
            array_push( $data["errors"], "Las cantidades deben ser positivas.");
        }
    }

    // Si no hay errores, iniciamos la transaccion
    if(sizeof($data["errors"]) == 0){
        try{
            $pdo = Database::connect();
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $pdo->exec('SET TRANSACTION ISOLATION LEVEL SERIALIZABLE');
            
        
            $correct = true;
            $pdo->beginTransaction();

            //Buscar id de sucursal
            $branch_id = null;
            $sql = "select b.id as id from branches b where b.name = ?;";
            $q = $pdo->prepare($sql);
            $result = $q->execute(array('En linea'));
            if($result){
                $row = $q->fetch(PDO::FETCH_ASSOC);
                extract($row);
                $branch_id = $id;
            }
            else{
                $correct = false;
                array_push( $data["errors"], "Sucursal no encontrada.");
            }
            
            //Actualizamos el inventario de productos
            foreach($cart as $selection){
                $sql ="SELECT bp.quantity FROM branch_product bp WHERE bp.branch_id = ? and bp.product_id = ?;";
                $q = $pdo->prepare($sql);
                $result = $q->execute(array($branch_id, $selection->product->id));

                if($result){
                    $row = $q->fetch(PDO::FETCH_ASSOC);
                    extract($row);

                    $sql = "UPDATE branch_product bp SET quantity = ? WHERE bp.branch_id = ? and bp.product_id = ?;";
                    $q = $pdo->prepare($sql);
                    $result = $q->execute(array($quantity + $selection->quantity ,$branch_id, $selection->product->id));
                    
                    if(!$result){
                        $correct = false;
                        array_push( $data["errors"], "El producto " + selection.product.name + " no se actualizó.");    
                    }
                }
                else{
                    $correct = false;
                    array_push( $data["errors"], "Producto " + selection.product.name + " no encontrado.");
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