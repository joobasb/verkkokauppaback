<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

//hakee osoitteen ja purkaa sen osiin palauttaen viimeisen arvon (en ymmärrä kyllä miten)
$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'), PHP_URL_PATH);
$parameters = explode('/',$uri);
$category_id = $parameters[1];

//kokeile
try {
    $db = openDb();
    $sql = "SELECT * FROM category WHERE id = $category_id";
    $query = $db->query($sql);
    //hakee vain yhden koska fetch
    $category = $query->fetch(PDO::FETCH_ASSOC);

    $sql = "SELECT * FROM product WHERE category_id = $category_id";
    $query = $db->query($sql);
    //hakee kaiken koska fetchall
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "category" => $category['name'],
        "products" => $products
    ),JSON_PRETTY_PRINT);
//ota virheet kiinni ja käsittele se
} catch (PDOException $pdoex) {
 returnError($pdoex);
}

    //selectAsJson($db, "SELECT * FROM product WHERE category_id = $category_id");
