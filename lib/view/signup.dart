import 'package:get/get.dart';
import 'package:technews/controller/theme_controller.dart';
import 'package:technews/controller/user_controller.dart';
import 'package:technews/custom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:technews/model/user_model.dart';
import 'package:technews/services/database.dart';
import 'package:technews/view/logo.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController phoneNumController = new TextEditingController();
  UserController userController = Get.put(UserController());

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null &&
        nameController.text != "" &&
        mailController.text != "") {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        DatabaseMethods().registerUser(userCredential.user!.uid,
            nameController.text, mailController.text, phoneNumController.text);

        userController.setCurrentUser(userCredential.user!.uid,
            nameController.text, mailController.text, phoneNumController.text);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Scaffold(
      backgroundColor: themeController.themeMode.value == ThemeMode.dark
          ? Colors.black87
          : Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50),
              Logo().getLogo(size: 60),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                    width: MediaQuery.of(context).size.width, height: 70),
              ),
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
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          controller: mailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your phone number';
                            }
                            return null;
                          },
                          controller: phoneNumController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          controller: passwordController,
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
                              email = mailController.text;
                              name = nameController.text;
                              password = passwordController.text;
                            });
                          }
                          registration();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 30.0),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              "Sign Up",
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
                height: 40.0,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
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
                              builder: (context) => const LogIn()));
                    },
                    child: const Text(
                      "Log In",
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
