import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/features/photolist/presentation/widgets/photo_tile.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Photos",
          style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: CupertinoColors.white.withOpacity(0.5),
      ),
      child: const PhotoTile(),
    );
  }
}
