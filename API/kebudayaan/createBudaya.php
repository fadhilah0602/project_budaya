<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Pastikan bahwa semua parameter yang diperlukan tersedia
    if (isset($_POST['judul']) && isset($_POST['konten']) && isset($_POST['gambar'])) {
        $judul = $_POST['judul'];
        $konten = $_POST['konten'];
        $gambar = $_POST['gambar'];

        $sql = "INSERT INTO budaya (judul, konten, gambar) VALUES ('$judul', '$konten', '$gambar')";
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil menambahkan budaya";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal menambahkan budaya: " . $koneksi->error;
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Parameter tidak lengkap";
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Metode yang diperbolehkan hanya POST";
}

echo json_encode($response);
?>
