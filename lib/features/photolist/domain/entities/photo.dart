import 'package:flutter/material.dart';

class Photo {
  final String imageUrl;
  final String username;
  final int likes;
  final Color shadowColor;
  final String blurHash;

  Photo(
      {required this.imageUrl,
      required this.username,
      required this.likes,
      required this.shadowColor,
      required this.blurHash});
}
