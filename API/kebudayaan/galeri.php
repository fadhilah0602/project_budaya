<?php

header("Access-Control-Allow-Origin: *"); // Mengizinkan akses dari semua asal
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "GET") {

    $response = array();
    $sql = "SELECT gambar FROM budaya";
    $result = $koneksi->query($sql);

    if($result->num_rows > 0) {
        $response['isSuccess'] = true;
        $response['message'] = "Berhasil Menampilkan Gambar Budaya";
        $response['data'] = array();
        while ($row = $result->fetch_assoc()) {
            // Mendapatkan nilai-nilai gambar langsung
            $imageData = $row['gambar'];
            $response['data'][] = $imageData;
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Gagal menampilkan Gambar Budaya";
        $response['data'] = null;
    }
    echo json_encode($response);
}

?>
