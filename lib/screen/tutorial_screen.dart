import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import '../controller/tutorial_screen_controller.dart';
import '../gen/assets.gen.dart';
import 'component/tutorial_item.dart';
import 'package:get/get.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final controller = Get.put(TutorialScreenController(), tag: '');
    return SafeArea(
      child: IntroViewsFlutter(
        [
          PageViewModel(
            pageColor: const Color(0xFFFF7A00),
            iconImageAssetPath: Assets.images.icon1.path,
            mainImage: Image.asset(
              Assets.images.icon1.path,
              height: 400.0,
              width: 400.0,
              alignment: Alignment.center,
            ),
            titleTextStyle: const TextStyle(color: Colors.white),
            bodyTextStyle: const TextStyle(color: Colors.white),
          ),
          PageViewModel(
            pageColor: const Color(0xFFFF7A00),
            iconImageAssetPath: Assets.images.icon1.path,
            body: const Text(
              '見た作品やお気に入りの作品を登録することができる!\n'
              '作品を押すことでそのMVやレビューを見ることができる!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
            mainImage: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Assets.images.t1
                    .image(width: MediaQuery.of(context).size.width / 2.1),
                Assets.images.t2
                    .image(width: MediaQuery.of(context).size.width / 2.1),
              ],
            ),
            titleTextStyle: const TextStyle(color: Colors.white),
            bodyTextStyle: const TextStyle(color: Colors.white),
          ),

        ],
        onTapSkipButton: controller.onTapSkip,
        onTapDoneButton: controller.onTapDone,
      ),
    );
  }
}
