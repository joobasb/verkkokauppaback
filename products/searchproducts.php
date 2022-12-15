<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

//read parameters from url.
$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'), PHP_URL_PATH);
//parameters are separated with slash /
$parameters = explode('/',$uri);

//category id is first parameter so it follows alter address
$phrase = $parameters[1];

try {
    $db = openDb();
    $sql = "SELECT * FROM product WHERE name like '%$phrase%' OR brewery like '%$phrase%'";
    selectAsJson($db,$sql);
}
catch (PDOException $pdoex) {
    returnError($pdoex);
}