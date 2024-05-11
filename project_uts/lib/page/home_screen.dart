import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uts/page/detail_budaya.dart';
import 'package:project_uts/page/galeri.dart';
import 'package:project_uts/page/login.dart';
import 'package:project_uts/page/profile.dart';
import 'package:project_uts/page/sejarawan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.white],
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Handwerker!",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Find Your Culture",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        icon: Icon(Icons.logout)),
                  ],
                ),
              ),
              // Text(
              //   "Find Your Culture",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //     fontSize: 20,
              //   ),
              // ),

              // Positioned(
              //   top: 120.0,
              //   left: 50.0,
              //   right: 50.0,
              //   child: AppBar(
              //     elevation: 12,
              //     backgroundColor: Colors.white,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(12)),
              //     ),
              //     leading: GestureDetector(
              //       onTap: () {
              //         // your action here
              //       },
              //       child: Icon(Icons.search),
              //     ),
              //     primary: false,
              //     title: TextField(
              //       decoration: InputDecoration(
              //         hintText: "Search...",
              //         border: InputBorder.none,
              //         hintStyle: TextStyle(color: Colors.grey),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                    ),
                    // Icon smile di sebelah kiri
                    suffixIcon: Icon(
                      CupertinoIcons.xmark,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20), // Sesuaikan nilai padding di sini
                  ),
                ),
              ),

              SizedBox(height: 30),
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
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 200),
                            // Atur lebar maksimum kartu di sini
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            'images/gambar6.png',
                                            width: 92,
                                            height: 87,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Judul Budaya',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Specialist medicineDENRFYDHJSKOEWKHFCNOLmx,iduefh\nwjdnhvdcbxns',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailBudaya()));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                    vertical: 10,
                                                  ),
                                                  backgroundColor:
                                                      Colors.blue.shade500,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Detail Info',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Icon(
                        isLoved ? Icons.favorite : Icons.favorite_border,
                        color: isLoved ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 20),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => LoginScreen()));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 10),
              //     child: Container(
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.all(Radius.circular(12))),
              //         child: Column(
              //           children: [
              //             Image.asset(
              //               'images/gambar2.png',
              //               width: 200,
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Dr. Fillegrub Grab',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 18),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Medicine Specialisthuewhdiqkedbhsfhdjqkehdwiqwksxhdfbndqouey387wyrhdjspoAJDSpecialisthuewhdiqkedbhsfhdjqkehdwiqwksxhdfbndqouey387wyrhdjspoAJD',
              //               style: TextStyle(),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             // Image.asset(
              //             //   'images/gambar3.png',
              //             //   scale: 2,
              //             // ),
              //           ],
              //         )),
              //   ),
              // ),
              // SizedBox(height: 20),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => LoginScreen()));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 10),
              //     child: Container(
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.all(Radius.circular(12))),
              //         child: Column(
              //           children: [
              //             Image.asset(
              //               'images/gambar2.png',
              //               width: 200,
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Dr. Fillegrub Grab',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 18),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Medicine Specialisthuewhdiqkedbhsfhdjqkehdwiqwksxhdfbndqouey387wyrhdjspoAJDSpecialisthuewhdiqkedbhsfhdjqkehdwiqwksxhdfbndqouey387wyrhdjspoAJD',
              //               style: TextStyle(),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             // Image.asset(
              //             //   'images/gambar3.png',
              //             //   scale: 2,
              //             // ),
              //           ],
              //         )),
              //   ),
              // ),
              // SizedBox(height: 20),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => LoginScreen()));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 10),
              //     child: Container(
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.all(Radius.circular(12))),
              //         child: Column(
              //           children: [
              //             Image.asset(
              //               'images/gambar2.png',
              //               width: 200,
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Dr. Fillegrub Grab',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 18),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Medicine Specialisthuewhdiqkedbhsfhdjqkehdwiqwksxhdfbndqouey387wyrhdjspoAJDSpecialisthuewhdiqkedbhsfhdjqkehdwiqwksxhdfbndqouey387wyrhdjspoAJD',
              //               style: TextStyle(),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             // Image.asset(
              //             //   'images/gambar3.png',
              //             //   scale: 2,
              //             // ),
              //           ],
              //         )),
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginScreen(),
                    //   ),
                    // );
                  },
                  child:
                      buildCircularIcon(Icons.home, Colors.white, Colors.blue),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GaleriPage(),
                      ),
                    );
                  },
                  child:
                      buildCircularIcon(Icons.photo, Colors.white, Colors.blue),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SejarawanPage(),
                      ),
                    );
                  },
                  child: buildCircularIcon(
                      Icons.favorite, Colors.white, Colors.blue),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProfilePage(currentUser: null,),
                //       ),
                //     );
                //   },
                //   child: buildCircularIcon(
                //       Icons.person, Colors.white, Colors.blue),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCircularIcon(IconData icon, Color iconColor, Color bgColor) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Ubah nilai sesuai kebutuhan
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
