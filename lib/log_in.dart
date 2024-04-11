import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/logo.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    bool rememberPassword = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Logo().getLogo(size: 60),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: const TextStyle(),
                          hintText: 'Enter username',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12)),
                        )),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(),
                        hintText: 'Enter password',
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberPassword,
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(() {
                              rememberPassword =
                                  !value; // Update the state directly with the new value
                            });
                          }
                        },
                        activeColor: Colors.blue,
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/verify_email");
                    },
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: CustomWidget.getElevatedBtn(
                  context,
                  'Log in',
                  handler: () => {Navigator.pushNamed(context, "/home_page")},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
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
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/verify_email");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
