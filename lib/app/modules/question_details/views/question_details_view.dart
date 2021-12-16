import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/question_details_controller.dart';

class QuestionDetailsView extends GetView<QuestionDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuestionDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              Get.arguments.toString(),
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () => controller.launchURLApp(
                    "https://onursahin.net"),
                child: Text('Aç'))
          ],
        ),
      ),
    );
  }
}
