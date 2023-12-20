import 'package:get/get.dart';
import 'package:marvel_app/model/marvel_const.dart';
import 'package:marvel_app/screen/detail_screen.dart';
import '../model/marvel.dart';
import '../preference/shared_preference.dart';

class HomeScreenController extends GetxController {
  final marvels = <Marvel>[].obs;
  final _storage = MarvelStorage();
  late final Worker _worker;
  var isSearch = false.obs;
  final searchMarvels = <Marvel>[].obs;
  var isFirst = false.obs;

  List<Marvel> get marvel => marvels;

  @override
  void onInit() {
    super.onInit();
    final storageMarvels =
    _storage.load()?.map((json) => Marvel.fromJson(json)).toList();
    final initialMarvels = storageMarvels ?? MarvelConst.initialTodos;
    marvels.addAll(initialMarvels);

    _worker = ever<List<Marvel>>(marvels, (marvels) {
      final data = marvels.map((e) => e.toJson()).toList();
      _storage.save(data);
    });
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }

  Marvel? getMarvelById(String id) {
    try {
      return marvels.singleWhere((e) => e.id == id);
    } on StateError {
      return null;
    }
  }

  void updateFavorite(Marvel marvel) {
    final index = marvels.indexOf(marvel);
    final newTodo = marvel.copyWith(
      isFavorite: !marvel.isFavorite,
    );
    marvels.setAll(index, [newTodo]);
  }

  void updateWatch(Marvel marvel) {
    final index = marvels.indexOf(marvel);
    final newTodo = marvel.copyWith(
      isWatch: !marvel.isWatch,
    );
    marvels.setAll(index, [newTodo]);
  }

  void onTapDetail(Marvel marvel) {
    Get.to(() => DetailScreen(marvel: marvel));
  }

  void onChanged(String text) {
    if (text.isNotEmpty) {
      isSearch.value = false;
    }
    isSearch.value = true;
    final newMarvels =
    marvels.where((element) => element.category == text).toList();
    searchMarvels.value = newMarvels;

    if (newMarvels.isEmpty) {
      isSearch.value = false;
    }
  }
}
