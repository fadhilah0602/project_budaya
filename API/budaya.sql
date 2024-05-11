-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2024 at 01:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `budaya`
--

-- --------------------------------------------------------

--
-- Table structure for table `budaya`
--

CREATE TABLE `budaya` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `konten` text NOT NULL,
  `gambar` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `budaya`
--

INSERT INTO `budaya` (`id`, `judul`, `konten`, `gambar`) VALUES
(1, 'Upacara Ngaben, Tradisi Ritual Pembakaran Jenazah di Bali', 'Tujuan dari upacara Ngaben yakni tak jauh dari \\\'pembersihan\\\' amal seseorang yang meninggal dunia.\\r\\n\\r\\nSetiap anggota keluarga wajib untuk mengantarkan mendiang dalam memasuki kehidupan \\\"berikutnya\\\".\\r\\n\\r\\nSeperti jenis sistem kepercayaan lainnya, umat Hindu Bali percaya bahwa tubuh terdiri dari spiritual dan fisik.\\r\\n\\r\\nKetika kematian terjadi, masyarakat lokal percaya bahwa itu akan \\\'memadamkan\\\' fisik dan fungsi tubuh. Sementara, roh atau dikenal atma, akan tetap hidup selamanya.\\r\\n\\r\\nSelain itu, setelah \\\'membakar jenazah\\\' dan melarungkan abu ke sungai atau laut dapat membantu melepaskan Sang Atma (roh) dari belenggu keduniawian.\\r\\n\\r\\nSehingga setelah prosesi ngaben, dipercaya dapat mempermudah jenazah atau mendiang bersatu dengan Tuhan (Mokshatam Atmanam).', 'budaya1.jpg'),
(2, 'Karapan Sapi, Tradisi Pacu Hewan Kebanggaan Orang Madura', 'Dengan iringan saronen, orkes gamelan khas Madura, sapi-sapi itu diarak memasuki dan mengelilingi arena pacuan. Melemaskan otot-otot sekaligus memamerkan keindahan pakaian (ambhin) dan aksesori yang beraneka warna. Seusai parade, pakaian dan seluruh aksesori dilepas. Kecuali hiasan kepala (obet) yang berfungsi memberikan rasa percaya diri dan keperkasaan sapi. Setelah itu, perlombaan pun dimulai.\\r\\n\\r\\nDebu membumbung tinggi. Sepasang sapi yang mengenakan kaleles, sarana pelengkap untuk dinaiki tukang tongkok (joki atau sais), melaju kencang. Adu cepat melawan pasangan sapi lainnya. Kaleles beberapa kali melayang ke udara sementara si joki berusaha mengendalikan dan menunjukkan kelihaiannya. Sorak sorai penonton menambah semarak perlombaan.', 'budaya2.jpg'),
(6, 'Iki Palek, Tradisi Potong Jari dari Papua', 'Jika ada satu orang anggota keluarga yang meninggal, maka akan dipotong sebanyak satu jari. Sebagian besar yang melakukan potong jari ini adalah wanita. Namun, tak hanya para wanita saja, beberapa orang pria juga melakukannya untuk menunjukkan rasa kesedihan yang mendalam. Para pria biasanya tidak melakukan potong jari, melainkan memotong kulit telinga mereka.\r\n\r\nJari dianggap sebagai simbol harmoni, persatuan, dan kekuatan bagi Suku Dani. Di Suku Dani, ada kalimat yang mengatakan â€œwene opakima dapulik welaikarek mekehasikâ€. Kalimat tersebut memiliki arti lambang hidup bersama satu keluarga, marga, rumah, suku, nenek moyang, bahasa, sejarah, dan juga satu asal.', 'budaya3.jpg'),
(7, 'Tanam Sasi, Upacara Kematian Suku Marind Papua', 'Tanam sasi merupakan upacara adat kematian yang berkembang di Kabupaten Merauke. Upacara ini banyak dilakukan oleh masyarakat Suku Marind atau Marind-Anim yang mendiami wilayah dataran luas Papua Barat.\r\n\r\nMengutip dari budaya-indonesia.org, sasi mempunyai arti sejenis kayu yang menjadi media utama dari rangkaian upacara adat kematian ini. Sasi ditanam selama empat puluh hari setelah kematian seseorang.\r\n\r\nSelanjutnya, sasi akan dicabut kembali setelah 1.000 hari ditanam. Bukan sembarang kayu, kayu atau sasi yang digunakan memiliki makna bagi masyarakat suku Marind.\r\n\r\nSetidaknya, ada empat makna sasi yang dipegang teguh suku tersebut. Pertama, ukiran kayu khas Papua pada sasi melambangkan kehadiran roh nenek moyang.', 'budaya5.jpg'),
(8, 'Syukur Pada Alam, Ini Makna dan Sejarah Upacara Kasada dalam Eksotika Bromo', 'Pada zaman kerajaan Majapahit, putri Raja Majapahit bernama Roro Anteng menikah dengan Jaka Seger yang merupakan anak dari Brahmana. Selama beberapa tahun pernikahan, keduanya belum juga dikaruniai anak. Sehingga keduanya melakukan pertapaan di Gunung Bromo dengan maksud meminta keturunan kepada penunggu gunung,', 'budaya4.jpg'),
(9, 'Festival Tabuik, Perhelatan Akbar Masyarakat Pariaman', 'Festival Tabuik merupakan salah satu tradisi tahunan di dalam masyarakat Pariaman. Festival ini telah berlangsung sejak puluhan tahun lalu dan diperkirakan telah ada sejak abad ke-19 Masehi. Perhelatan tabuik merupakan bagian dari peringatan hari wafatnya cucu Nabi Muhammad SAW, yaitu Hussein bin Ali yang jatuh pada tanggal 10 Muharam. Sejarah mencatat, Hussein beserta keluarganya wafat dalam perang di Padang Karbala.\r\n\r\nTabuik sendiri diambil dari bahasa arab â€˜tabutâ€™ yang bermakna peti kayu. Nama tersebut mengacu pada legenda tentang kemunculan makhluk berwujud kuda bersayap dan berkepala manusia yang disebut buraq. Legenda tersebut mengisahkan bahwa setelah wafatnya sang cucu Nabi,', 'budaya6.jpg'),
(10, 'Merarik, Kawin Lari Suku Sasak Lombok, Tradisi Pria Menculik Wanita untuk Dijadikan Istri', 'Merarik adalah budaya kawin lari dalam tradisi Suku Sasak. Pelaksanaannya memiliki empat prinsip, yaitu kebanggaan perempuan, keberdayaan laki-laki dan ketidakberdayaan perempuan, kebersamaan, serta keuntungan ekonomi. Merarik memiliki makna yaitu keberanian bertanggung jawab, keteguhan mewujudkan pernikahan dan penyelesaian perkara melalui musyawarah.\r\n\r\nPelaksanaan\r\nTradisi merariâ€™ diawali dengan pinangan oleh pihak laki-laki ke pihak perempuan pada malam hari. Gadis yang dipinang kemudian dibawa lari untuk dijadikan sebagai istri. Jika terjadi perselisihan, maka perkara akan diselesaikan melalui musyawarah antara keluarga dari pihak laki-laki dan pihak perempuan. Apabila dalam musyawarah tidak ada mufakat, maka perkara dilanjutkan degan bantuan pemuka adat atau pemuka agama. Jika terjadi mufakat, maka kedua pihak akan menentukan jumlah mahar, tempat dan tanggal serta wali dalam pernikahan', 'budaya7.jpg'),
(11, 'Debus, Daya Pikat Seni Bela Diri Khas Banten', 'Debus Banten memuat tindakan-tindakan yang bersifat atraktif seperti pukulan badan yang terkesan tidak menyakiti pelaku. Namun Debus mempunyai ciri khas budaya dan nuansa daerah Banten.\r\n\r\nDebus Banten melibatkan aksi-aksi pukulan ke tubuh sendiri atau rekan setimnya menggunakan benda-benda tajam seperti pisau atau keris. Praktisi Debus sering mengenakan pakaian adat tradisional Banten saat melakukan pertunjukan. Mereka juga sering mengenakan jubah panjang yang berwarna putih sebagai bagian dari kostum pertunjukan.\r\n\r\nDebus adalah salah satu unsur yang mencerminkan identitas budaya masyarakat Banten.', 'budaya8.jpg'),
(12, 'Sejarah Dugderan, Menyambut Bulan Ramadhan di kota Semarang', 'Dugderan adalah tradisi perayaan menyambut bulan Ramadan yang dilakukan oleh umat Islam di Semarang, Jawa Tengah. Tradisi ini juga menjadi pesta rakyat tahunan bagi masyarakat Semarang.\r\nDigelarnya tradisi Dugderan awalnya sebagai upaya pemerintah untuk menyamakan awal puasa dan hari raya. Hingga saat ini, tradisi Dugderan masih diselenggarakan setiap tahunnya. Tradisi ini dikatakan sebagai salah satu cara masyarakat untuk mencurahkan rasa rindunya terhadap bulan Ramadan\r\n\r\nSejarah Tradisi Dugderan untuk Menyambut Bulan Ramadan\r\nMengutip dari buku Sejarah Islam Nusantara karya Rizem Aizid,', 'budaya9.jpg'),
(13, 'Ngurek, Ritual Ekstrem di Bali yang Sakral Sekaligus Menegangkan', 'Berbagai ritual masyarakat Hindu di Bali kerap menyita perhatian, salah satunya adalah tradisi Ngurek. Tradisi Ngurek atau di beberapa daerah disebut Ngunying adalah tradisi yang sangat ekstrem dengan cara menusuk diri sendiri menggunakan keris.\r\n\r\nMeski terlihat menegangkan, seseorang yang melakukannya tradisi Ngurek biasanya tidak dalam keadaan sadar atau kerauhan, sehingga mereka tidak merasa kesakitan.', 'budaya10.jpg'),
(14, 'Apa Itu Upacara Melasti Sebelum Nyepi? Ini Makna dan Tujuannya', 'Upacara Melasti merupakan upacara yang dilakukan sebelum perayaan Hari Suci Nyepi. Mengutip dari situs resmi Kebudayaan Kemdikbud, upacara Melasti adalah ritual ibadah penyucian diri yang dilaksanakan satu tahun sekali sebelum umat Hindu menyambut Tahun Baru Saka.\r\n\r\nUpacara Melasti atau Mekiyis dilaksanakan sebelum ibadah Tawur Kesanga dan Catur Bhrata Penyepian atau Hari Raya Nyepi Tahun Baru Caka. Ritual ibadah ini dilaksanakan di pura yang berdekatan dengan sumber air kehidupan (tirta amertha), seperti laut, danau, atau sungai.\r\n\r\nSebelum melaksanakan upacara Melasti, umat Hindu terlebih dahulu melaksanakan persembahyangan yang dipimpin oleh seorang Romo dan Pinandita. Romo dan Pinandita ini memimpin doa-doa dan membacakan kitab yang akan didengar oleh seluruh umat Hindu.', 'budaya11.jpg'),
(15, 'Menyaksikan Tradisi Perang Pandan di Tenganan Pegringsingan', 'Tradisi mekare-kare atau yang lebih dikenal sebagai perang pandan kembali digelar di Desa Tenganan Pegringsingan, Kecamatan Manggis, Kabupaten Karangasem, Bali, Kamis (23/6/2022). Masyarakat dan para wisatawan tampak antusias menyaksikan tradisi mekare-kare tahun ini. Terlebih lagi, selama dua tahun terakhir, tradisi mekare-kare digelar secara tertutup akibat pandemi COVID-19', 'budaya12.jpg'),
(16, 'Mengenal Mesuryak, Tradisi untuk Memberikan Bekal Pada Leluhur di Bali', 'Mesuryak merupakan tradisi yang bertujuan untuk mempersembahkan atau membekali leluhur yang turun pada hari raya Galungan agar kembali ke alam surga dengan damai dan tenang. Bekal yang dimaksud berupa sesajen, dimana dalam bentuk nyata salah satunya dengan memberikan uang. Masyarakat menyakini bahwa dengan memberi bekal kepada leluhur akan ada timbal balik berupa saling melindungi keturunannya dan memberikan kedamaian bagi keluarganya. Para leluhur akan kembali ke nirwana pada saat hari raya Kuningan.\r\n\r\nUpacara mesuryak dilakukan pada saat hari Raya Kuningan (10 hari setelah Galungan) setiap enam bulan sekali. Pelaksanaan upacara dilakukan pada pukul 09.00 hingga 12.00 WITA.', 'budaya13.jpg'),
(17, 'Mapasilaga Tedong, Hiburan Penghapus Duka Kematian di Tana Toraja', 'Mapasilaga Tedong juga sering disebut dengan Tedong Silaga. Ajang adu kuat dua kerbau ini punya makna tersendiri, menghapus duka mendiang keluarga yang ditinggal mati. Ritual pemakaman agung Rambu Solo memang selalu menarik perhatian masyarakat. Tak heran, ratusan bahkan ribuan warga turut meramaikan tradisi Mapasilaga Tedong.\r\n\r\nSelain sebagai hiburan bagi keluarga yang berduka, Mapasilaga Tedong turut menjadi objek wisata. Banyak wisatawan yang tertarik melihat serangkaian ritual yang melibatkan manusia dan kerbau khas Toraja. Bagi orang Tana Toraja, meskipun boleh ditangisi kematian merupakan kegembiraan tersendiri yang membawa manusia kembali menuju surga, asal-muasal leluhur.', 'budaya14.jpg'),
(18, 'Pasola, Ritual Adu Ketangkasan Berdarah yang Berasal dari Sumba', 'Pasola merupakan salah satu jenis ritual berupa permainan ketangkasan yang berasal dari wilayah Sumba bagian barat, Provinsi Nusa Tenggara Timur. Umumnya masyarakat mengenal Pasola sebagai permainan adu ketangkasan pria Sumba yang dilakukan dengan saling melempar lembing dari atas kuda.\r\n\r\nDilansir dari laman resmi Pemerintah Kabupaten Sumba Barat, nama Pasola berasal dari bahasa setempat yaitu â€˜solaâ€™ atau â€˜holaâ€™ yang berarti kayu lembing. Sebagai sebuah ritual, Pasola berasal dari ritual perang adat di mana ada dua kelompok yang saling berhadapan, saling mengejar, dan dilakukan sambil melemparkan lembing yang terbuat dari kayu ke arah lawan.\r\n\r\nSebagai salah satu ritual unik khas Sumba, atraksi Pasola sangat menarik untuk disaksikan oleh wisatawan. Terlebih karena Pasola hanya berlangsung sekali dalam setahun maka tak heran jika banyak wisatawan sengaja datang untuk menyaksikan ritual ini.', 'budaya15.jpg'),
(19, 'Mengenali Ritual Tiwah sebagai Kebudayaan Suku Dayak Ngaju', 'Ritual Tiwah adalah sebuah upacara adat yang masih dilestarikan di Kalimantan Tengah. Upacara ini berasal dari masyarakat Suku Dayak Ngaju dan merupakan salah satu upacara kematian adat terbesar dalam budaya mereka. Ritual Tiwah mempertemukan konsep kematian dengan keyakinan lokal Suku Dayak Ngaju, yaitu Kaharingan.Tujuan dan Makna Ritual Tiwah\r\nMemahami Pentingnya Upacara Kematian Bagi Suku Dayak Ngaju\r\n\r\nRitual Tiwah dilakukan untuk merayakan kehidupan seseorang yang telah meninggal dan dimakamkan dalam Runi atau peti mati. Tujuan utama dari ritual ini adalah untuk membantu arwah yang meninggal dalam perjalanan menuju Lewu Tatau, yaitu dunia roh dalam konsep kematian Dayak Ngaju. Selain itu, Ritual Tiwah juga dianggap sebagai cara untuk mengusir sial dan kesialan bagi keluarga yang ditinggalkan.', 'budaya16.jpg'),
(20, 'Mengenal Sekilas Tentang seni Rapa\'i Dabus Di Aceh Selatan', 'Kesenian tradisional ini hampir dimiliki oleh setiap Kecamatan di Aceh Selatan. Kesenian ini merupakan gabungan antara seni, agama dan ilmu metafisik (ilmu kebal). Kelompok kesenian ini mempunyai pemain minimal 10 orang yang dipimpin oleh seorang yang biasa disebut khalifah. Kesenian ini menggunakan alat musik yang disebut dengan rapaâ€™i (gendang yang terbuat dari kulit kambing). Kesenian ini umumnya melagukan syair-syair dan zikir dan pujian kepada Allah Sang Pencipta dan kepada  Rasulullah SAW sesuai dengan ajaran Islam.\r\n\r\nAsal-usulnya:\r\nKonon, menurut riwayat kaum sufi (abad ke 7 H), Rapaâ€™i Dabus ini berasal dari nyanyian-nyanyian (puisi yang berbentuk doa) yang dibacakan oleh seorang mursyid (pemimpin tarikat) dalam ajaran tasawuf-nya. Mursyid ini membacakan doa dan zikir dengan suara yang merdu dan lemah lembut dalam waktu lama, sampai dirinya dan pengikutnya tak sadarkan diri (fana billah). Fana billah inilah yang jadi tujuan untuk mencapai kepuasan batin dan  kelezatan jiwa.', 'budaya17.jpg'),
(21, 'Mengenal Tradisi Bakar Batu dari Suku Dani, Ritual Unik di Papua', 'Ritual ini berasal dari Papua dan umumnya diselenggarakan saat ada peristiwa penting, seperti kelahiran, kematian, perkawinan, hingga ucapan syukur atas hasil panen.\r\nTradisi unik tersebut dilakukan oleh suku Dani dari Lembah Baliem, Papua. Penamaan \"Bakar Batu\" ini disebabkan masyarakat Papua yang memasak dengan batu yang dibakar terlebih dahulu, \r\n\r\nSetelah dibakar, maka batu-batu tersebut dimasukkan ke dalam lubang kecil. Nantinya, bahan makanan seperti daging, umbi-umbian dan sayuran disusun tepat di atasnya dan dibiarkan hingga matang.', 'budaya18.jpg'),
(22, 'Sejarah Tari Sintren, Kesenian Bernuansa Mistis dari Cirebon', 'Tarian Sintren adalah salah satu kesenian tradisional yang ada di Cirebon, Jawa Barat. Sebagian orang meyakini jika tarian sintren ini merupakan suatu bentuk kesenian yang mengandung unsur mistis.\r\nDalam pementasannya, tarian sintren adalah sebuah seni tari yang dibawakan oleh seorang wanita dan didampingi satu orang dalang. Sama seperti seni tari pada umumnya, tarian sintren juga turut diiringi oleh alunan musik.\r\n\r\nSelain itu, dalam kesenian tari sintren, juga terdapat beberapa orang wanita yang bertugas sebagai penari pengiring.', 'budaya19.jpg'),
(23, 'Mengenal Peusijuk, Tradisi Warisan Leluhur Masyarakat Aceh', 'Aceh menjaga baik adat tradisinya. Salah satunya adalah peusijuk, ritual serupa tepung tawar. Peusijuk sering dilakukan terhadap pengantin baru, orang yang baru kena musibah, orang yang mau berhaji atau umrah. Prosesi ini juga kerap dipraktikkan saat orang baru beli kendaraan, membuka usaha, tinggal di rumah baru, hingga menyambut tamu.\r\n\r\nSelain itu, peusijuk juga menjadi salah satu adat yang dapat mendamaikan pertikaian kecil terjadi di tengah masyarakat di Aceh. Peusijuk biasanya dipimpin oleh tokoh atau tetua adat atau orang dituakan di masyarakat.\r\nâ€œPeusijuk ini merupakan proses mendinginkan atau musyawarah suasana-suasana yang mencekam disebabkan oleh pertikaian-pertikaian kecil yang terjadi di masyarakat, guna yang saling bertikaian ini saling memaafkan,â€ kata Kepala Bidang Benda Pusaka/Khazanah Adat Majelis Adat (MAA) Kota Banda Aceh, Hamid kepada media di Banda Aceh beberapa waktu lalu.', 'budaya20.jpg'),
(24, 'Mengenal Tradisi Mekiwuka yaitu Penyambutan Tahun Baru Dari Manado', 'Tradisi Mekiwuka adalah upacara adat suku Minahasa di Manado, dimana tradisi ini merupakan ungkapan rasa syukur atas pemeliharaan Tuhan di Sepanjang tahun yang sudah dilewati dan permohonan kepada Tuhan agar dibukakan jalan untuk memperoleh banyak berkat dalam menjalani tahun yang baru.Tradisi ini diselenggarakan dengan cara melakukan pawai yang dilakukan oleh seluruh warga kampung dengan memainkan alat musik sambal bernyanyi. Tradisi dilakukan saat tengah malam sampai dengan pergantian tahun baru yaitu subuh. Mereka juga mengunjungi setiap rumah dan berkunjung ke kepala lingkungan, kepala kelurahan, para tetua kampung.Biasanya diadakan pada 31 Desember setelah masyarakat melakukan ibadah ucapan syukur di gereja masing â€“ masing. Hingga saat ini Tradisi Mekiwuka masih dilaksanakan dan dilestarikan.', 'budaya21.jpg'),
(25, 'Tradisi Ngebabali Lampung, Dilakukan saat Akan Menempati Rumah Baru', 'Tradisi adat Ngebabali atau Ngababali berasal dari daerah Lampung Barat tepatnya di Desa Negeri Besar. Adat ini diyakini dapat mengabulkan permintaan seseorang. Selain itu, adat ini dilakukan untuk menghormati nenek moyang mereka.\r\nMenurut Rahman (2018) dalam Budaya Lokal Ngababali Dalam Pandangan Islam, Ngababali adalah kegiatan yang dilakukan oleh masyarakat lampung untuk menghormati nenek moyang dalam memperjuangkan desa mereka.\r\n\r\nBerikut detikSumut rangkum informasi tentang adat Ngebabali beseta dengan tujuan dan tata caranya.', 'budaya22.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sejarawan`
--

CREATE TABLE `sejarawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `asal` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sejarawan`
--

INSERT INTO `sejarawan` (`id`, `nama`, `foto`, `tanggal_lahir`, `asal`, `jenis_kelamin`, `deskripsi`) VALUES
(9, 'Asvi Warman Adam', 'sejarawan4.jpg', '1954-10-08', 'Bukittinggi, Sumatera Barat', 'Laki Laki', 'Asvi Warman Adam (lahir 8 Oktober 1954) merupakan salah seorang peneliti utama LIPI dan ahli sejarah Indonesia. Saat ini Asvi bergelut dalam penulisan sejarah Orde Lama dan Orde Baru. Asvi merupakan anak dari Adam Sutan Djamaris dan Meimunah. Ibunya merupakan istri pertama dari tiga istri ayahnya. Asvi bersaudara satu ayah dengan Asrif Adam, seorang jaksa tinggi yang terakhir berdinas di Yogyakarta. Asvi merupakan seorang sarjana Sastra Prancis lulusan Universitas Indonesia, setelah sebelumnya menamatkan gelar sarjana muda pada bidang yang sama di Universitas Gadjah Mada. Tahun 1984, dia belajar di Ã‰cole des Hautes Ã‰tudes en Sciences Sociales (EHESS) Paris, hingga meraih gelar doktor pada tahun 1990.'),
(10, 'Asep Kambali', 'sejarawan5.jpg', '1980-07-16', 'Cianjur, Jawa Barat', 'Laki Laki', 'Asep keluar dari zona nyaman dengan menanggalkan jabatan general manager hotel dan kehidupan finansial yang mapan pada tahun 2010. Ia berdalih ingin fokus kuliah sembari mengelola Komunitas Historia Indonesia yang didirikannya itu.Asep pernah bekerja sebagai Site Manager di Museum Bank Mandiri, General Manager di Roemahku Heritage Hotel, External Manager di Badan Pelestarian Pusaka Indonesia (BPPI), konsultan hubungan masyarakat (PR), serta menjadi Kepala Museum Samanhudi di Kota Solo,\r\n\r\nDewasa ini, masyarakat lebih mengenal Asep sebagai \"Guru Sejarah Keliling\" karena kiprahnya di bidang pendidikan sejarah. Dia kerap diundang menjadi pembicara, pemandu wisata sejarah, guru tamu, dan narasumber oleh berbagai instansi seperti sekolah, kampus, perusahaan dan berbagai institusi lain, mulai dari kalangan play group hingga kalangan profesional.Kemunculannya di publik pertama kali sejak tahun 2003.'),
(11, 'Azyumardi Azra', 'gambar/JPEG_20240511_024841_7769672812393208399.jpg', '1955-03-04', 'Lubuk Alung, Padang Pariaman, Sumatera Barat, Indonesia', 'Laki Laki', 'Azyumardi dikenal cerdas dalam jurnalisme sejak Mahasiswa, Aktivismenya yang tinggi mengantarkannya menjadi Ketua Umum HMI Cabang Ciputat era 1980-an. Ia memulai karier pendidikan tingginya sebagai mahasiswa sarjana di Fakultas Tarbiyah IAIN Syarif Hidayatullah Jakarta pada tahun 1982, kemudian atas bantuan beasiswa Fulbright, ia mendapakan gelar Master of Art (MA) pada Departemen Bahasa dan Budaya Timur Tengah, Universitas Columbia tahun 1988.[1] Ia memenangkan beasiswa Columbia President Fellowship dari kampus yang sama, tetapi kali ini Azyumardi pindah ke Departemen Sejarah, dan memperoleh gelar MA pada 1989.'),
(12, 'Bonnie Triyana', 'sejarawan7.jpg', '1979-06-27', 'Rangkasbitung, Banten, Indonesia ', 'Laki Laki', 'Bonnie lahir di Rangkasbitung, Banten, Indonesia pada 1979.Dia sempat tinggal di Sumatera untuk sementara waktu, dikarenakan ayahnya bekerja sebagai manajer perkebunan.Ia belajar sejarah di Universitas Diponegoro di Semarang, dan lulus sarjana pada tahun 2003. Pada tahun yang sama, ia bersama-sama mengedit (dengan Budi Setiyono) sebuah buku baru tentang pidato-pidato mantan presiden Indonesia Sukarno.\r\n\r\nTerinspirasi oleh majalah sejarah populer Brasil Istoria, Triyana mendirikan majalah sejarah bulanan berbahasa Indonesia Historia. Majalah ini dimulai sebagai situs web pada 2010 dan diluncurkan sebagai edisi cetak tahun 2012. Sejak itu ia dicari-cari pendapat tentang masalah sejarah di pers Indonesia; misalnya, pada 2014 penentangannya terhadap mantan presiden Indonesia Suharto dinyatakan sebagai Pahlawan Nasional Indonesia (pengusul calon presiden saat itu Prabowo Subianto).'),
(13, 'Didi Kwartanada', 'sejarawan8.jpg', '1968-02-03', 'Yogyakarta', 'Laki Laki', 'Didi Kwartanada dilahirkan pada tanggal 3 Februari 1968 di Yogyakarta. Ia menempuh pendidikan di Jurusan Ilmu Sejarah Fakultas Ilmu Budaya Universitas Gajah Mada, Yogyakarta dan program doktor di National University of Singapore. Dalam perjalanan kariernya, Didi Kwartanada banyak berkontribusi dalam berbagai proyek penelitian misalnya di LOCITA Research Center, Surabaya (1994-1997), Institute of Asia Pacific Studies, Waseda University (WIAPS), Tokyo (1998-2001), serta di Yayasan Nation Building (Nabil), Jakarta (2009-2017).[1] Saat ini ia berkecimpung sebagai sejarawan independen serta aktif dalam berbagai seminar maupun diskusi yang membahas tentang peranan etnis Tionghoa di Indonesia. Selain itu ia juga menuliskan sebuah buku biografi tokoh AR Baswedan.'),
(14, 'Gusti Asnan', 'sejarawan9.jpg', '1962-08-19', 'Lubuk Sikaping, Pasaman, Sumatera Barat', 'Laki Laki', 'Gusti Asnan lahir pasca-penumpasan Pemerintahan Revolusioner Republik Indonesia (PRRI) di Sumatra Tengah oleh pemerintah pusat. Pada masa-masa itu, banyak orang Minang yang mengadopsi nama-nama Jawaâ€”dengan makna tersendiriâ€”untuk menghindari diskriminasi orang-orang Jawa terhadap mereka. Menurut orang tuanya, nama â€˜Gustiâ€™ adalah singkatan dari nama bulan kelahirannya, yaitu Agustus dan nama bidan yang membantu persalinan ibunya ketika melahirkannya, yakni Eti, sementara â€˜Asnanâ€™ adalah singkatan dari nama ibu dan ayahnya: Asyiah dan Syahminan.\r\n\r\nGusti Asnan menghabiskan masa kecil bersama keluarganya di Lubuk Sikaping sampai tamat SMA sebelum akhirnya pindah ke Padang untuk melanjutkan pendidikan ke perguruan tinggi. Setelah tamat sarjana dari Jurusan Sejarah, Fakultas Sastra, Unand pada tahun 1986, ia melanjutkan studi ke Fakultas Ilmu Sosial dan Humaniora, Universitas Bremen di Jerman.'),
(15, 'Hilmar Farid', 'sejarawan10.jpg', '1968-03-08', 'Jakarta', 'Laki Laki', 'Pada 1994, bersama beberapa seniman, peneliti, aktivis, dan pekerja budaya di Jakarta, ia mendirikan Jaringan Kerja Budaya dan menerbitkan bacaan cetak berkala Media Kerja Budaya.'),
(16, 'JJ Rizal', 'sejarawan11.jpg', '1974-02-12', 'Jakarta', 'Laki Laki', 'JJ Rizal, S.S. adalah sejarawan yang terlibat sebagai intelektual publik dengan aktif menyikapi persoalan-persoalan di tengah masyarakat melalui tulisan-tulisan di berbagai media cetak dan online serta nara sumber untuk beberapa stasiun radio dan TV. Ia menyelesaikan kuliah pada 1998 di Jurusan Sejarah, Fakultas Sastra Universitas Indonesia (FSUI), dengan skripsi berjudul â€œSitor Situmorang: Biografi Politik 1956-1967.â€ Beberapa bagian skripsinya ini kemudian diterbitkan pada 2014 dalam buku Sitor Situmorang: Biografi Pendek 1924-2014 sebagai obituari panjang ketika sastrawan itu meninggal pada 21 Desember 2014. Selain itu ia juga mengumpulkan dan menjadi penyunting hampir semua karya Sitor dari mulai sajak, cerpen, esei, cerita anak, drama, dll'),
(17, 'Mestika Zed', 'sejarawan12.jpg', '1955-09-19', 'Batu Hampar, Lima Puluh Kota, Sumatera Barat', 'Laki Laki', 'Prof. Dr. Mestika Zed, M.A. (19 September 1955 â€“ 1 September 2019) adalah sejarawan Indonesia. Ia merupakan guru besar sejarah di Universitas Negeri Padang. Ia aktif menulis buku serta sebagai kolumnis.\r\n\r\nMestika Zed merupakan sedikit dari sejarawan Indonesia yang saat ini giat meluruskan dan mengoreksi sejarah bangsa, terutama terkait dengan peran tanah kelahirannya, Sumatra, yang selama ini selalu dipinggirkan dalam buku-buku sejarah nasional. Ia aktif meluruskan sejarah Pemerintahan Darurat Republik Indonesia, Pemerintahan Revolusioner Republik Indonesia, dan sejarah Giyugun Sumatra, tiga peristiwa penting dalam sejarah Indonesia yang berpusat di Bukittinggi dan Padang (Sumatera Barat), yang selama ini diabaikan dan bahkan mendapat tempat tak terhormat dalam sejarah Indonesia.'),
(18, 'Nugroho Notosusanto', 'sejarawan13.jpg', '1930-07-15', 'Rembang, Jawa Tengah', 'Laki Laki', 'Brigadir Jenderal TNI (Purn.) Prof. Dr. Raden Panji Nugroho Notosusanto (15 Juli 1930 â€“ 3 Juni 1985) adalah seorang penulis cerpen Indonesia yang menjadi sejarawan militer yang menjabat sebagai guru besar sejarah di Universitas Indonesia. Lahir dari keluarga bangsawan di Jawa Tengah, ia menunjukkan rasa nasionalisme yang tinggi sejak usia muda. Selama Revolusi Nasional Indonesia dari 1945 hingga 1949, ia terlibat dinas aktif sebagai anggota Tentara Pelajar, bekerja di pengintaian. Meski ingin tetap di militer, di bawah pengaruh ayahnya ia melanjutkan pendidikan, akhirnya mendaftar di Fakultas Sastra Universitas Indonesia. Selama tahun 1950-an ia menulis secara ekstensif dan aktif di berbagai kelompok politik dan akademis, akhirnya lulus dengan gelar sarjana sejarah pada tahun 1958.'),
(19, 'Rushdy Hoesein', 'sejarawan14.jpg', '1945-06-04', 'Jatinegara, Jakarta Timur', 'Laki Laki', 'Dr. dr. Rushdy bin Hoesein bin Umar Alaydrus, M.Hum. (lahir 4 Juni 1945) adalah sejarawan Indonesia yang keturunan Arab-Indonesia Golongan Alawiyyin marga Alaydrus. Ia masih ada hubungan keluarga dengan Habib Husain bin Abu Bakar Alaydrus atau Habib Luar Batang. Sejak ia masuk dalam dunia sejarah, ia aktif menjadi narasumber dan pembicara di berbagai kesempatan dan sering kali muncul dalam televisi atau media cetak/online. Beliau sangat aktif menulis, baik di laman Facebooknya mau di blog buatannya sendiri yang diberi nama Sejarah Kita. Saat ini ia aktif sebagai ketua dewan pembina pada komunitas sejarah terbesar di Indonesia yaitu Komunitas Historia Indonesia (KHI).'),
(20, 'Sartono Kartodirdjo', 'sejarawan15.jpg', '1921-02-15', 'Wonogiri', 'Laki Laki', 'Prof. Dr. A. Sartono Kartodirdjo adalah sejarawan Indonesia sekaligus pelopor dalam penulisan sejarah dengan pendekatan multidimensi. Sebelum menjadi guru, pria yang akrab disapa Sartono ini menyelesaikan pendidikan di HIS, MULO, dan HIK. Saat bersekolah di HIK (sekolah calon bruder), pria kelahiran Wonogiri, 15 Februari 1921 ini dilatih kepekaan batin dan ketajaman intuisinya yang menuntunnya menjadi sosok ilmuwan yang asketis.\r\n\r\nSaat usianya menginjak 44 tahun, Sartono menyelesaikan pendidikan sarjana di Fakultas Sastra Universitas Indonesia di sela-sela kegiatan mengajar di salah satu sekolah yang ada di Jakarta. Lalu melanjutkan pendidikan master degree di Universitas Yale, Amerika Serikat setelah sebelumnya mengajar di Universitas Gajah Mada Jogjakarta dan IKIP Bandung. Ia lulus pada tahun 1964 disusul melanjutkan pendidikan doktoralnya dua tahun kemudian.'),
(21, 'Slamet Muljana', 'sejarawan16.jpg', '1929-03-21', 'Yogyakarta', 'Laki Laki', 'Slamet Muljana memperoleh gelar B.A. dari Universitas Gadjah Mada tahun 1950, gelar M.A. dari Universitas Indonesia tahun 1952, gelar Doktor Sejarah dan Filologi dari Universitas Louvain, Belgia, tahun 1954, serta menjadi profesor pada Universitas Indonesia sejak tahun 1958.\r\n\r\nSlamet Muljana pernah mengajar di Universitas Gadjah Mada, IKIP Bandung (Universitas Pendidikan Indonesia sekarang), Akademi Penerangan, dan Akademi Jurnalistik. Selain itu ia juga pernah mengajar di luar negeri, antara lain, Wolfgang Goethe Universitat (Frankfurt, Jerman), State University of New York (Albany, Amerika Serikat), dan Nanyang University of Singapore (Singapura). Serta ia pernah pula menjabat sebagai direktur Institut untuk Bahasa dan Kebudayaan di Singapura, serta menjadi anggota dewan kurator pada Institute of Southeast Asian Studies di Singapura.'),
(22, 'Soe Hok Gie', 'sejarawan17.jpg', '1942-12-17', 'Jakarta', 'Laki Laki', 'Soe merupakan seorang etnis Tionghoa yang menganut Katolik Roma. Leluhurnya berasal dari provinsi Hainan, Republik Rakyat Tiongkok. Ayahnya bernama Soe Lie Piet alias Salam Sutrawan. Ia anak keempat dari lima bersaudara di keluarganya; kakaknya Arief Budiman, seorang sosiolog dan dosen di Universitas Kristen Satya Wacana, juga cukup kritis dan vokal dalam politik Indonesia.'),
(23, 'Taufik Abdullah', 'sejarawan18.jpg', '1936-01-03', 'Bukittinggi, Sumatera Barat', 'Laki Laki', 'Taufik memperoleh gelar kesarjanaannya dari Jurusan Sejarah Fakultas Sastra & Kebudayaan UGM Yogyakarta (1961). Kemudian dia melanjutkan pendidikannya hingga memperoleh gelar master dan doktor di Universitas Cornell, Ithaca, Amerika Serikat (1970). Disertasinya Scholl and Politics: The Kaum Muda Movement in West Sumatra, diterbitkan oleh Universitas Cornell pada tahun 1971. Selain jalur formal, dia juga pernah mengikuti orientasi program East-West Centre di Universitas Hawaii, Honolulu, Amerika'),
(24, 'Kuntowijoyo', 'sejarawan19.jpg', '1943-09-18', 'Sanden, Bantul, Yogyakarta', 'Laki Laki', 'Kuntowijoyo mendapatkan pendidikan formal keagamaan di Madrasah Ibtidaiyah di Ngawonggo, Klaten. Ia lulus SMP di Klaten dan SMA di Solo, sebelum lulus sarjana Sejarah Universitas Gadjah Mada pada tahun 1969. Gelar MA American History diperoleh dari Universitas Connecticut, Amerika Serikat pada tahun 1974, dan Ph.D Ilmu Sejarah dari Universitas Columbia pada tahun 1980. Ia mengajar di Fakultas Sastra Universitas Gadjah Mada dan terakhir menjadi Guru Besar Fakultas Ilmu Budaya, dan menjadi peneliti senior di Pusat Studi dan Penelitian Kependudukan Universitas Gadjah Mada, Yogyakarta.'),
(25, 'Djoko Suryo', 'sejarawan20.jpg', '1939-12-30', 'Yogyakarta', 'Laki Laki', 'Djoko Suryo atau KRT Suryohadibroto (lahir 30 Desember 1939) adalah guru besar sejarah di Universitas Gadjah Mada, Indonesia. Namanya dikenal sebagai sejarawan yang telah berkiprah melalui penelitiannya, baik di dalam negeri maupun mancanegara. Djoko Suryo merupakan salah satu tim perumus kurikulum pendidikan di Kementrian Pendidikan dan Kebudayaan, baik dalam lingkungan direktorat pendidikan tinggi/Dikti untuk kurikulum universitas, maupun kurikulum dasar dan menengah, termasuk untuk mata pelajaran sejarah. Atas pengabdiannya kepada Keraton Yogyakarta, dia mendapatkan gelar kehormatan Kanjeng Raden Tumenggung (KRT).'),
(26, 'Mohammad Yamin', 'sejarawan21.jpg', '1903-08-24', 'Talawi, Sawahlunto', 'Laki Laki', 'Mohammad Yamin dilahirkan di Talawi, Sawahlunto pada 24 Agustus 1903. Ia merupakan putra dari pasangan Usman Baginda Khatib dan Siti Saadah yang masing-masing berasal dari Sawahlunto dan Padang Panjang. Ayahnya memiliki enam belas anak dari lima istri, yang hampir keseluruhannya kelak menjadi intelektual yang berpengaruh. Saudara-saudara Yamin antara lain: Muhammad Yaman, seorang pendidik; Djamaluddin Adinegoro, seorang wartawan terkemuka; dan Ramana Usman, pelopor korps diplomatik Indonesia. Selain itu sepupunya, Mohammad Amir, juga merupakan tokoh pergerakan kemerdekaan Indonesia.'),
(27, 'Ichwan Azhari', 'sejarawan22.jpg', '1961-11-16', 'Medan, Sumatera Utara', 'Laki Laki', 'Ichwan Azhari (lahir 16 November 1961) adalah seorang sejarawan, pengajar dan ahli filologi (filolog) Indonesia. Ia merupakan Ketua Pusat Studi Sejarah dan Ilmu-Ilmu Sosial (Pussis) Universitas Negeri Medan (Unimed), Medan, Sumatera Utara.[1] Ichwan Azhari juga dipercaya sebagai Ketua Asosiasi Museum Indonesia (AMI) Sumatera Utara.[2]\r\n\r\nPada April 2006 Ichwan mendirikan Pustaka Humaniora (Pusra) dengan koleksi dokumen serta arsip-arsip lama sejarah Nusantara yang ia dapatkan dari perburuannya selama tujuh tahun di berbagai perpustakaan dan kampus di Belanda dan Jerman, serta sumbangan dari kolega dan berbagai instansi pemerintah.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'fadhilahfebriani', 'fadhilahfebriani@gmail.com', '$2y$10$N/FIUINWHMaxoXKIan9MJe9ngx/Hq5Wx4cdCXRS3HPLPmJtFZ/4Em'),
(2, 'hafizah', 'hafizah@gmail.com', '$2y$10$oO2UBfSV5Fh5n/ubE418fuIguq6Pg1TpXRiQLDg2GI4eyHTraNqvm'),
(3, 'reviska1', 'reviska1@gmail.com', '$2y$10$6jzOPS5LInx6up1yBv.0YuJwLgZSzN/xFtOQr9WnbB8Liy7YBvGEm'),
(4, 'testedit', 'testedit@gmail.com', '$2y$10$9x4vFGKCgiHh2hRohyMNYOcfQaeNE0M9PzVadXi9NyWe1vRSq5dRW'),
(5, 'joko1', 'joko1@gmail.com', '$2y$10$H4hnXV6YPKAovizMXrtcXefRiZEwWj.kAqmPHUkekTq3VELxWQJUq'),
(6, 'coba1', 'coba1@gmail.com', '$2y$10$bT8ztKBm.sZIq9zK4SlnVOs5yx.K9dRIDCg6yU267s9YG/d3mgH8G'),
(7, 'tes1', 'tes1@gmail.com', '$2y$10$1G8AP7kff2J7.umAOyHOqOd0RC8q1qbl9PXCAgxf51hOgCJxDLJZi'),
(8, 'dila1', 'dila1@gmail.com', '$2y$10$ZrB9jmwgYriYbh1yOfWQ2uS545oXpkXtHGJT5a4LkIeZ8DDXKWnvO'),
(9, 'fadhilah febriani', 'fadhillahfebriani13@gmail.com', '$2y$10$n1tVifTbrBckrIcxTyOHw.w0YsMHEWnj2s6obL/9sD1F63mKddDTK'),
(10, 'testt', 'testt@gmail.com', '$2y$10$pDi/21aTNuSEWbYohMcS1uOQKRNN9E1v89fXGyEYZA33a8hkZQRX.'),
(11, 'jojo', 'jojo@gmail.com', '$2y$10$REwKll07Qd.r9UExib7/WuV7yYWrqyQswp0NlbMKgIKP6Hr0nLTj6'),
(12, 'laptop', 'laptop@gmail.com', '$2y$10$MoMcHqqoze5IU0TcxOcnLuDLNDhLahxQJpabeO7fhBno.Fx86L6Je'),
(14, 'ujicoba1', 'ujicoba1@gmail.com', '$2y$10$jhZ4LE72zyzt/0Zkvdtf4.Vtzst2YWe1k21U0M/gOVGCrRg6VVAH.'),
(15, 'kipas', 'kipas@gmail.com', '$2y$10$immt1LCE94sin3NvC7z2YuldtAi/vMhLZaSUjIqTCd9g9zwsTpVwa'),
(17, 'widya', 'widya@gmail.com', '$2y$10$eZlYs.YxewiOmymyLzA84OV0/Tfw3mLjnosiVw1MYobGyT0AfyrYu'),
(18, 'hani1', 'hani1@gmail.com', '$2y$10$4oVwFOwwU/oJ0Z2LAoMovucpPjFgZh0b9JYPEqPZFRkHSwOiw6BCK'),
(20, 'renaldy1', 'renaldy1@gmail.com', '$2y$10$U0erGn/UP8mkwo4nDcXeFe5yXJ9sGseii1RsiBNiXBxtyApVzrsYG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `budaya`
--
ALTER TABLE `budaya`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sejarawan`
--
ALTER TABLE `sejarawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `budaya`
--
ALTER TABLE `budaya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `sejarawan`
--
ALTER TABLE `sejarawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
