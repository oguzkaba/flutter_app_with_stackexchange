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
        child: Text(
          'QuestionDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
