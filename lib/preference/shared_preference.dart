import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreference {
  static late final SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }
}

class MarvelStorage {
  final String key = "marvel";

  List<String>? load() {
    return SharedPreference.instance.getStringList(key);
  }

  void save(List<String> data) {
    SharedPreference.instance.setStringList(key, data);
  }
}
