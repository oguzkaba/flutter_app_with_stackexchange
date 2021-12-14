import 'package:get/get.dart';

import 'package:flutter_app_with_stackexchange/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_app_with_stackexchange/app/modules/home/views/home_view.dart';
import 'package:flutter_app_with_stackexchange/app/modules/question_details/bindings/question_details_binding.dart';
import 'package:flutter_app_with_stackexchange/app/modules/question_details/views/question_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_DETAILS,
      page: () => QuestionDetailsView(),
      binding: QuestionDetailsBinding(),
    ),
  ];
}
