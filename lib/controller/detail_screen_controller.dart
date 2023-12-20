import 'package:get/get.dart';
import 'package:marvel_app/model/marvel_const.dart';
import 'package:marvel_app/screen/detail_screen.dart';
import 'package:pod_player/pod_player.dart';
import '../model/marvel.dart';

class DetailScreenController extends GetxController {
  DetailScreenController(
    this.marvel,
  );

  final Marvel marvel;
  late final PodPlayerController controller;
  var isPlay = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(marvel.webPage),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: false,
        videoQualityPriority: [720, 360],
      ),
    )..initialise();
  }
}
