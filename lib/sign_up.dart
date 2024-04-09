import 'package:flutter/material.dart';
import 'package:technews/logo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            const Logo(),
            const SizedBox(height: 30),
            const Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: "Username", labelStyle: TextStyle()),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Email", labelStyle: TextStyle()),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Password", labelStyle: TextStyle()),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Re-enter Password", labelStyle: TextStyle()),
                ),
                SizedBox(height: 10),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              color: Colors.blueAccent,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                onPressed: null,
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
