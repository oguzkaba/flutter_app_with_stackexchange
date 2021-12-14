import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/themes/theme.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.darkTheme(),
    ),
  );
}
