import 'package:flutter/material.dart';
import 'package:test_app/core/utils/utils.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';

class PhotoModel extends Photo {
  PhotoModel(
      {required super.imageUrl,
      required super.username,
      required super.likes,
      required super.shadowColor,
      required super.blurHash});

  factory PhotoModel.fromJson(Map<String, dynamic> map) {
    return PhotoModel(
      imageUrl: map['urls']['regular'] as String,
      username: map['user']['username'] as String,
      likes: map['likes'] as int,
      shadowColor: Utils.stringToColor(map['color']),
      blurHash: map['blur_hash'] as String,
    );
  }

  PhotoModel copyWith({
    String? imageUrl,
    String? username,
    int? likes,
    Color? shadowColor,
    String? blurHash,
  }) {
    return PhotoModel(
      imageUrl: imageUrl ?? this.imageUrl,
      username: username ?? this.username,
      likes: likes ?? this.likes,
      shadowColor: shadowColor ?? this.shadowColor,
      blurHash: blurHash ?? this.blurHash,
    );
  }
}
