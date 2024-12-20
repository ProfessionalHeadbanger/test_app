part of 'photolist_bloc.dart';

abstract class PhotoListState extends Equatable {
  const PhotoListState();

  @override
  List<Object> get props => [];
}

class PhotoListFirstPageLoading extends PhotoListState {}

class PhotoListFirstPageError extends PhotoListState {
  final String message;

  const PhotoListFirstPageError({required this.message});

  @override
  List<Object> get props => [message];
}

class PhotoListEmpty extends PhotoListState {
  final String message;

  const PhotoListEmpty({required this.message});

  @override
  List<Object> get props => [message];
}

class PhotoListLoaded extends PhotoListState {
  final List<Photo> photos;
  final int currentPage;

  const PhotoListLoaded({
    required this.photos,
    required this.currentPage,
  });

  @override
  List<Object> get props => [photos, currentPage];

  PhotoListLoaded copyWith({
    List<Photo>? photos,
    int? currentPage,
  }) {
    return PhotoListLoaded(
      photos: photos ?? this.photos,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class PhotoListNextPageLoading extends PhotoListState {
  final List<Photo> photos;
  final int currentPage;

  const PhotoListNextPageLoading(
      {required this.photos, required this.currentPage});

  @override
  List<Object> get props => [photos, currentPage];
}

class PhotoListNextPageError extends PhotoListState {
  final String message;
  final int currentPage;
  final List<Photo> photos;

  const PhotoListNextPageError(
      {required this.message, required this.currentPage, required this.photos});

  @override
  List<Object> get props => [message, currentPage, photos];

  PhotoListNextPageError copyWith({
    String? message,
    int? currentPage,
    List<Photo>? photos,
  }) {
    return PhotoListNextPageError(
      message: message ?? this.message,
      currentPage: currentPage ?? this.currentPage,
      photos: photos ?? this.photos,
    );
  }
}

class PhotoListAllLoaded extends PhotoListState {
  final List<Photo> photos;

  const PhotoListAllLoaded({
    required this.photos,
  });

  @override
  List<Object> get props => [photos];
}
