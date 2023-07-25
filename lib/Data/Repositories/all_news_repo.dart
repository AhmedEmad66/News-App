import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Data/Models/all_news/all_news.dart';

class AllNewsRepo {
  Future<AllNews?> getAllNews() async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2023-06-25&sortBy=publishedAt&apiKey=2aee8788c05642d399dc14e88fc06fd2"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        AllNews data = AllNews.fromJson(decodeResponse);
        return data;
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
