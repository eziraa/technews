import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:technews/controller/theme_controller.dart';
import 'package:technews/model/news_model.dart';

class CustomWidget {
  static AppBar getAppBar(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return AppBar(
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Tech",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                TextSpan(
                  text: "Buzz",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: themeController.themeMode.value == ThemeMode.dark
                        ? Color.fromARGB(179, 94, 93, 93)
                        : Colors.black87,
                  ),
                ),
              ]),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
            ),
          ],
        ),
      ],
    );
  }

  static AppBar getAppBarWithShare(BuildContext context, {News? news}) {
    final ThemeController themeController = Get.find<ThemeController>();

    return AppBar(
      iconTheme: IconThemeData(
          color: themeController.themeMode.value == ThemeMode.dark
              ? Colors.white70
              : Colors.black87),
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
              onPressed: () {
                FlutterShareMe().shareToSystem(msg: news?.url ?? "");
              },
              iconSize: 30,
            ),
            const SizedBox(width: 5),
          ],
        ),
      ],
    );
  }

  static Widget getSearchBox(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: themeController.themeMode.value == ThemeMode.dark
            ? Color.fromARGB(255, 89, 88, 88)
            : Colors.white54,
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
              onTap: () {
                if (ModalRoute.of(context)?.settings.name != "/search") {
                  Navigator.pushNamed(context, "/search");
                }
              },
              decoration: InputDecoration(
                // fillColor: themeController.themeMode.value == ThemeMode.dark
                //     ? Color.fromARGB(255, 89, 88, 88)
                //     : Colors.white54,
                fillColor: Colors.green, // Change this to your desired color

                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    backgroundColor:
                        themeController.themeMode.value == ThemeMode.dark
                            ? Color.fromARGB(255, 215, 11, 11)
                            : Colors.white54),
              ),
              onChanged: (String text) => {},
            ),
          ),
        ],
      ),
    );
  }

  static Widget blurredText(String data, {double size = 16}) {
    return Text(
      data,
      style: TextStyle(
          color: Color.fromARGB(255, 150, 147, 147),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }

  static Widget getImage(String imageAddress) {
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

  static Widget getNetWorkImage(BuildContext context, String imageAddress) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.78,
      height: 200,
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
      child: CachedNetworkImage(
        imageUrl: imageAddress,
        imageBuilder: (context, imageProvider) => Container(
          width: 380,
          height: 270,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Center(
          child: Container(
            height: 270,
            width: 380,
            child: const Icon(
              Icons.error,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }

  static Widget getBoldText(String data, {double size = 16}) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Text(
      data,
      style: TextStyle(
          color: themeController.themeMode.value == ThemeMode.dark
              ? Colors.white60
              : Colors.black54,
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }

  static Widget getNormalText(String data,
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

  static Widget getProfileImage(String name, {double size = 30}) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: Container(
          // ignore: sort_child_properties_last
          padding: EdgeInsets.only(top: 3),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.circle,
          ),
          child: Text(
            name[0],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size * 0.45,
              fontWeight: FontWeight.bold,
            ),
          ), // Set text here
        ));
  }

  static Widget smallProfileImage(String name, {double size = 30}) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: Container(
          // ignore: sort_child_properties_last
          padding: EdgeInsets.only(top: 1.2),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.circle,
          ),
          child: Text(
            name[0],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size * 0.25,
              fontWeight: FontWeight.bold,
            ),
          ), // Set text here
        ));
  }

  static Widget getMediumImage(String address, {double size = 100}) {
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

  static Widget getNetworkImage(String url, {double size = 70}) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: size,
      ),
    );
  }

  static Widget getElevatedBtn(BuildContext context, String text,
      {double size = 20, VoidCallback? handler}) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: size * 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueAccent),
      child: ElevatedButton(
        onPressed: handler,
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

  static Widget getBottomNavBar(BuildContext context, int currentIndex) {
    final ThemeController themeController = Get.find<ThemeController>();
    return BottomNavigationBar(
      backgroundColor: themeController.themeMode.value == ThemeMode.dark
          ? Colors.black
          : Colors.white,
      unselectedItemColor: themeController.themeMode.value == ThemeMode.dark
          ? Colors.white
          : Colors.black,
      selectedItemColor: Colors.blue,
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_sharp),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined),
          label: 'Profile',
        ),
        // Add more items as needed
      ],
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
          case 3:
            Navigator.pushNamed(context, "/profile");
            break;
          // Add more cases as needed for other indices
        }
      },
    );
  }

  static BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Color.fromARGB(255, 112, 109, 109), width: 2.0),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
