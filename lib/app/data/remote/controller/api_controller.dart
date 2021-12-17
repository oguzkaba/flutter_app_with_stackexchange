import 'package:flutter_app_with_stackexchange/app/data/local/controller/localdb_controller.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/question.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/questions.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/services/services.dart';
import 'package:flutter_app_with_stackexchange/app/internet_conroller.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  QuestionsModel listQuestions = QuestionsModel();
  QuestionByIdModel listQuestionById = QuestionByIdModel();
  final isLoading = true.obs;
  final isLoadingById = true.obs;
  final firstLogin = false.obs;

  final NetController netContoller = Get.put(NetController());
  final LocalDBController localDBController = Get.put(LocalDBController());

  @override
  void onInit() {
    if (netContoller.isOnline == false) {
      if (localDBController.questionsData.isEmpty) {
        firstLogin.value = true;
      } else {
        firstLogin.value = false;
        localDBController.getData();
      }
    } else {
      getQuestions(1, 30);
    }
    //getQuestions(1, 30);
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

  //Question Details Getter method
  Future<void> getQuestionById(int id) async {
    try {
      isLoadingById(true);
      listQuestionById = await RemoteServices.getQuestionById(id);
    } finally {
      isLoadingById(false);
    }
  }
}
