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
      body: Obx(///buraya bak  <----------------------------------
        () => netContoller.isOnline == false
            ? localDBController.questionsData.isEmpty
                ? Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.wifi_off_rounded,color: Colors.red.withOpacity(0.07),size:Get.width),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:18.0),
                        child: Text(
                            'Data cannot be displayed because it is your first login to the application and you do not have an internet connection. Please check your internet connection. ',textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                )
                : localDBController.isLoading.value
                    ? LoadingWidget()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(apiController.listQuestions.items!.length
                                .toString()),
                            ListViewItems(ac: apiController, hc: controller),
                          ])
            : apiController.isLoading.value
                ? LoadingWidget()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(apiController.listQuestions.items!.length
                            .toString()),
                        ListViewItems(ac: apiController, hc: controller),
                      ]),
      ),
    );
  }
}
