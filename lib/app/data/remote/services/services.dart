import 'package:flutter_app_with_stackexchange/app/data/remote/model/questions.dart';
import 'package:http/http.dart' as http;

//https://api.stackexchange.com/2.3/questions?order=desc&sort=hot&site=stackoverflow&key=

enum QSort { activity, votes, creation, hot, week, month }

class RemoteServices {
  static const String baseUrl = 'https://api.stackexchange.com/2.3/';
  static const String tokenValue = 'm0kandJLKgkBIPOvWMeR3g(('; //remote

  static Future<QuestionsModel> getQuestions(int page, int pagesize) async {
    final response = await http.get(Uri.parse(baseUrl +
        'questions?page=$page&pagesize=$pagesize&order=desc&sort=activity&site=stackoverflow&key=$tokenValue'));

    if (response.statusCode == 200) {
      return questionsModelFromJson(response.body);
    } else {
      throw ("İstek durumu başarısız oldu: ${response.statusCode}");
    }
  }
}
