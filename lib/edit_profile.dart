import 'dart:html';
import 'dart:html';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technews/controller/theme_controller.dart';
import 'package:technews/controller/user_controller.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/services/remote_services.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ThemeController themeController = Get.put(ThemeController());
  final UserController userController = Get.put(UserController());
  final TextEditingController nameController = Get.put(TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit your profile',
            style: TextStyle(fontSize: 20),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => {Navigator.pop(context)},
          ),
          actions: [
            IconButton(
                onPressed: () => {Navigator.pushNamed(context, "/settings")},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                    child: Stack(children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1)),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          // Pick an image
                          // final XFile? image = await _picker.pickImage(
                          //     source: ImageSource.gallery);
                        },
                      ),
                    ),
                  ),
                ])),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username",
                          labelStyle: TextStyle(),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      TextField(
                        
                        controller: nameController,
                        
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "FullName",
                            labelStyle: TextStyle()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            labelStyle: TextStyle()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone Number",
                          labelStyle: TextStyle(),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomWidget.getBottomNavBar(context, 3),
      ),
    );
  }
}
