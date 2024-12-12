import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/themes/colors.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:test_app/features/photolist/presentation/widgets/photo_tile.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late ScrollController _scrollController;
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _offset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Photo photo = Photo(
        imageUrl:
            "https://sun9-34.userapi.com/impg/c5rD_uPhdWe2iqqJ6cvSep3jkefDSlsyNZnnLA/ZgJIVeCcTyM.jpg?size=1620x2160&quality=95&sign=6d3c0ebea13b1339cfd12a7b6913f725&type=album",
        username: "Christian",
        likes: 14,
        shadowColor: const Color(0xff000000),
        blurHash: "LoC%a7IoIVxZ_NM|M{s:%hRjWAo0");

    final bool isCollapsed = _offset > 40;
    final double titleFontSize = isCollapsed ? 20 : 24;
    final EdgeInsetsGeometry titlePadding = isCollapsed
        ? EdgeInsets.zero
        : const EdgeInsetsDirectional.only(start: 10);

    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            border: null,
            backgroundColor: Colors.white.withOpacity(0.5),
            largeTitle: Padding(
              padding: titlePadding,
              child: Text(
                "Photos",
                style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText),
              ),
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
        ],
      ),
    );
  }
}
