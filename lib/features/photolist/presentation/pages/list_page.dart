import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:test_app/features/photolist/presentation/widgets/photo_tile.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Photo photo = Photo(
        imageUrl:
            "https://sun9-34.userapi.com/impg/c5rD_uPhdWe2iqqJ6cvSep3jkefDSlsyNZnnLA/ZgJIVeCcTyM.jpg?size=1620x2160&quality=95&sign=6d3c0ebea13b1339cfd12a7b6913f725&type=album",
        username: "Christian",
        likes: 14,
        shadowColor: const Color(0xff60544D),
        blurHash: "LoC%a7IoIVxZ_NM|M{s:%hRjWAo0");

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            border: null,
            backgroundColor: Colors.white.withOpacity(0.5),
            middle: Text(context.l10n.photos),
            alwaysShowMiddle: false,
            largeTitle: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(context.l10n.photos),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(27.0),
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
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Center(
                child: CupertinoActivityIndicator(
                  radius: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
