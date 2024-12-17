import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app/core/themes/theme.dart';
import 'package:test_app/features/photolist/data/datasources/photos_remote_data_source.dart';
import 'package:test_app/features/photolist/data/repositories/photo_repository_impl.dart';
import 'package:test_app/features/photolist/domain/usecases/get_photos_usecase.dart';
import 'package:test_app/features/photolist/presentation/bloc/photolist_bloc.dart';
import 'package:test_app/features/photolist/presentation/pages/list_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  final dio = Dio();
  final photosRemoteDataSource = PhotosRemoteDataSourceImpl(dio);
  final photoRepository = PhotoRepositoryImpl(photosRemoteDataSource);
  final getPhotosUseCase = GetPhotosUseCase(photoRepository);
  runApp(MainApp(getPhotosUseCase: getPhotosUseCase));
}

class MainApp extends StatelessWidget {
  final GetPhotosUseCase getPhotosUseCase;

  const MainApp({super.key, required this.getPhotosUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                PhotolistBloc(getPhotosUseCase: getPhotosUseCase)
                  ..add(const GetNextPageOfPhotosEvent())),
      ],
      child: const CupertinoApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en', 'US'),
        ],
        debugShowCheckedModeBanner: false,
        theme: AppTheme.cupertinoMainTheme,
        home: ListPage(),
      ),
    );
  }
}
