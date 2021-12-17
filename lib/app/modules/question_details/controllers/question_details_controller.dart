import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:get/get.dart';

class QuestionDetailsController extends GetxController {
  final ApiController apiController = Get.put(ApiController());

  @override
  void onInit() {
    apiController.getQuestionById(Get.arguments);
    super.onInit();
  }
}
