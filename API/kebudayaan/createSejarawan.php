<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Check if all parameters are available
    if (isset($_POST['nama']) && isset($_FILES['foto']) && isset($_POST['tanggal_lahir']) && isset($_POST['asal']) && isset($_POST['jenis_kelamin']) && isset($_POST['deskripsi'])) {
        $nama = $_POST['nama'];
        $tanggal_lahir = $_POST['tanggal_lahir'];
        $asal = $_POST['asal'];
        $jenis_kelamin = $_POST['jenis_kelamin'];
        $deskripsi = $_POST['deskripsi'];

        // Handling file upload
        $file = $_FILES['foto'];
        $filename = $file['name'];
        $filetmp = $file['tmp_name'];
        $fileError = $file['error'];
        $fileSize = $file['size'];
        $fileExt = explode('.', $filename);
        $fileActualExt = strtolower(end($fileExt));
        
        $allowed = array('jpg', 'jpeg', 'png', 'gif');

        if (in_array($fileActualExt, $allowed)) {
            if ($fileError === 0) {
                if ($fileSize < 5000000) { // restrict file size to 5MB
                    $fileNameNew = uniqid('', true).".".$fileActualExt;
                    $fileDestination = 'gambar/'.$fileNameNew;
                    move_uploaded_file($filetmp, $fileDestination);
                    $foto = $fileDestination;

                    // Insert into database
                    $sql = "INSERT INTO sejarawan (nama, foto, tanggal_lahir, asal, jenis_kelamin, deskripsi) VALUES (?, ?, ?, ?, ?, ?)";
                    $stmt = $koneksi->prepare($sql);
                    if ($stmt === false) {
                        $response['isSuccess'] = false;
                        $response['message'] = "Failed to prepare statement: " . $koneksi->error;
                    } else {
                        $stmt->bind_param("ssssss", $nama, $foto, $tanggal_lahir, $asal, $jenis_kelamin, $deskripsi);
                        if ($stmt->execute()) {
                            $response['isSuccess'] = true;
                            $response['message'] = "Berhasil menambahkan sejarawan";
                        } else {
                            $response['isSuccess'] = false;
                            $response['message'] = "Gagal menambahkan sejarawan: " . $stmt->error;
                        }
                        $stmt->close();
                    }
                } else {
                    $response['isSuccess'] = false;
                    $response['message'] = "File is too large";
                }
            } else {
                $response['isSuccess'] = false;
                $response['message'] = "There was an error uploading your file";
            }
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "You cannot upload files of this type";
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Required fields are missing";
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Only POST method is allowed";
}

echo json_encode($response);
?>
