import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'component/marvel_list.dart';
import '../controller/home_screen_controller.dart';
import 'component/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
      ),
      body: Column(
        children: <Widget>[
          SearchBar(
            hintText: '作品を検索',
            onChanged: controller.onChanged,
          ),
          Expanded(
            child: Obx(
              () => !controller.isSearch.value
                  ? marvelList(controller.marvel, controller)
                  : marvelList(controller.searchMarvels, controller),
            ),
          ),
        ],
      ),
    );
  }
}
