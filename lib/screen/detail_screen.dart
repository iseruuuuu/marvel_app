import 'package:flutter/material.dart';
import 'package:marvel_app/model/marvel.dart';
import 'package:pod_player/pod_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

import '../controller/detail_screen_controller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.marvel,
  }) : super(key: key);

  final Marvel marvel;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailScreenController(widget.marvel), tag: '');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.marvel.title),
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            controller.controller.pause();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          PodVideoPlayer(controller: controller.controller),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              child: WebView(
                initialUrl: widget.marvel.page,
                javascriptMode: JavascriptMode.unrestricted,
                onPageStarted: (String url) {
                  setState(() {
                    controller.isLoading.value = true;
                  });
                },
                onPageFinished: (String url) async {
                  setState(() {
                    controller.isLoading.value = false;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
