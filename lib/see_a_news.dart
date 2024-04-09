import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:share/share.dart';


class SeeNewsDetailPage extends StatefulWidget {
  const SeeNewsDetailPage({super.key});

  @override
  State<SeeNewsDetailPage> createState() => _SeeNewsDetailPageState();
}

class _SeeNewsDetailPageState extends State<SeeNewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.getAppBarWithShare(context),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      CustomWidget.getProfileImage("assets/images/1.jpg",
                          size: 70),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomWidget.getBoldText("BBC News"),
                          CustomWidget.blurredText("15 minute ago", size: 12),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomWidget.getElevatedBtn(context, "Following",
                          size: 16)
                    ],
                  ),
                ),
              )),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomWidget.getImage("assets/images/4.jpg"),
                    const SizedBox(height: 10),
                    CustomWidget.blurredText("Europe"),
                    CustomWidget.getBoldText(
                        "Apple products becoming available in the world and will be available"),
                    getNewsBody(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomWidget.getBottomNavBar(context),
    );
  }

  Widget getNewsBody() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(children: [
        CustomWidget.getNormalText(
            "The three dots often seen in user interfaces, especially on mobile devices, are typically referred to as  icon. In user interface design, they indicate that there are additional options available that are not immediately visible"),
        const SizedBox(
          height: 5,
        ),
        CustomWidget.getNormalText(
            "The three dots often seen in user interfaces, especially on mobile devices, are typically referred to as  icon. In user interface design, they indicate that there are additional options available that are not immediately visible"),
        const SizedBox(
          height: 5,
        ),
        CustomWidget.getNormalText(
            "The three dots often seen in user interfaces, especially on mobile devices, are typically referred to as  icon. In user interface design, they indicate that there are additional options available that are not immediately visible"),
      ]),
    );
  }
 
  
}
