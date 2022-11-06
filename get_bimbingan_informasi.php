<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, x-requested-with ');
header("Content-Type: application/json; charset=utf-8");

    include "db.php";
    $data = array();
      $query = mysqli_query($conn, "SELECT * FROM setting where status = 1 order by id desc");
      if(mysqli_num_rows($query) > 0){
        while($rows = mysqli_fetch_assoc($query) ){
        $data_thn = $rows['thn_akademik'];
        }
        $query = mysqli_query($conn, "SELECT * FROM bimbingan_informasi where thn_akademik='$data_thn' order by kd_informasi desc");
        while($rows = mysqli_fetch_array($query) ){
        $data[] = array(
            'kd_informasi' => $rows['kd_informasi'],
            'fakultas_info' => $rows['fakultas_info'],
            'prodi_info' => $rows['prodi_info'],
            'dentry' => $rows['dentry'],
            'thn_akademik' => $rows['thn_akademik']
            );
        }
      }


    if($query){
        $result = json_encode(array('success'=>true, 'result'=>$data));
    }else{
        $result = json_encode(array('success'=>false));

    }
    echo $result;
?>