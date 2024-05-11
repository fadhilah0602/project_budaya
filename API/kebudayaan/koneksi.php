<?php

$koneksi = mysqli_connect("localhost", "root", "", "budaya");

if($koneksi){

	// echo "Database berhasil Connect";
	
} else {
	echo "gagal Connect";
}

?>