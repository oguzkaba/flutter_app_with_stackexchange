import 'package:flutter_app_with_stackexchange/app/data/local/model/questions.dart';
import 'package:flutter_app_with_stackexchange/app/data/local/services/services.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:get/get.dart';

class LocalDBController extends GetxController {
  final questionsData = <LocalQuestionsModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

//All Questions Getter method
  Future<void> getData() async {
    try {
      isLoading(true);
      await LocalServices.instance.queryAllRows().then((value) {
        for (var element in value) {
          questionsData.add(LocalQuestionsModel(
            id: element['id'],
            columnTitle: element['columnTitle']
          ));
        }
      });
    } finally {
      isLoading(false);
    }
  }

  //Insert api-to-sqflite method
  Future<void> insertData() async {
    try {
      isLoading(true);
      await LocalServices.instance.insert(LocalQuestionsModel(
          columnTitle: ApiController().listQuestions.items!.first.title));
    } finally {
      isLoading(false);
    }
  }
}
