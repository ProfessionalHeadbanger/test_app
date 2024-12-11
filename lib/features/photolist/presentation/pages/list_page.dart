import 'package:flutter/material.dart';
import 'package:test_app/core/themes/colors.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:test_app/features/photolist/presentation/widgets/photo_tile.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Photo photo = Photo(
        imageUrl: "imageUrl",
        username: "Christian",
        likes: 14,
        shadowColor: const Color(0xff000000),
        blurHash: "blurHash");

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Photos",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText),
              ),
              centerTitle: false,
              background: Container(
                color: AppColors.primaryBackground,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(28.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return PhotoTile(photo: photo);
                }, childCount: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1)),
          )
        ],
      ),
    );
  }
}
