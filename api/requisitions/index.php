<?php
    // required headers
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    require '../config/database.php';

    $pdo = Database::connect();
    $query = '
    SELECT r.id, r.cart_id, b.name as branch, s.name as status, rs.created_at as completed, c.name as client, pt.name as payment_type, d.name as delivery, r.created_at
    FROM requisitions r, statuses s, requisition_status rs, clients c, payment_types pt, deliveries d, branches b, tills t
    WHERE s.id = rs.status_id and r.id = rs.requisition_id and s.name = "Entregado" and t.branch_id = b.id
          and c.id = r.client_id and pt.id = r.payment_type_id and d.id = r.delivery_id and r.till_id = t.id
          and t.id IN(
            SELECT t.id
            FROM tills t
            WHERE t.branch_id = 2);';
    
    $statement = $pdo->query($query);
    $num = $statement->rowCount();
    
    $data = array();
    if($num > 0){
        $data['requisitions'] = array();

        while($row = $statement->fetch(PDO::FETCH_ASSOC)){
            extract($row);

            $requisition = array(
                'id' => $id,
                'cart_id' => $cart_id,
                'branch' => $branch,
                'status' => $status,
                'completed' => $completed,
                'client' => $client,
                'payment_type' => $payment_type,
                'delivery' => $delivery,
                'created_at' => $created_at
            );

            array_push($data['requisitions'], $requisition);
        }
    }
    else{
        $data["errors"] = array();
        array_push($data["errors"], "No hay datos que concuerden con la búsqueda-");
    }

    var_dump(json_encode($data, JSON_FORCE_OBJECT));
    die();
?>