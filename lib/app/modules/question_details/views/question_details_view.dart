import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_with_stackexchange/app/constants.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/model/question.dart';
import 'package:flutter_app_with_stackexchange/app/widgets/loading_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

import '../controllers/question_details_controller.dart';

class QuestionDetailsView extends GetView<QuestionDetailsController> {
  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.put(ApiController());

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Question Details Page'),
        ),
        body: Obx(() => apiController.isLoadingById.value
            ? LoadingWidget()
            : apiController.listQuestionById.items!.isEmpty
                ? Center(
                    child: Text('Error-->Question not displayed...'),
                  )
                : _questionDetails(apiController.listQuestionById.items!)));
  }

  SingleChildScrollView _questionDetails(List<Item> items) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _questionTitle(items),
          SizedBox(height: 30),
          _questionInfo(items),
          SizedBox(width: Get.width * .9, child: Divider(thickness: 2)),
          SizedBox(height: 30),
          _questionBody(items),
          SizedBox(height: 30),
          _questionFooter(items),
          SizedBox(width: Get.width * .9, child: Divider(thickness: 2)),
        ]),
      ),
    );
  }

  Row _questionFooter(List<Item> items) {
    return Row(
      children: [
        Container(
          width: Get.width * .5,
          child: Wrap(
            children: [for (var i in items.first.tags!) Chip(label: Text(i))],
          ),
        ),
        _questionOwner(items)
      ],
    );
  }

  MarkdownBody _questionBody(List<Item> items) =>
      MarkdownBody(data: HtmlUnescape().convert(items.first.bodyMarkdown!));

  Row _questionInfo(List<Item> items) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        flex: 3,
        child: Text(
            'Asked: ' +
                timeago.format(DateTime.fromMillisecondsSinceEpoch(
                    items.first.creationDate! * 1000)),
            overflow: TextOverflow.ellipsis),
      ),
      Expanded(
          flex: 3,
          child: Text(
              'Active: ' +
                  timeago.format(DateTime.fromMillisecondsSinceEpoch(
                      items.first.lastActivityDate! * 1000)),
              overflow: TextOverflow.ellipsis)),
      Expanded(
          flex: 2,
          child: Text('Viewed: ' + items.first.viewCount.toString(),
              overflow: TextOverflow.ellipsis, textAlign: TextAlign.right)),
    ]);
  }

  Text _questionTitle(List<Item> items) {
    return Text(HtmlUnescape().convert(items.first.title!),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  Widget _questionOwner(List<Item> items) {
    return Container(
        width: Get.width * .40,
        decoration: BoxDecoration(
            color: profileContainerColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(items.first.owner!.profileImage.toString(),
                  height: 40, width: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Wrap(
                    children: [
                      Text(items.first.owner!.displayName.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: lightTextColor, fontSize: 10))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(items.first.owner!.badgeCounts!.gold.toString(),
                          style: TextStyle(
                              color: goldBadgeColor,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            items.first.owner!.badgeCounts!.silver.toString(),
                            style: TextStyle(
                                color: silverBadgeColor,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            items.first.owner!.badgeCounts!.bronze.toString(),
                            style: TextStyle(
                                color: bronzeBadgeColor,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
