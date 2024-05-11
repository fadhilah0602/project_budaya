import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_uts/page/home_screen.dart';

import '../models/model_budaya.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class GaleriPage extends StatefulWidget {
  const GaleriPage({super.key});

  @override
  State<GaleriPage> createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  late Future<ModelBerita> futureBudaya;

  @override
  void initState() {
    super.initState();
    futureBudaya = fetchBudaya();
  }

  Future<ModelBerita> fetchBudaya() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.113/kebudayaan/budaya.php'));
    if (response.statusCode == 200) {
      return ModelBerita.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Budaya');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text('Gallery Page'),
      ),
      backgroundColor: Color(0xFF87CEEB),
      body: Center(
        child: FutureBuilder<ModelBerita>(
          future: futureBudaya,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10, // Horizontal space between items
                    mainAxisSpacing: 10, // Vertical space between items
                  ),
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index) {
                    var imageUrl =
                        "http://192.168.1.113/kebudayaan/${snapshot.data!.data[index].gambar}";
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(imageUrl: imageUrl),
                          ),
                        );
                      },
                      child: Hero(
                        tag: imageUrl,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Text('Could not load image'),
                          width: 100,
                          height: 100,
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageUrl;

  const DetailScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text('Detail Image'),
      ),
      backgroundColor: Color(0xFF87CEEB),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Text('Could not load image'),
              width: 400,
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}
