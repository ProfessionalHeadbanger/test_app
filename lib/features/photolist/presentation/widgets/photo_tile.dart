import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/core/themes/colors.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;

  const PhotoTile({super.key, required this.photo, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: photo.shadowColor.withOpacity(0.25),
              blurRadius: 20,
              spreadRadius: 0,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              BlurHash(
                hash: photo.blurHash,
                imageFit: BoxFit.cover,
                image: photo.imageUrl,
              ),
              Positioned(
                bottom: 12,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      photo.username,
                      style: const TextStyle(color: AppColors.secondaryText),
                    ),
                    Text(context.l10n.likes(photo.likes),
                        style: const TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 11,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
