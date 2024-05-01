import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Pagination Example'),
        ),
        body: PaginationListView(),
      ),
    );
  }
}

class PaginationController extends GetxController {
  var items = List<int>.generate(40, (index) => index).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    this.scrollController.addListener(() {
      if (this.scrollController.position.pixels ==
          this.scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  _loadMoreData() {
    // simulate a delay
    Future.delayed(Duration(seconds: 2)).then((_) {
      items.addAll(List<int>.generate(40, (index) => items.length + index));
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class PaginationListView extends GetView<PaginationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${controller.items[index]}'),
          );
        },
      );
    });
  }
}
