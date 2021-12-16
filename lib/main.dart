import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_with_stackexchange/app/themes/theme.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //orientation config
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.lightTheme(),
    );
  }
}
