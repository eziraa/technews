import 'package:flutter/material.dart';
import 'package:technews/logo.dart';

class CustomWidget {
  AppBar getAppBar(BuildContext context) {
    return AppBar(
      actions: [
        const Logo(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.23,
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            size: 30,
          ),
          onPressed: () {},
          iconSize: 30,
        ),
      ],
    );
  }

  Widget getSearchBox() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(2, 5), // changes position of shadow
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget blurredText(String data) {
    return Text(
      data,
      style: const TextStyle(
          color: Color.fromARGB(255, 150, 147, 147),
          fontSize: 16,
          fontWeight: FontWeight.bold),
    );
  }

  Widget getImage(String imageAddress) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 205, 11, 11),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 150, 147, 147),
                blurRadius: 8,
                spreadRadius: 4,
                offset: Offset(2, 6)),
            BoxShadow(
                color: Color.fromARGB(255, 150, 147, 147),
                blurRadius: 8,
                spreadRadius: 4,
                offset: Offset(-2, -6)),
          ]),
      child: Image(
        image: AssetImage(imageAddress),
        fit: BoxFit.cover,
      ),
    );
  }
}
