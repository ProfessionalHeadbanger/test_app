import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/core/themes/constants/colors.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:test_app/features/photolist/presentation/bloc/photolist_bloc.dart';

class DetailPage extends StatelessWidget {
  final Photo photo;

  const DetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leadingWidth: 100,
        leading: TextButton.icon(
          onPressed: () {
            context
                .read<PhotoListBloc>()
                .add(const ReturnToPhotoListPageEvent());
          },
          icon: Icon(
            Icons.chevron_left,
            color: context.color.secondaryText,
          ),
          label: Text(
            context.l10n.back,
            style: context.text.textButtonStyle,
          ),
        ),
      ),
      body: Column(
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
              style: context.text.largeUsername,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0),
            child: Text(
              context.l10n.likes(photo.likes),
              style: context.text.mediumLikes,
            ),
          )
        ],
      ),
    );
  }
}
