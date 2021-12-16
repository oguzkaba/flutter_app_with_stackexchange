import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  launchURLApp(String questionUrl) async {
    if (await canLaunch(questionUrl)) {
      await launch(questionUrl, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $questionUrl';
    }
  }
}
