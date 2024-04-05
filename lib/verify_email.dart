import 'package:flutter/material.dart';
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
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter Your Email",
                            labelStyle: TextStyle(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: null,
                                                child: Text("Get OTP",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Verification Code",
                      labelStyle: TextStyle(),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              color: Colors.blue,
              child:const ElevatedButton(
                // style: ElevatedButton.styleFrom(
                  //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0),
                  //   ),
                // ),
                onPressed: null,
                child: Text(
                  "Verify",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ], // Closing square bracket for Column children
        ), // Closing parenthesis for Column
      ), // Closing parenthesis for Container
    ); // Closing parenthesis for Scaffold
  }
}
