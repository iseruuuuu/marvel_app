import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/controller/title_screen_controller.dart';
import 'package:marvel_app/preference/shared_preference.dart';
import 'package:marvel_app/screen/home_screen.dart';
import 'package:marvel_app/screen/tutorial_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: TitleScreen(),
    );
  }
}

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TitleScreenController());
    return controller.isFirst.value ? TutorialScreen() : const HomeScreen();
  }
}
