import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/questions.dart';
import 'package:flutter_app_with_stackexchange/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_app_with_stackexchange/app/widgets/loading_widget.dart';
import 'package:get/get.dart';

import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:flutter_app_with_stackexchange/app/routes/app_pages.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ListViewItems extends StatelessWidget {
  final ApiController ac;
  final HomeController hc;
  const ListViewItems({Key? key, required this.ac, required this.hc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> items = ac.listQuestions.items ?? [];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LazyLoadScrollView(
          onEndOfPage: () => ac.getQuestions(1, items.length + 30),
          child: ListView.builder(
              shrinkWrap: true,
              //controller: hc.scontroller,
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                if (items.length == index) {
                  return LoadingWidget();
                }
                return Card(
                    child: ListTile(
                  isThreeLine: true,
                  onTap: () async => await Get.toNamed(Routes.QUESTION_DETAILS,
                      arguments: items[index].questionId),
                  // onTap: () {
                  //   ac
                  //       .getQuestionById(items[index].questionId)
                  //       .then((value) => Get.toNamed(Routes.QUESTION_DETAILS));
                  // },
                  subtitle: Text(
                      index.toString() + items[index].title.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle()),
                ));
              }),
        ),
      ),
    );
  }
}
