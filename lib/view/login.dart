// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:technews/controller/theme_controller.dart';
import 'package:technews/controller/user_controller.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/forgot_password.dart';
import 'package:technews/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:technews/view/logo.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";

  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final ThemeController themeController = Get.put(ThemeController());
  final UserController userController = Get.put(UserController());

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      User user = DatabaseMethods().getUserByEmail(email) as User;
      userController.setCurrentUser(
          user.uid, user.displayName, user.email, user.phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color.fromARGB(255, 217, 107, 107),
            content: Text(
              "Wrong email or password",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.themeMode == ThemeMode.light
          ? Colors.white70
          : Colors.black87,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50),
              Logo().getLogol(size: 100),
              Container(width: MediaQuery.of(context).size.width, height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 30.0),
                        decoration: CustomWidget.getBoxDecoration(),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter E-mail';
                            } else if (!value.contains("@"))
                              return 'Please Enter E-mail';
                            return null;
                          },
                          controller: mailcontroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Color(0xFFb2b7bf), fontSize: 18.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 30.0),
                        decoration: CustomWidget.getBoxDecoration(),
                        child: TextFormField(
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                              password = passwordcontroller.text;
                            });
                          }
                          userLogin();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 30.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                },
                child: const Text("Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blueAccent,
                    )),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
