import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

Container tutorialItem({
  required String title,
  required Widget image,
  required Color color,
}) {
  return Container(
    color: color,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 200,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        image,
      ],
    ),
  );
}
