import 'package:flutter/material.dart';
import 'package:project_uts/page/home_screen.dart';

import '../models/model_budaya.dart';

class DetailBudaya extends StatelessWidget {
  final Datum? data;

  const DetailBudaya({Key? key, this.data}) : super(key: key);

//   @override
//   State<DetailBudaya> createState() => _DetailBudayaState();
// }
//
// class _DetailBudayaState extends State<DetailBudaya> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF87CEEB),
          title: Text('Detail Budaya'),
        ),
        backgroundColor: Color(0xFF87CEEB),
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.all(8),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: Colors.white,
                        //       ),
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           Navigator.pop(context, HomeScreen());
                        //         },
                        //         child: Image.asset(
                        //           'images/back.png',
                        //           width: 20,
                        //           height: 20,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(width: 10),
                        //     Text(
                        //       'Detail Budaya',
                        //       style: TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.bold,
                        //         fontFamily: 'Rubik',
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 20),
                        // Padding(
                        //   padding: EdgeInsets.all(8),
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(10),
                        //     child: Image.network(
                        //       'http://192.168.1.113/budaya/${result.gambar}',
                        //       fit: BoxFit.fill,
                        //     ),
                        //   ),
                        // ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: data != null && data!.gambar.isNotEmpty
                              ? Image.network(
                            'http://192.168.1.113/kebudayaan/${data!.gambar}',
                            fit: BoxFit.fill,
                            width: 200,
                            height: 200,
                          )
                              : Container(),
                        ),
                        SizedBox(height: 20),
                        Text(
                          data?.judul ?? 'No Title',
                          // 'Judul Budaya',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik',
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          data?.konten ?? 'No Content',
                          // 'kontent',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rubik',
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
      ),
    );
  }
}
