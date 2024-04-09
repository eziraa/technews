import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/custom_date.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationState();
}

String dotDisplayer(String text) {
  int textLength = text.length;
  if (textLength > 20) {
    return '${text.substring(0, 19)}...';
  } else {
    return text;
  }
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          textAlign: TextAlign.center,
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
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection:
            Axis.vertical, // Set the scroll direction to horizontal
        child: Column(
          children: [
            getDayNoti(),
            getDayNoti(),
            getDayNoti(),
            getDayNoti(),
          ],
        ),
      ),
    );
  }

  Widget getDayNoti() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 0),
            child: CustomDateDisplay.getDate(context)[0]),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // Wrap the Row with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
                getNotification(),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getNotification() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('assets/images/bbc.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  dotDisplayer(
                    'Europe Europe: Lorem, ipsum dolor sit amet consect etur adipisicing elit.Lorem, ipsum dolor ipsum dolor',
                  ),
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const Text(
                '4h ago',
                textAlign: TextAlign.left,
              ),
            ],
          ),
          CustomWidget.getElevatedBtn(context, "Follow", size: 16)
        ],
      ),
    );
  }
}
