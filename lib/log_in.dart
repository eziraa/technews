import 'package:flutter/material.dart';
import 'package:technews/logo.dart';

class LogInPage extends StatefulWidget {
    const LogInPage({super.key});
 
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            const Logo(),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Username", labelStyle: TextStyle()),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Password", labelStyle: TextStyle()),
                  ),
                  SizedBox(height: 10),
                ],
              ),
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
                  "Log in",
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
