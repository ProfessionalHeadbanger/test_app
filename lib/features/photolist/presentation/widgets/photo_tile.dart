import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:test_app/core/themes/colors.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;

  const PhotoTile({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                  style: const TextStyle(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: 'Manrope'),
                ),
                Text(
                  "${photo.likes} likes",
                  style: const TextStyle(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      fontFamily: 'Manrope'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
