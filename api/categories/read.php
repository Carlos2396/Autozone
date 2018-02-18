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
    $data["categories"] = array();

    try{
        $pdo = Database::connect();
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "call getCategories()";
        
        $result = $pdo->query($sql);

        if($result && $result->rowCount() > 0){
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);

                $category = array(
                    "id" => $id,
                    "department" => $department,
                    "subdepartment" => $subdepartment,
                    "name" => $name,
                    "products" => $products
                );

                array_push($data["categories"], $category);
            }
        }
        else{
            array_push($data["errors"], "No se encontraron categorias.");
        }
    }
    catch(PDOException $e){
        array_push($data["errors"], $e->getMessage());
    }
    
    echo json_encode($data);
?>