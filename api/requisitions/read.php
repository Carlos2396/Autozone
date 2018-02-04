<?php
    // required headers
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    require '../config/database.php';

    $pdo = Database::connect();

    $query = 'call getCompletedRequisitions(2);';
    
    $statement = $pdo->query($query);
    $num = $statement->rowCount();
    $requisitions = array();

    if($num > 0){
        while($row = $statement->fetch(PDO::FETCH_ASSOC)){
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

            array_push($requisitions, $requisition);
        }
    }
    
    echo json_encode($requisitions);
?>