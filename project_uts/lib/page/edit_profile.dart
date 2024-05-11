import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uts/page/profile.dart';
import 'package:project_uts/utils/session_manager.dart';

import '../models/model_user.dart';

class EditProfile extends StatefulWidget {
  final ModelUsers currentUser;

  const EditProfile({required this.currentUser, Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? _name;
  String? _email;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.currentUser.username;
    _emailController.text =
        widget.currentUser.email; // Inisialisasi nilai email dari model
  }

  void saveChanges(String newUsername, String newEmail) async {
    // Validasi input sebelum menyimpan perubahan
    if (newUsername.isEmpty || newEmail.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('All fields are required')));
      return;
    }

    // Validasi format email menggunakan regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(newEmail)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid email format')));
      return;
    }

    try {
      var url = Uri.parse('http://192.168.1.113/kebudayaan/updateUser.php');
      var response = await http.post(url, body: {
        'id': widget.currentUser.id.toString(),
        'username': newUsername,
        'email': newEmail,
      });

      var data = json.decode(response.body);

      if (data['is_success']) {
        setState(() {
          widget.currentUser.username = newUsername;
          widget.currentUser.email = newEmail;

          sessionManager.saveSession(
            200,
            widget.currentUser.id.toString(),
            newUsername,
            newEmail,
          );
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['message'])));
        Navigator.pop(context);

        // Ganti halaman ke halaman profil yang diperbarui
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProfilePage(currentUser: widget.currentUser)),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['message'])));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF87CEEB),
            title: Text('Edit Profile'),
          ),
          backgroundColor: Color(0xFF87CEEB),
          body: Form(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      // Center(
                      //   child: Text(
                      //     'Edit Profile',
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 24,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 450,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (val) {
                                  return val!.isEmpty
                                      ? "Name Tidak Boleh kosong"
                                      : null;
                                },
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'Name',
                                  suffixIcon: _name != null && _name!.isNotEmpty
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _name = value.trim();
                                  });
                                },
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Name tidak boleh kosong';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 450,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (val) {
                                  return val!.isEmpty
                                      ? "Email Tidak Boleh kosong"
                                      : null;
                                },
                                controller: _emailController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'Email',
                                  suffixIcon: _email != null &&
                                          _email!.isNotEmpty
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _email = value.trim();
                                  });
                                },
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Email tidak boleh kosong';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(height: 20),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width - (2 * 98),
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 7,
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {
                                  // Implement logic to save changes
                                  String newUsername = _usernameController.text;
                                  String newEmail = _emailController
                                      .text; // Ambil nilai dari controller email

                                  // Panggil fungsi untuk menyimpan perubahan
                                  saveChanges(newUsername, newEmail);
                                },
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
