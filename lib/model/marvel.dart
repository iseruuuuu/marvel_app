import 'dart:convert';
import 'package:flutter/cupertino.dart';

@immutable
class Marvel {
  final int id;
  final String title;
  final String image;
  final String startTime;
  final String category;
  final bool isFavorite;
  final bool isWatch;
  final String preferenceKey;
  final String webPage;
  final String page;

  Marvel({
    required this.title,
    required this.image,
    required this.startTime,
    required this.category,
    required this.isFavorite,
    required this.isWatch,
    required this.preferenceKey,
    required this.webPage,
    required this.page,
  }) : id = DateTime.now().millisecondsSinceEpoch.toInt();

  const Marvel.withId({
    required this.id,
    required this.title,
    required this.image,
    required this.startTime,
    required this.category,
    required this.isFavorite,
    required this.isWatch,
    required this.preferenceKey,
    required this.webPage,
    required this.page,
  });

  Marvel copyWith({
    int? id,
    String? title,
    String? image,
    String? startTime,
    String? category,
    bool? isFavorite,
    bool? isWatch,
    String? preferenceKey,
    String? webPage,
    String? page,
  }) {
    return Marvel.withId(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      startTime: startTime ?? this.startTime,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      isWatch: isWatch ?? this.isWatch,
      preferenceKey: preferenceKey ?? this.preferenceKey,
      webPage: webPage ?? this.webPage,
      page: page ?? this.page,
    );
  }

  String toJson() {
    return jsonEncode({
      'id': id,
      'title': title,
      'image': image,
      'startTime': startTime,
      'category': category,
      'isFavorite': isFavorite,
      'isWatch': isWatch,
      'preferenceKey': preferenceKey,
      'webPage': webPage,
      'page': page,
    });
  }

  factory Marvel.fromJson(String json) {
    final mapData = jsonDecode(json);
    return Marvel.withId(
      id: mapData['id'] as int,
      title: mapData['title'] as String,
      image: mapData['image'] as String,
      startTime: mapData['startTime'] as String,
      category: mapData['category'] as String,
      isFavorite: mapData['isFavorite'] as bool,
      isWatch: mapData['isWatch'] as bool,
      preferenceKey: mapData['preferenceKey'] as String,
      webPage: mapData['webPage'] as String,
      page: mapData['page'] as String,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Marvel && other.id == id;
  }

  @override
  int get hashCode => Object.hash(
        id.hashCode,
        title.hashCode,
        image.hashCode,
        startTime.hashCode,
        category.hashCode,
        isFavorite.hashCode,
        isWatch.hashCode,
        preferenceKey.hashCode,
        webPage.hashCode,
        page.hashCode,
      );
}
