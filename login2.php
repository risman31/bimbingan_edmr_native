<?php

include 'db.php';
$nama =$decodedData['nama'];

$message = '';
$error = false;
$array;
try {
      $SelectQuery = "SELECT aktif FROM users Where nama = '$nama' ";
        $Check = $conn->query($SelectQuery);
        if($Check->num_rows > 0){
            $array = $Check->fetch_assoc();
        } else {
            $message = "No account yet";
            $error = true;
            $array = null;
        }
        $conn->close();
} catch(Exception $e){
    $message = $e->getMessage();
    die();
}

$result = ['message' => $message, 'result' =>  $array ,'error' => $error];
echo  json_encode($result);