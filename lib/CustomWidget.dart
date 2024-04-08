import 'package:flutter/material.dart';
import 'package:technews/logo.dart';

class CustomWidget {
  AppBar getAppBar(BuildContext context) {
    return AppBar(
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
        ),
      ],
    );
  }
  AppBar getAppBarWithShare(BuildContext context) {
    return AppBar(
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.23,
            ),
            IconButton(
              icon: const Icon(
                Icons.share_rounded,
                size: 30,
              ),
              onPressed: () {},
              iconSize: 30,
            ),
            const SizedBox(width: 5),
          ],
        ),
      ],
    );
  }

  Widget getSearchBox(BuildContext context) {
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
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (String text) => {
                if (ModalRoute.of(context)?.settings.name != "/search")
                  Navigator.pushNamed(context, "/search")
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget blurredText(String data, {double size = 16}) {
    return Text(
      data,
      style: TextStyle(
          color: const Color.fromARGB(255, 150, 147, 147),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }

  Widget getImage(String imageAddress) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      width: 380,
      height: 270,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 78, 75, 75),
          shape: BoxShape.rectangle,
          border: Border.all(
            color:
                const Color.fromARGB(205, 96, 89, 89), // Set border color here
            width: 2.0, // Set border width here
          ),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
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

  Widget getBoldText(String data,
      {Color color = Colors.black, double size = 16}) {
    return Text(
      data,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  Widget getNormalText(String data,
      {Color color = Colors.black, double size = 16}) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        data,
        softWrap: true, // Set softWrap to true
        textAlign: TextAlign.start, // Set text alignment if needed
      ),
    );
  }

  Widget getProfileImage(String address, {double size = 30}) {
    return ClipOval(
      child: Image(
        image: AssetImage(address),
        width: size,
        height: size,
      ),
    );
  }

  Widget getMediumImage(String address, {double size = 100}) {
    return Container(
      padding: const EdgeInsets.all(0.0), // Adjust padding as needed
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 77, 73, 73), // Set border color here
          width: 2.0, // Set border width here
        ),
        borderRadius: BorderRadius.circular(8.0), // Set border radius here
      ),
      child: Image(
        image: AssetImage(address),
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget getElevatedBtn(BuildContext context, String text, {double size = 20}) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueAccent),
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            backgroundColor: Colors.blueAccent),
        child: Text(
          text,
          style: TextStyle(
              color: const Color.fromARGB(255, 250, 254, 253), fontSize: size),
        ),
      ),
    );
  }

  Widget getBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "/home_page");
            break;
          case 1:
            Navigator.pushNamed(context, "/search");
            break;
          case 2:
            Navigator.pushNamed(context, "/saved");
            break;
        }
      },
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save_outlined),
          label: "search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: "saved",
        ),
      ],
    );
  }
}
