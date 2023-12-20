import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TitleScreenController extends GetxController {
  var isFirst = false.obs;

  @override
  onInit() async {
    loadPreference();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirst.value = prefs.getBool('key') ?? false;
    super.onInit();
    savePreference();


  }

  loadPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirst.value = prefs.getBool('key') ?? false;
  }

  savePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('key', true);
  }
}
