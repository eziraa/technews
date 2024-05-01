import 'package:flutter/material.dart';
import 'package:technews/logo.dart';
import 'package:technews/custom_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = '', password = '', username = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please Enter Username';
                        }
                        return null;
                      },
                      controller: usernameController,
                      decoration: const InputDecoration(
                          labelText: "Username", labelStyle: TextStyle()),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: "Email", labelStyle: TextStyle()),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: const InputDecoration(
                          labelText: "Password", labelStyle: TextStyle()),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: "Re-enter Password",
                          labelStyle: TextStyle()),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
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
