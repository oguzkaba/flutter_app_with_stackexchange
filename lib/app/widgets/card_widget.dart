import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/data/local/controller/localdb_controller.dart';
import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:flutter_app_with_stackexchange/app/global/constants.dart';
import 'package:flutter_app_with_stackexchange/app/global/internet_conroller.dart';
import 'package:flutter_app_with_stackexchange/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

class ItemCardWidget extends StatelessWidget {
  final ApiController ac;
  final NetController nc;
  final LocalDBController lc;
  final List<dynamic> items;
  final int index;

  const ItemCardWidget(
      {Key? key,
      required this.items,
      required this.index,
      required this.ac,
      required this.nc,
      required this.lc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => nc.isOnline
          ? await Get.toNamed(Routes.questionDetails,
              arguments: items[index].questionId)
          : null,
      child: Card(
        child: Container(
          padding: const EdgeInsets.fromLTRB(4, 8, 8, 10),
          width: Get.width * .8,
          height: Get.height / 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                      height: Get.height / 13,
                      decoration: BoxDecoration(
                          border: Border.all(color: questionIndexContainer),
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.all(3),
                      child: Center(
                        child: Text('Q-' + (index + 1).toString(),
                            style: TextStyle(
                                color: lightTextColor,
                                fontSize: index > 999
                                    ? 8
                                    : index > 99
                                        ? 10
                                        : 12)),
                      ))),
              Expanded(
                flex: 7,
                child: Text(
                    HtmlUnescape().convert(items[index].title.toString()),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
