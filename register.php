<?php 
    include 'db.php';
   
    $npm = $decodedData['npm'];
    $nama = $decodedData['name'];
    $prodi = $decodedData['prodi'];
    $email = $decodedData['email'];
    $telp = $decodedData['telp'];
    $username = $decodedData['username'];
    $pass = md5($decodedData['pass']);
    $message = '';
   if($npm == "" || $nama == "" || $prodi == "" || $email == "" || $telp == "" || $username == "" || $pass== ""){
    $message = "You have to insert your register!";
} else {
    try {
        $SelectQuery = "SELECT * FROM tbl_user Where username = '$username' AND pass = '$pass' ";
        $Check = $conn->query($SelectQuery);
        if($Check->num_rows > 0){
            $message = "Account has been registered!";
        } else {
            $InsertQuery = "INSERT INTO tbl_user(npm,nama,prodi,email,telp,username,pass) VALUES('$npm','$nama','$prodi','$email','$telp','$username','$pass')";
            $R = $conn->query($InsertQuery);      
            if(!$R){
                $message = "Failed";
            } else {
                $message = 'success';
            } 
        }
        $conn->close();
    }
    catch (Exception $e){
        $message = $e->getMessage();
        die();
    }
    echo json_encode($message);
}
?>