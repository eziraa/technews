import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';

class SelectTopics extends StatefulWidget {
  const SelectTopics({super.key});

  @override
  State<SelectTopics> createState() => _SelectTopicsState();
}

class _SelectTopicsState extends State<SelectTopics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Choose your topics",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 250, 254, 253),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         child: const Icon(Icons.arrow_back_sharp)),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     const Text(
            //       "Choose your topics",
            //       style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Wrap(
              spacing: 10,
              children: List.generate(
                13,
                (index) => Flexible(
                    //     child: ElevatedButton(
                    //       onPressed: null,
                    //       child: Text(
                    //         "Category",
                    //       ),
                    // ),
                    child: CustomWidget.getElevatedBtn(context, 'Category',
                        handler: null)),
              ),
            ),
            Container(margin: const EdgeInsets.all(20),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/select_news_source");
                },
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
