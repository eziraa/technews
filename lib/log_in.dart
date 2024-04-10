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
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Username", labelStyle: TextStyle()),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Password", labelStyle: TextStyle()),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/forgot_password");
              },
              child: const Text(
                'Forgot password',
                style: TextStyle(color: Colors.blueAccent, fontSize: 12),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                // child: CustomWidget.getElevatedBtn(context, 'Log in')),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home_page");
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Colors.blueAccent),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 250, 254, 253),
                    ),
                  ),
                )),
            TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/sign_up");
                },
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextSpan(
                      text: "Signup",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}
