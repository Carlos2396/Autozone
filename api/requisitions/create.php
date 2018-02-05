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
        //aqui va la transacción
    }

    echo json_encode($data);
?>