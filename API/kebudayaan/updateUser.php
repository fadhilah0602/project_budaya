<?php

header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();
    
    // Memeriksa keberadaan data POST yang diperlukan
    if(isset($_POST['id']) && isset($_POST['username']) && isset($_POST['email'])) {
        $id = $_POST['id'];
        $username = $_POST['username'];
        $email = $_POST['email']; 

        $sql = "UPDATE users SET username = '$username', email = '$email' WHERE id = $id";
        $isSuccess = $koneksi->query($sql);

        if ($isSuccess) {
            $cek = "SELECT * FROM users WHERE id = $id";
            $result = mysqli_fetch_array(mysqli_query($koneksi, $cek));
            $response['is_success'] = true;
            $response['value'] = 1;
            $response['message'] = "User Berhasil di Edit";
            $response['username'] = $result['username'];
            $response['email'] = $result['email']; 
            $response['id'] = $result['id'];
        } else {
            $response['is_success'] = false;
            $response['value'] = 0;
            $response['message'] = "Gagal Edit User: " . $koneksi->error; // Menampilkan pesan kesalahan
        }
    } else {
        // Jika salah satu data POST tidak lengkap
        $response['is_success'] = false;
        $response['value'] = 0;
        $response['message'] = "Data yang diperlukan tidak lengkap";
    }

    echo json_encode($response);
}

?>
