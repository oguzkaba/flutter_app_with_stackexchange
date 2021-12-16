import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/widgets/listview_items_widget.dart';
import 'package:get/get.dart';

import 'package:flutter_app_with_stackexchange/app/constants.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:flutter_app_with_stackexchange/app/routes/app_pages.dart';
import 'package:flutter_app_with_stackexchange/app/widgets/loading_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    //dependency injection
    ApiController apiController = Get.put(ApiController());

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(appBarIcon),
        ),
        title: Text('Questions Page'),
        centerTitle: true,
      ),
      body: Obx(
        () => apiController.isLoading.value
            ? LoadingWidget()
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(apiController.listQuestions.items!.length.toString()),
                ListViewItems(ac: apiController),
              ]),
      ),
    );
  }

  Future<void> gettingQuestions(ApiController apiController) async {
    return await apiController.getQuestions();
  }
}
