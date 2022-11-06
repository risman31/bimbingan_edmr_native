<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, x-requested-with ');
header("Content-Type: application/json; charset=utf-8");

    include "db.php";
    $data = array();

    $query = mysqli_query($conn, "SELECT * FROM bimbingan_capture where kd_capture='$_POST[id]' order by kd_capture desc");
    while($rows = mysqli_fetch_array($query) ){
        $data[] = array(
            'kd_capture' => $rows['kd_capture'],
            'kd_bimbingan' => $rows['kd_bimbingan'],
            'keterangan' => $rows['keterangan'],
            'photo' => $rows['photo'],
            'dentry' => $rows['dentry'],
            'thn_akademik' => $rows['thn_akademik'],
            );
        }

    if($query){
        $result = json_encode(array('success'=>true, 'result'=>$data));
    }else{
        $result = json_encode(array('success'=>false));

    }
    echo $result;

?>