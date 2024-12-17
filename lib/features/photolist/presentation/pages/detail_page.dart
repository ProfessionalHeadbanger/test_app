import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/core/themes/colors.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';

class DetailPage extends StatelessWidget {
  final Photo photo;

  const DetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          border: null,
          padding: const EdgeInsetsDirectional.only(start: 5),
          backgroundColor: AppColors.transparent,
          automaticBackgroundVisibility: false,
          enableBackgroundFilterBlur: false,
          leading: TextButton(
            onPressed: () => context.pop(),
            child: Text(
              '< ${context.l10n.back}',
              style: const TextStyle(
                  color: AppColors.secondaryText,
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: BlurHash(
                  hash: photo.blurHash,
                  image: photo.imageUrl,
                  imageFit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26.0, top: 21),
              child: Text(
                photo.username,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Text(
                context.l10n.likes(photo.likes),
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ));
  }
}
