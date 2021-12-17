import 'package:flutter_app_with_stackexchange/app/data/local/controller/localdb_controller.dart';
import 'package:flutter_app_with_stackexchange/app/data/local/model/questions.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/question.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/questions.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/services/services.dart';
import 'package:flutter_app_with_stackexchange/app/global/internet_conroller.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  QuestionsModel listQuestions = QuestionsModel();
  QuestionByIdModel listQuestionById = QuestionByIdModel();
  final isLoading = true.obs;
  final isLoadingById = true.obs;

  final NetController netContoller = Get.put(NetController());
  final LocalDBController localDBController = Get.put(LocalDBController());

  @override
  void onInit() {
    if (netContoller.isOnline == false) {
      if (localDBController.questionsData.isEmpty) {
      } else {
        localDBController.getData();
      }
    } else {
      getQuestions(1, 30);
    }
    super.onInit();
  }

//All Questions Getter method
  Future<void> getQuestions(int page, int pagesize) async {
    try {
      isLoading(true);
      listQuestions = await RemoteServices.getQuestions(page, pagesize);
      localDBController.questionsData.addAll(listQuestions.items!
          .map<LocalQuestionsModel>(
              (e) => LocalQuestionsModel(title: e.title)));
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
