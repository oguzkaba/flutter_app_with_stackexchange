import 'package:flutter_app_with_stackexchange/app/data/remote/model/question.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/questions.dart';
import 'package:http/http.dart' as http;

//https://api.stackexchange.com/2.3/questions?order=desc&sort=hot&site=stackoverflow&key=
///2.3/questions/70384666?order=desc&sort=activity&site=stackoverflow&filter=!.Nm491Ld9qCnwmQjUGjItqGh(mfx..cw
class RemoteServices {
  static const String baseUrl = 'https://api.stackexchange.com/';
  static const String tokenValue = 'm0kandJLKgkBIPOvWMeR3g(('; //remote

  static Future<QuestionsModel> getQuestions(int page, int pagesize) async {
    final response = await http.get(Uri.parse(baseUrl +
        '2.3/questions?page=$page&pagesize=$pagesize&order=desc&sort=activity&site=stackoverflow&filter=!)*UL7u.lHDMsnmuvAQI&key=$tokenValue'));
    if (response.statusCode == 200) {
      return questionsModelFromJson(response.body);
    } else {
      throw ("İstek durumu başarısız oldu: ${response.statusCode}");
    }
  }

  static Future<QuestionByIdModel> getQuestionById(int id) async {
    final response = await http.get(Uri.parse(baseUrl +
        '2.3/questions/$id?order=desc&sort=activity&site=stackoverflow&key=$tokenValue&filter=!8.X7X4_BZ(dr9S2vp8QK-fRs7l1onQKih1A*o'));
    if (response.statusCode == 200) {
      return questionByIdModelFromJson(response.body);
    } else {
      throw ("İstek durumu başarısız oldu: ${response.statusCode}");
    }
  }
}
