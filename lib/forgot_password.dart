import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/logo.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            color: Color.fromARGB(255, 250, 254, 253),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Logo().getLogo(),
          Container(
            margin: const EdgeInsets.all(30),
            child: const Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: "Username", labelStyle: TextStyle()),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Email", labelStyle: TextStyle()),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Enter Your password", labelStyle: TextStyle()),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Re-enter your password", labelStyle: TextStyle()),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20),
              child: CustomWidget.getElevatedBtn(context, 'Sign in')),
        ],
      ),
    );
  }
}
