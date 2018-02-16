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
    $data["requisitions"] = array();

    if(!empty($_GET['date'])){ // si la url incluye un id de carrito
        $date = $_REQUEST['date'];
        $valid = true;

        if(empty($date)){
            array_push($data["errors"], "No se especificó una fecha.");
            $valid = false;
        }

        if($valid){
            try{
                $pdo = Database::connect(); // inicializamos conexion PDO
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                $sql = 'SELECT r.id, getCartTotal(r.cart_id) as total, r.cart_id as cart, b.name as branch, s.name as status, rs.created_at as completed, c.name as client, pt.name as payment_type, d.name as delivery, r.created_at
                FROM requisitions r, statuses s, requisition_status rs, clients c, payment_types pt, deliveries d, branches b, tills t
                WHERE s.id = rs.status_id and r.id = rs.requisition_id and s.name = "Entregado" and t.branch_id = b.id
                      and c.id = r.client_id and pt.id = r.payment_type_id and d.id = r.delivery_id and r.till_id = t.id and Date(r.created_at) = Date(?)
                      and t.id IN(
                        SELECT t.id
                        FROM tills t
                        WHERE t.branch_id = 2)
                ORDER BY rs.created_at DESC;'; // realizamos la query, ejecuta un stored procedure de la base
                $q = $pdo->prepare($sql);
                $result = $q->execute(array((string)$date));
                
                if($result && $q->rowCount() > 0){
                    while($row = $q->fetch(PDO::FETCH_ASSOC)){
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
                            "created_at" => $created_at,
                            "cart" => $cart
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
        }
    }
    else{
        array_push($data["errors"], "Esta llamada debe incluir una fecha.");
    }

    echo json_encode($data);
?>