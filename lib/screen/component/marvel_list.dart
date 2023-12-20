import 'package:flutter/material.dart';
import '../../model/marvel.dart';
import '../../controller/home_screen_controller.dart';

GridView marvelList(List<Marvel> marvels, HomeScreenController controller) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.65,
    ),
    itemCount: marvels.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => controller.onTapDetail(marvels[index]),
        child: Container(
          width: 400,
          height: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                marvels[index].image,
                width: 120,
                height: 150,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  marvels[index].isWatch
                      ? GestureDetector(
                          onTap: () => controller.updateWatch(marvels[index]),
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.cyan,
                            size: 30,
                          ),
                        )
                      : GestureDetector(
                          onTap: () => controller.updateWatch(marvels[index]),
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                  marvels[index].isFavorite
                      ? GestureDetector(
                          onTap: () =>
                              controller.updateFavorite(marvels[index]),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 30,
                          ),
                        )
                      : GestureDetector(
                          onTap: () =>
                              controller.updateFavorite(marvels[index]),
                          child: const Icon(
                            Icons.star_border,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
