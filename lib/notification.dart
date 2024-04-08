import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          child: Text(
            'Notifications',
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
              ),
            onPressed: () {
              
            },
            ),        ],
      ),
    );
  }
}
