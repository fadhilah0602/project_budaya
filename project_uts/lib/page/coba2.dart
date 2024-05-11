import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uts/page/add_sejarawan.dart';
import 'package:project_uts/page/coba.dart';
import '../models/model_sejarawan.dart';
import 'edit_sejarawan.dart';

class SejarawanPage1 extends StatefulWidget {
  const SejarawanPage1({super.key});

  @override
  State<SejarawanPage1> createState() => _SejarawanPage1State();
}

class _SejarawanPage1State extends State<SejarawanPage1> {
  int _selectedIndex = 0;
  late List<Datum> _sejarawanList;
  late List<Datum> _filteredSejarawanList;
  late bool _isLoading;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _fetchSejarawan();
    _filteredSejarawanList = [];
  }

  Future<void> _fetchSejarawan() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.113/kebudayaan/sejarawan.php'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      setState(() {
        _sejarawanList =
            List<Datum>.from(parsed['data'].map((x) => Datum.fromJson(x)));
        _filteredSejarawanList = _sejarawanList;
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load pegawai');
    }
  }

  void _filterSejarawanList(String query) {
    setState(() {
      _filteredSejarawanList = _sejarawanList
          .where((sejarawan) =>
              sejarawan.nama.toLowerCase().contains(query.toLowerCase()) ||
              sejarawan.asal.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _editSejarawan(int index, Datum updatedSejarawan) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.113/kebudayaan/updateSejarawan.php'),
      body: {
        "id": updatedSejarawan.id.toString(),
        "nama": updatedSejarawan.nama,
        "foto": updatedSejarawan.foto,
        "tanggal_lahir": updatedSejarawan.tanggal_lahir,
        "asal": updatedSejarawan.asal,
        "jenis_kelamin": updatedSejarawan.jenis_kelamin,
        "deskripsi": updatedSejarawan.deskripsi,
      },
    );
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      if (parsed['isSuccess']) {
        setState(() {
          _sejarawanList[index] = updatedSejarawan;
          _filteredSejarawanList = List.from(_sejarawanList);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(parsed['message'])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(parsed['message'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to edit sejarawan')),
      );
    }
  }

  Future<void> _deleteSejarawan(int index) async {
    final sejarawanToDelete = _sejarawanList[index];
    final response = await http.post(
      Uri.parse('http://192.168.1.113/kebudayaan/deleteSejarawan.php'),
      body: {"id": sejarawanToDelete.id.toString()},
    );
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      if (parsed['isSuccess']) {
        setState(() {
          _sejarawanList.removeAt(index);
          _filteredSejarawanList = List.from(_sejarawanList);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(parsed['message'])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(parsed['message'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete sejarawan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF87CEEB),
      //   title: Text('Sejarawan'),
      // ),
      backgroundColor: Color(0xFF87CEEB),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        // Action to perform when IconButton is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BudayaPage1(),
                          ),
                        );
                      },
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(16.0),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.white,
                    //   ),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => BudayaPage1(),
                    //         ),
                    //       );
                    //     },
                    //     child: Image.asset(
                    //       'images/back.png',
                    //       width: 20,
                    //       height: 20,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: 10),
                    Text(
                      'List Sejarawan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rubik',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterSejarawanList,
                    decoration: InputDecoration(
                      labelText: 'Search Sejarawan',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredSejarawanList.length,
                    itemBuilder: (context, index) {
                      final sejarawan = _filteredSejarawanList[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "http://192.168.1.113/kebudayaan/${sejarawan.foto}"),
                          ),
                          title: Text(sejarawan.nama),
                          subtitle: Text(sejarawan.asal),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Buat ModelSejarawan baru dengan satu objek Datum dalam list data
                                  ModelSejarawan modelSejarawan =
                                      ModelSejarawan(
                                    isSuccess: true,
                                    message: "Success",
                                    data: [
                                      sejarawan
                                    ], // Masukkan objek Datum ke dalam list data
                                  );

                                  // Navigasi ke halaman EditSejarawanPage dengan memberikan parameter yang diperlukan
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditSejarawanPage(
                                          sejarawan: modelSejarawan),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.blue,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SejarawanDeleteScreen(
                                        deleteSejarawan: () {
                                          _deleteSejarawan(index);
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SejarawanDetailScreen(
                                        sejarawan: sejarawan,
                                      )),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSejarawan(),
            ),
          );
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   backgroundColor: Color(0xFF87CEEB),
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.blue,
      //   showSelectedLabels: true,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.newspaper),
      //       label: 'Budaya',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.photo_camera),
      //       label: 'Photo',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.people_alt_sharp),
      //       label: 'Sejarawan',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'User',
      //     ),
      //   ],
      // ),
    );
  }
}

class SejarawanDeleteScreen extends StatelessWidget {
  final Function() deleteSejarawan;

  const SejarawanDeleteScreen({
    Key? key,
    required this.deleteSejarawan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text('Delete Sejarawan'),
      ),
      backgroundColor: Color(0xFF87CEEB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Apakah Anda yakin ingin menghapus Sejarawan ini?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                deleteSejarawan();
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => SejarawanPage1()),
                // );
                Navigator.pop(context);
              },
              child: Text('Ya, Hapus'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}

class SejarawanDetailScreen extends StatelessWidget {
  final Datum sejarawan;

  const SejarawanDetailScreen({
    Key? key,
    required this.sejarawan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _namaController =
        TextEditingController(text: sejarawan.nama);
    TextEditingController _fotoController =
        TextEditingController(text: sejarawan.foto);
    TextEditingController _tanggal_lahirController =
        TextEditingController(text: sejarawan.tanggal_lahir);
    TextEditingController _asalController =
        TextEditingController(text: sejarawan.asal);
    TextEditingController _jenis_kelaminController =
        TextEditingController(text: sejarawan.jenis_kelamin);
    TextEditingController _deskripsiController =
        TextEditingController(text: sejarawan.deskripsi);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text('Sejarawan Detail'),
      ),
      backgroundColor: Color(0xFF87CEEB),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: sejarawan != null && sejarawan!.foto.isNotEmpty
                  ? Image.network(
                      'http://192.168.1.113/kebudayaan/${sejarawan!.foto}',
                      fit: BoxFit.fill,
                      width: 200,
                      height: 200,
                    )
                  : Container(),
            ),
            SizedBox(height: 16),
            Text(
              'Nama: ${_namaController.text}',
              style: TextStyle(fontSize: 16),
            ),
            // Text(
            //   'Foto: ${_fotoController.text}',
            //   style: TextStyle(fontSize: 16),
            // ),
            SizedBox(height: 16),
            Text(
              'Tanggal Lahir: ${_tanggal_lahirController.text}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Asal: ${_asalController.text}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Jenis Kelamin: ${_jenis_kelaminController.text}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi: ${_deskripsiController.text}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
