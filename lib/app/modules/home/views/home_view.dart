import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: ()=>Get.toNamed(Routes.QUESTION_DETAILS), child: Text('details'),)
      ),
    );
  }
}
