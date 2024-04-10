import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/logo.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Logo().getLogo(size: 70),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Enter Your Email",
                              labelStyle: TextStyle(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: Colors.blueAccent),
                          child: const Text(
                            'Send OTP',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 250, 254, 253),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: "Verification Code",
                        labelStyle: TextStyle(),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: CustomWidget.getElevatedBtn(
                    context,
                    'Verify',
                    handler: () => {Navigator.pushNamed(context, "/forgot_password")},
                  )),
            ], // Closing square bracket for Column children
          ),
        ),
      ), // Closing parenthesis for Container
    ); // Closing parenthesis for Scaffold
  }
}
