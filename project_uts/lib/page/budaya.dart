import 'package:flutter/material.dart';
import 'package:project_uts/page/home_screen.dart';
import 'package:project_uts/page/profile.dart';
import 'package:project_uts/page/sejarawan.dart';
import 'package:project_uts/page/signup.dart';

import '../models/model_budaya.dart';
import '../models/model_user.dart';
import '../utils/session_manager.dart';
import 'detail_budaya.dart';
import 'galeri.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class BudayaPage extends StatefulWidget {
  const BudayaPage({Key? key}) : super(key: key);

  @override
  State<BudayaPage> createState() => _BudayaPageState();
}

class _BudayaPageState extends State<BudayaPage> {
  bool isLoved = false;
  late TextEditingController _searchController;
  List<Datum> _beritaList = [];

  late ModelUsers currentUser; // Deklarasikan currentUser

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      );
    } else if (index == 3) {
      // Arahkan ke ProfilePage jika currentUser valid
      if (currentUser != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(currentUser: currentUser),
          ),
        );
      } else {
        // Tangani skenario ketika currentUser tidak valid
        print('Log Data pengguna tidak tersedia!');
      }
    }
  }

  String? username;

  Future<void> getDataSession() async {
    bool hasSession = await sessionManager.getSession();
    if (hasSession) {
      setState(() {
        username = sessionManager.username;
        print('Log Data session: $username');
        // Inisialisasikan currentUser dengan data pengguna dari sessionManager
        currentUser = ModelUsers(
          id: int.parse(sessionManager.id!),
          username: sessionManager.username!,
          email: sessionManager.email!,
        );
      });
    } else {
      print('Log Session tidak ditemukan!');
    }
  }

  Future<void> _fetchBerita() async {
    try {
      http.Response res = await http.get(
        Uri.parse('http://localhost/budaya/budaya.php'),
      );
      if (res.statusCode == 200) {
        setState(() {
          _beritaList = modelBeritaFromJson(res.body).data;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void _filterBeritaList(String query) {
    List<Datum> filteredBeritaList = _beritaList
        .where((berita) =>
            berita.judul.toLowerCase().contains(query.toLowerCase()) ||
            berita.konten.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _beritaList = filteredBeritaList;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _fetchBerita();
    getDataSession(); // Panggil fungsi untuk memuat data sesi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Hi, ${username ?? 'Guest'}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 16),
                                        Column(
                                          children: [
                                            Text(
                                              'Logout',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 38,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Are you sure want to logout?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Tutup dialog saat tombol ditekan
                                          },
                                          child: Text(
                                            "Cancel",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            // Clear session
                                            setState(() {
                                              sessionManager.clearSession();
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()),
                                                (route) => false,
                                              );
                                            });
                                          },
                                          child: Text(
                                            "Ok",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.logout),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Find Your Culture',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _searchController.clear();
                                  _fetchBerita();
                                },
                                icon: Icon(Icons.search),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: _filterBeritaList,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                  });
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLoved = !isLoved;
                          });
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: _beritaList.length,
                                      itemBuilder: (context, index) {
                                        Datum result = _beritaList[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailBudaya(data: result),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Image.asset(
                                                          'images/gambar4.png',
                                                          width: 92,
                                                          height: 87,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Judul Budaya',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text(
                                                            'Konten',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(height: 4),
                                                          SizedBox(height: 4),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 150,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              DetailBudaya()));
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 30,
                                                                vertical: 10,
                                                              ),
                                                              backgroundColor:
                                                                  Colors.blue
                                                                      .shade500,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              'Detail Budaya',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 16,
                              right: 10,
                              child: Icon(
                                isLoved
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isLoved ? Colors.red : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BudayaPage(),
                  ),
                );
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GaleriPage(),
                  ),
                );
              },
              icon: Icon(Icons.image),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SejarawanPage(),
                  ),
                );
              },
              icon: Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                        currentUser:
                            currentUser), // Menyertakan currentUser ke halaman profil
                  ),
                );
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
