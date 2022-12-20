<?php

require_once('./functions.php');

/**
 * Rekisteröi käyttäjätunnus tietokantaan
 */
function registerUser($uname, $pw, $firstname, $lastname, $address, $zip, $city) {
    $db = openDb();

    //encode pw
    $pw = password_hash($pw, PASSWORD_DEFAULT);

    $sql = "INSERT INTO user (username, passwd, firstname, lastname, address, zip, city) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $statement = $db->prepare($sql);
    $statement->execute(array($uname, $pw, $firstname, $lastname, $address, $zip, $city));
}

/**
 * Tarkista käyttäjätunnus ja palauttaa tunnuksen jos autentikoitu, muuten null
 */
function checkUser($uname,$pw){
    $db = openDb();

    $sql = "SELECT passwd FROM user WHERE username=?";
    $statement = $db->prepare($sql);
    $statement->execute(array($uname));

    $hashedpw = $statement->fetchColumn();

    if(isset($hashedpw)){
        return password_verify($pw, $hashedpw) ? $uname : null;
    }
    return null;
}


/**
 * Getting user info
 */
function getUserInfo($uname){
    $db = openDb();

    $sql = "SELECT * FROM `user` WHERE username=?";
    $statement = $db->prepare($sql);
    $statement->execute(array($uname));
    
    return $statement->fetchAll(PDO::FETCH_ASSOC);
}

/* $db = openDb();
    $sql = "SELECT * FROM product WHERE name like '%$phrase%' OR brewery like '%$phrase%'";
    selectAsJson($db,$sql); */