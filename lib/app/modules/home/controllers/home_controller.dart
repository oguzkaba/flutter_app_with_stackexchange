import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scontroller = ScrollController();
  final isLoading = false.obs;
  final page=1.obs;

  final ApiController apiController = Get.put(ApiController());

  @override
  void onInit() {
    scontroller.addListener(_onScroll);
    super.onInit();
  }

  @override
  void onClose() {
    scontroller.removeListener(_onScroll);
    super.onClose();
  }

  void pageIncrement(){

  }

  _onScroll() async {
    if (scontroller.offset >= scontroller.position.maxScrollExtent &&
        !scontroller.position.outOfRange) {
      isLoading.value = true;
      await apiController
          .getQuestions(1, apiController.listQuestions.items!.length + 30)
          .whenComplete(() => isLoading.value = false);
    }
  }
}
