import 'package:flutter/material.dart';
import 'package:technews/logo.dart';
import 'package:technews/custom_widget.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Logo().getLogo(size: 60),
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
                  margin: const EdgeInsets.all(20),
                  child: CustomWidget.getElevatedBtn(
                    context,
                    'Sign up',
                    handler: () => {Navigator.pushNamed(context, "/select_topic")},
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
