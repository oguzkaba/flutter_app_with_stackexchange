import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/data/local/controller/localdb_controller.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:flutter_app_with_stackexchange/app/internet_conroller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scontroller = ScrollController();
  final isLoading = false.obs;

  final ApiController apiController = Get.put(ApiController());

  @override
  void onInit() {
    scontroller.addListener(_onScroll);
    super.onInit();
  }

  _onScroll() {
    if (scontroller.offset >= scontroller.position.maxScrollExtent &&
        !scontroller.position.outOfRange) {
      isLoading.value = true;
      apiController.getQuestions(
          1, apiController.listQuestions.items!.length + 30);
    }
  }
}
