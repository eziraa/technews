import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: const Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: "Enter Old Password", labelStyle: TextStyle()),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  labelText: "Enter New Password", labelStyle: TextStyle()),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  labelText: "Re-enter New Password", labelStyle: TextStyle()),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
