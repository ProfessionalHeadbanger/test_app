import 'package:go_router/go_router.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:test_app/features/navigation/app_routes.dart';
import 'package:test_app/features/photolist/presentation/pages/detail_page.dart';
import 'package:test_app/features/photolist/presentation/pages/list_page.dart';

final router = GoRouter(
  initialLocation: AppRoutes.listPagePath,
  routes: [
    GoRoute(
        path: AppRoutes.listPagePath,
        builder: (context, state) {
          return const ListPage();
        }),
    GoRoute(
      path: AppRoutes.detailPagePath,
      builder: (context, state) {
        final photo = state.extra! as Photo;
        return DetailPage(photo: photo);
      },
    ),
  ],
);
