<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

$db = null;

$input = json_decode(file_get_contents('php://input'));
/* $fname = filter_var($input->firstname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$lname = filter_var($input->lastname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$address = filter_var($input->address, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$zip = filter_var($input->zip, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$city = filter_var($input->city, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$email = filter_var($input->email, FILTER_SANITIZE_FULL_SPECIAL_CHARS); */
$cart = $input->cart;
$user_id = $input->id;

try {
    $db = openDb();
    $db->beginTransaction();

    //lisää asiakas
/*     $sql = "INSERT INTO customer (firstname,lastname,address,zip,city,email) VALUES 
    ('" .
        filter_var($fname,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($lname,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($address,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($zip,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($city,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($email, FILTER_SANITIZE_FULL_SPECIAL_CHARS)
        . "')";

    $customer_id = executeInsert($db,$sql);
 */
 
    //lisää tilaus

    $sql = "INSERT INTO `order` (user_id) VALUES ($user_id)";
    $order_id = executeInsert($db,$sql);
    //lisää tilausrivit


    foreach ($cart as $product) {
    $sql = "INSERT INTO order_row (order_id,product_id, amount) VALUES ("
    .
        $order_id . "," .
        $product->id . "," . 
        $product->amount 
    .   ")";
    executeInsert($db,$sql);
    }
    $db->commit();
    header('HTTP/1.1 200 OK');
    $data = array('id' => $user_id);
    echo json_encode($data);
}
catch (PDOException $pdoex) {
    $db->rollback();
    returnError($pdoex);
    echo($pdoex);
}
?>