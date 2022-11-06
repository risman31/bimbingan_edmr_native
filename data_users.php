<?php

require_once('db.php');

if (empty($_GET)) {
    $query = mysqli_query($conn, "SELECT * FROM users");

    $result = array();
    while ($row = mysqli_fetch_array($query)) {
        array_push($result, array(
        	'npm' => $row['npm'],
            'nama' => $row['nama'],
            'aktif' => $row['aktif'],
            'photo' => $row['photo']       
        ));
    }

    echo json_encode(
        array('array' => $result)
    );
} else {
    $query = mysqli_query($conn, "SELECT * FROM users WHERE npm=" . $_GET['npm']);
    $result = array();
    while ($row = $query->fetch_assoc()) {
        $result = array(
            'npm' => $row['npm'],
            'nama' => $row['nama'],
            'aktif' => $row['aktif'],
            'photo' => $row['photo']       
        );
    }
    echo json_encode(
        $result
    );
}
