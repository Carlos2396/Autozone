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
    $data["cart"] = array();

    if(!empty($_GET['cart_id'])){ // si la url incluye un id de carrito
        $cart_id = (int)$_REQUEST['cart_id'];
        $valid = true;

        if(empty($cart_id)){
            array_push($data["errors"], "No se especificó un id de carrito.");
            $valid = false;
        }

        if($valid){
            try{
                $pdo = Database::connect();
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "SELECT p.id, p.secondary_id, p.name, p.description, b.name as brand, c.name as category, bp.quantity, getValue(p.id, branch.id, now()) as price, getPurchaseValue(p.id, now()) as purchase, cp.quantity as cart_quantity
                FROM products p, brands b, categories c, branches branch, branch_product bp, cart_product cp
                WHERE p.brand_id = b.id and p.id = bp.product_id and branch.id = bp.branch_id and p.category_id = c.id and branch.id = 2 and cp.cart_id = ? and cp.product_id = p.id
                ORDER BY p.id";

                $q = $pdo->prepare($sql);
                $result = $q->execute(array($cart_id));

                if($result){
                    while($row = $q->fetch(PDO::FETCH_ASSOC)){
                        extract($row);
                        $product = array(
                            "id" => $id,
                            "secondary_id" => $secondary_id,
                            "name" => $name,
                            "description" => $description,
                            "brand" => $brand,
                            "category" => $category,
                            "quantity" => $quantity,
                            "price" => $price,
                            "purchase" => $purchase
                        ); 

                        array_push($data["cart"], array("product" => $product, "quantity" => $cart_quantity));
                    }
                }
                else{
                    array_push($data["errors"], "Error en el carrito.");
                }
            }
            catch(PDOException $e){
                array_push($data["errors"], $e->getMessage());
            }
        }
    }
    else{
        array_push($data["errors"], "Esta llamada debe incluir un id de producto.");
    }

    echo json_encode($data);
?>