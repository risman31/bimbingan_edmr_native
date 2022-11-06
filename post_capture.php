<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, x-requested-with ');
header("Content-Type: application/json; charset=utf-8");

include "db.php";
    // File upload path
        $targetDir = "uploads/";
        $fileName = basename($_FILES["photo"]["name"]);
        $targetFilePath = $targetDir . $fileName;
        $fileType = pathinfo($targetFilePath,PATHINFO_EXTENSION);

        
            // Allow certain file formats
            $allowTypes = array('jpg','png','jpeg','gif','pdf');
            if(in_array($fileType, $allowTypes)){
                //Upload file to server
                if(move_uploaded_file($_FILES["photo"]["tmp_name"], $targetFilePath)){
                    // Insert image file name into database 
                    $insert = mysqli_query($conn, "INSERT INTO bimbingan_capture (
                        `kd_capture`,`kd_bimbingan`, `keterangan`, `dentry`, `thn_akademik`, `photo`)
                        VALUES (
                        '',
                        '$_POST[kd_bimbingan]',
                        '$_POST[keterangan]',
                        '$_POST[dentry]',
                        '$_POST[thn_akademik]',
                        '$fileName')");

if($insert){
    $result = json_encode(array('error'=>false, 'msg'=>'Data Berhasil Disimpan'));
}else{
    $result = json_encode(array('error'=>true, 'msg'=>'Data Gagal Disimpan'));
}

echo $result;
                }else{
                    $result = json_encode(array('error'=>true, 'msg'=>'Data Gagal Disimpan'));
                    echo $result;
                }
            }
?>