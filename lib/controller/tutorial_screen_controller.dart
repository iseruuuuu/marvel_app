import 'package:flutter/services.dart';
import 'package:flutter_app_icon_badge/flutter_app_icon_badge.dart';
import 'package:get/get.dart';
import '../gen/assets.gen.dart';
import '../screen/home_screen.dart';

class TutorialScreenController extends GetxController {

  var icon1 = false.obs;
  var icon2 = false.obs;
  var icon3 = false.obs;
  var icon4 = false.obs;


  void onTapSkip() {
    Get.off(const HomeScreen());
  }

  void onTapDone() async{
    //TODO アプリのアイコンを変える
    if (icon1.value) {
      FlutterAppIconBadge.updateBadge(1);
    }
    if (icon2.value) {

    }
    if (icon3.value) {

    }
    if (icon4.value) {

    }


    Get.off(const HomeScreen());
  }

  void onTapChange(int select) {
    switch (select) {
      case 0:
        icon1.value = true;
        icon2.value = false;
        icon3.value = false;
        icon4.value = false;
        break;
      case 1:
        icon1.value = false;
        icon2.value = true;
        icon3.value = false;
        icon4.value = false;
        break;
      case 2:
        icon1.value = false;
        icon2.value = false;
        icon3.value = true;
        icon4.value = false;
        break;
      default:
        icon1.value = false;
        icon2.value = false;
        icon3.value = false;
        icon4.value = true;
        break;
    }
  }

}