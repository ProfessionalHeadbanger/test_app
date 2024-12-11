import 'package:flutter/widgets.dart';
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
          Image.asset(
            "assets/images/test_image.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
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
                      fontSize: 12),
                ),
                Text(
                  "${photo.likes} likes",
                  style: const TextStyle(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
