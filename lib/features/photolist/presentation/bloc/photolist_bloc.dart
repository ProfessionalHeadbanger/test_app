import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/params/params.dart';
import 'package:test_app/features/navigation/app_routes.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:test_app/features/photolist/domain/usecases/get_photos_usecase.dart';

part 'photolist_event.dart';
part 'photolist_state.dart';

class PhotoListBloc extends Bloc<PhotoListEvent, PhotoListState> {
  final GetPhotosUseCase getPhotosUseCase;
  final GoRouter router;

  PhotoListBloc({required this.router, required this.getPhotosUseCase})
      : super(PhotoListFirstPageLoading()) {
    on<GetFirstPageOfPhotosEvent>(_onGetFirstPageOfPhotosEvent);
    on<GetNextPageOfPhotosEvent>(_onGetNextPageOfPhotosEvent);
    on<OpenDetailPageEvent>(_onOpenDetailPageEvent);
    on<ReturnToPhotoListPageEvent>(_onReturnToPhotoListPageEvent);
  }

  Future<void> _onGetFirstPageOfPhotosEvent(
      GetFirstPageOfPhotosEvent event, Emitter<PhotoListState> emit) async {
    if (state is! PhotoListEmpty) {
      try {
        emit(PhotoListFirstPageLoading());
        final photos = await getPhotosUseCase.call(
            photoPageParams: const PhotoPageParams(page: 1));
        if (photos.isEmpty) {
          emit(const PhotoListEmpty(message: "Photos not found"));
        } else {
          emit(PhotoListLoaded(photos: photos, currentPage: 1));
        }
        return;
      } catch (e) {
        emit(const PhotoListFirstPageError(message: "Failed to load photos"));
      }
    }
  }

  Future<void> _onGetNextPageOfPhotosEvent(
      GetNextPageOfPhotosEvent event, Emitter<PhotoListState> emit) async {
    if (state is! PhotoListAllLoaded && state is! PhotoListNextPageLoading) {
      List<Photo> currentPhotos = [];
      int currentPage = 0;

      if (state is PhotoListLoaded) {
        final loadedState = state as PhotoListLoaded;
        currentPhotos = loadedState.photos;
        currentPage = loadedState.currentPage;
      } else if (state is PhotoListNextPageError) {
        final errorState = state as PhotoListNextPageError;
        currentPhotos = errorState.photos;
        currentPage = currentPage;
      } else {
        return;
      }

      try {
        emit(PhotoListNextPageLoading(
          photos: currentPhotos,
          currentPage: currentPage,
        ));

        final newPhotos = await getPhotosUseCase.call(
          photoPageParams: PhotoPageParams(page: currentPage + 1),
        );

        if (newPhotos.isEmpty) {
          emit(PhotoListAllLoaded(photos: currentPhotos));
        } else {
          emit(PhotoListLoaded(
            photos: currentPhotos + newPhotos,
            currentPage: currentPage + 1,
          ));
        }
      } on Exception {
        emit(PhotoListNextPageError(
          message: "Failed to load next page",
          currentPage: currentPage,
          photos: currentPhotos,
        ));
      }
    }
  }

  void _onOpenDetailPageEvent(
      OpenDetailPageEvent event, Emitter<PhotoListState> emit) {
    router.push(AppRoutes.detailPagePath, extra: event.photo);
  }

  void _onReturnToPhotoListPageEvent(
      ReturnToPhotoListPageEvent event, Emitter<PhotoListState> emit) {
    router.pop();
  }
}
