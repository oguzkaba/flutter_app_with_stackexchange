import 'dart:io';

import 'package:get/get.dart';

class NetController extends GetxController {
  final isOnline = false.obs;

  @override
  void onInit() async {
    isOnline.value = await hasInternetConnection();
    super.onInit();
  }

  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
