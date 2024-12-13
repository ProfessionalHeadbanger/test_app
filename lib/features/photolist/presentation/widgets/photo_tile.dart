import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:test_app/core/themes/colors.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;

  const PhotoTile({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: photo.shadowColor.withOpacity(0.2),
            blurRadius: 32,
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
                  Text(AppLocalizations.of(context)!.likes(photo.likes),
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
    );
  }
}
