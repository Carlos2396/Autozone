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
    $data["products"] = array();

    $pdo = Database::connect();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    try{
        $sql = "SELECT p.id, p.secondary_id, p.name, p.description, b.name as brand, c.name as category, bp.quantity, getValue(p.id, branch.id, now()) as price
        FROM products p, brands b, categories c, branches branch, branch_product bp
        WHERE p.brand_id = b.id and p.id = bp.product_id and branch.id = bp.branch_id and p.category_id = c.id and branch.id = 2";
        
        $result = $pdo->query($sql);

        if($result && $result->rowCount() > 0){
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
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

                array_push($data["products"], $product);
            }
        }
        else{
            array_push($data["errors"], "No se encontraron productos en la sucursal.");
        }
    }
    catch(PDOException $e){
        array_push($data["errors"], $e->getMessage());
    }
    
    echo json_encode($data);
?>