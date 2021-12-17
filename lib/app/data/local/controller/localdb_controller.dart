import 'package:flutter_app_with_stackexchange/app/data/local/model/questions.dart';
import 'package:flutter_app_with_stackexchange/app/data/local/services/services.dart';
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
          questionsData.add(
              LocalQuestionsModel(id: element['id'], title: element['title']));
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
      await LocalServices.instance.insert(questionsData);
    } finally {
      isLoading(false);
    }
  }
}
