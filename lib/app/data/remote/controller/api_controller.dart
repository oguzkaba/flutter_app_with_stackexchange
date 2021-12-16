import 'package:flutter_app_with_stackexchange/app/data/remote/model/question.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/questions.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/users.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/services/services.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  
  QuestionsModel listQuestions = QuestionsModel();
  final List<QuestionByIdModel> listQuestionById = <QuestionByIdModel>[].obs;
  final List<UsersModel> listUsers = <UsersModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    getQuestions();
    super.onInit();
  }

//All Questions Getter method
  Future<void> getQuestions() async {
    try {
      isLoading(true);
      listQuestions = await RemoteServices.getQuestions(1,30);
    } finally {
      isLoading(false);
    }
  }


}