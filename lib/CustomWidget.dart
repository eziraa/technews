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
}
