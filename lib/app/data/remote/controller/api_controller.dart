import 'package:flutter_app_with_stackexchange/app/data/local/controller/localdb_controller.dart';
import 'package:flutter_app_with_stackexchange/app/data/local/services/services.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/question.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/questions.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/users.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/services/services.dart';
import 'package:flutter_app_with_stackexchange/app/internet_conroller.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  QuestionsModel listQuestions = QuestionsModel();
  final List<QuestionByIdModel> listQuestionById = <QuestionByIdModel>[].obs;
  final List<UsersModel> listUsers = <UsersModel>[].obs;
  final isLoading = true.obs;

  final NetController netContoller = Get.put(NetController());
  final LocalDBController localDBController = Get.put(LocalDBController());

  @override
  void onInit() {
    if (netContoller.isOnline.value == false) {
      if (localDBController.questionsData.isEmpty) {}
    } else {
      getQuestions(1, 30);
      localDBController.insertData();
    }
    super.onInit();
  }

//All Questions Getter method
  Future<void> getQuestions(int page, int pagesize) async {
    try {
      isLoading(true);
      listQuestions = await RemoteServices.getQuestions(page, pagesize);
    } finally {
      isLoading(false);
    }
  }
}
