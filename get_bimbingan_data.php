<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, x-requested-with ');
header("Content-Type: application/json; charset=utf-8");

    include "db.php";
    $data = array();
$npm = $decodedData['npm'];
    $query = mysqli_query($conn, "SELECT * FROM bimbingan_data where npm ='$npm' order by kd_bimbingan desc");
    while($rows = mysqli_fetch_array($query) ){
        $data[] = array(
            'kd_bimbingan' => $rows['kd_bimbingan'],
            'thn_akademik' => $rows['thn_akademik'],
            'judul' => $rows['judul'],
            'topik' => $rows['topik'],
            'nama_dosen' => $rows['nama_dosen']            
            );
        }

    if($query){
        $result = json_encode(array('success'=>true, 'result'=>$data));
    }else{
        $result = json_encode(array('success'=>false));

    }
    echo $result;

?>