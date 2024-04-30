// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';


// class NewsController {
//   final String apiKey =
//       'f78ba5b9d1f34e279c7e8b41654a846d'; // Replace with your actual API key

//   Future<List<dynamic>> fetchTechNews() async {
//     final response = await http.get(
//       Uri.parse(
//           'https://newsapi.org/v2/top-headlines?category=technology&apiKey=$apiKey'),
//     );

//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       return jsonData['articles'];
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }

//   Future<List<dynamic>> fetchTechNewsFromJson() async {
//     String jsonString =
//         await rootBundle.loadString('assets/images/json/news.json');
//     return jsonDecode(jsonString);
//   }

//   Future<void> fetchAndStoreData() async {
//     final response = await http.get(
//       Uri.parse(
//           'https://newsapi.org/v2/top-headlines?category=technology&language=en&apiKey=$apiKey'),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/news.json');
//       await file.writeAsString(jsonEncode(data));
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   void writeJsonToFile() async {
//     // Convert the JSON to a string
//     String jsonString =
//         await rootBundle.loadString('assets/images/json/news.json');
//     // Get the path to the directory where you can store the file
//     final directory = await getApplicationDocumentsDirectory();

//     // Create a reference to the file
//     final file = File('${directory.path}/my_data.txt');

//     // Write the string to the file
//     await file.writeAsString(jsonString);
//   }

 
// }
