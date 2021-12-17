import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/global/constants.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(5),
          width: 36,
          height: 36,
          child: CircularProgressIndicator(color: color ?? circProgressColor)),
    );
  }
}
