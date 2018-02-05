<?php
    // required headers
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    require '../config/database.php';

    $pdo = Database::connect();

    $query = '
    SELECT p.id, p.secondary_id, p.name, p.description, b.name as brand, c.name as category, bp.quantity, getValue(p.id, branch.id, now()) as price
    FROM products p, brands b, categories c, branches branch, branch_product bp
    WHERE p.brand_id = b.id and p.id = bp.product_id and branch.id = bp.branch_id and p.category_id = c.id and branch.id = 2';
    
    $statement = $pdo->query($query);
    $num = $statement->rowCount();
    $products = array();

    if($num > 0){
        while($row = $statement->fetch(PDO::FETCH_ASSOC)){
            extract($row);

            $product = array(
                "id" => $id,
                "secondary_id" => $secondary_id,
                "name" => $name,
                "description" => $description,
                "brand" => $brand,
                "category" => $category,
                "quantity" => $quantity,
                "price" => $price
            );

            array_push($products, $product);
        }
    }
    
    echo json_encode($products);
?>