import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/data/local/controller/localdb_controller.dart';
import 'package:flutter_app_with_stackexchange/app/internet_conroller.dart';
import 'package:flutter_app_with_stackexchange/app/widgets/listview_items_widget.dart';
import 'package:get/get.dart';

import 'package:flutter_app_with_stackexchange/app/constants.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:flutter_app_with_stackexchange/app/widgets/loading_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    //dependency injection
    ApiController apiController = Get.put(ApiController());
    NetController netContoller = Get.put(NetController());
    LocalDBController localDBController = Get.put(LocalDBController());

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
        () => netContoller.isOnline.value == false
            ? localDBController.questionsData.isEmpty
                ? Center(
                    child: Text(
                        'Data cannot be displayed because it is your first login to the application and you do not have an internet connection. Please check your internet connection. '))
                : localDBController.isLoading.value
                    ? LoadingWidget()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(apiController.listQuestions.items!.length
                                .toString()),
                            ListViewItems(ac: apiController),
                          ])
            : apiController.isLoading.value
                ? LoadingWidget()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(apiController.listQuestions.items!.length
                            .toString()),
                        ListViewItems(ac: apiController),
                      ]),
      ),
    );
  }
}
