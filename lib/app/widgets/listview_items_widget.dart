import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:flutter_app_with_stackexchange/app/routes/app_pages.dart';

class ListViewItems extends StatelessWidget {
  final ApiController ac;
  const ListViewItems({
    Key? key,
    required this.ac,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = ac.listQuestions.items ?? [];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                onTap: () => Get.toNamed(Routes.QUESTION_DETAILS,
                    arguments: items[index].questionId),
                subtitle: Text(items[index].title.toString(),
                    overflow: TextOverflow.ellipsis, style: TextStyle()),
                title: Text(
                  items[index].owner.displayName! +
                      ' asked ' +
                      timeago.format(DateTime.fromMillisecondsSinceEpoch(
                          items[index].creationDate! * 1000)),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Container(
                    width: Get.width * .15,
                    height: Get.width * .15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(items[index].owner.profileImage!),
                      ),
                    ),
                  ),
                ),
              ));
            }),
      ),
    );
  }
}
