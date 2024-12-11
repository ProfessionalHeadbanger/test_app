import 'package:flutter/widgets.dart';

class PhotoTile extends StatelessWidget {
  const PhotoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(borderRadius: BorderRadius.circular(8)),
      const Column(
        children: [
          Text(
            "Christian",
          ),
          Text("14 likes")
        ],
      )
    ]);
  }
}
