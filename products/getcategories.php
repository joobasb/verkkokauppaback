<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

//avaa tietokanta ja hae sql-komennolla json-muodossa
try {
    $db = openDb();
    selectAsJson($db, "SELECT * FROM category");
//ota virheet kiinni ja käsittele se
} catch (PDOException $pdoex) {
 returnError($pdoex);
}