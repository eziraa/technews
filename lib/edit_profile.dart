import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit your profile',
            style: TextStyle(fontSize: 20),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
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
                            image: AssetImage(
                                'assets/images/profile.jpg'),
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
                              color: Colors.blue),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ])),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Column(
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
    );
  }
}
