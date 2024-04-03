import 'package:flutter/material.dart';

class ChooseNewsSources extends StatefulWidget {
  const ChooseNewsSources({super.key});

  @override
  State<ChooseNewsSources> createState() => _ChooseNewsSourcesState();
}

class _ChooseNewsSourcesState extends State<ChooseNewsSources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.arrow_back_sharp),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Choose your topics",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 10,
              children: List.generate(
                13,
                (index) => Flexible(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        child: Image(
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/onboard-1.png")),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Source"),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.blue,
                        child: const ElevatedButton(
                          onPressed: null,
                          child: Text(
                            style: TextStyle(backgroundColor: Colors.blue),
                            "Follow",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
