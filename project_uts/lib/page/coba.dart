import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_uts/page/profile.dart';

import '../models/model_budaya.dart';
import '../models/model_user.dart';
import '../utils/session_manager.dart';
import 'coba2.dart';
import 'detail_budaya.dart';
import 'galeri.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class BudayaPage1 extends StatefulWidget {
  const BudayaPage1({Key? key}) : super(key: key);

  @override
  State<BudayaPage1> createState() => _BudayaPage1State();
}

class _BudayaPage1State extends State<BudayaPage1> with WidgetsBindingObserver {
  bool isLoved = false;
  String? userName;
  String? userEmail;
  int _currentIndex = 0;
  TextEditingController _searchController = TextEditingController();
  late List<Datum> _budayaList;
  late List<Datum> _filteredBudayaList;
  late bool _isLoading;

  late ModelUsers currentUser; // Deklarasikan currentUser

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GaleriPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SejarawanPage1()),
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

  Future<void> _fetchBudaya() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.113/kebudayaan/budaya.php'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      setState(() {
        _budayaList =
            List<Datum>.from(parsed['data'].map((x) => Datum.fromJson(x)));
        _filteredBudayaList = _budayaList;
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load pegawai');
    }
  }

  void _filterBudayaList(String query) {
    setState(() {
      _filteredBudayaList = _budayaList
          .where((budaya) =>
              budaya.judul.toLowerCase().contains(query.toLowerCase()) ||
              budaya.konten.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    // _searchController = TextEditingController();
    _fetchBudaya();
    _filteredBudayaList = [];
    getDataSession(); // Panggil fungsi untuk memuat data sesi
  }

  Future<void> _refreshData() async {
    // Simulate a long-running operation
    await Future.delayed(Duration(seconds: 2));

    // Fetch new data or update existing data
    // For example, you can fetch data from an API
    setState(() {
      getDataSession();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getDataSession();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF87CEEB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text(
                      //   'Find Your Culture',
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily: 'Rubik',
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Text(
                        'Hi, ${username ?? 'Guest'}',
                        style: TextStyle(
                          fontSize: 16,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterBudayaList,
                      decoration: InputDecoration(
                        labelText: 'Search Budaya',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  // TextField(
                  //   controller: _searchController,
                  //   onChanged: _filterBeritaList,
                  //   decoration: InputDecoration(
                  //     labelText: 'Search',
                  //     prefixIcon: Icon(Icons.search),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: _filteredBudayaList.length,
                        itemBuilder: (context, index) {
                          final result = _filteredBudayaList[index];
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'http://192.168.1.113/kebudayaan/${result.gambar}',
                                        fit: BoxFit.fill,
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(result.judul),
                                    subtitle: Text(
                                      result.konten,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: BottomNavigationPage(
        onItemTapped: _onItemTapped, // Pass the _onItemTapped function
      ),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  final Function(int) onItemTapped; // Define a function parameter
  const BottomNavigationPage({Key? key, required this.onItemTapped})
      : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 4, vsync: this); // Change length to 4 for 4 tabs
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        controller: tabController,
        onTap: widget.onItemTapped,
        tabs: const [
          Tab(
            text: "Berita",
            icon: Icon(Icons.newspaper),
          ),
          Tab(
            text: "Gallery",
            icon: Icon(Icons.photo_camera),
          ),
          Tab(
            text: "Sejarawan",
            icon: Icon(Icons.people_alt_sharp),
          ),
          Tab(
            // New Tab
            text: "Users",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
