part of 'photolist_bloc.dart';

abstract class PhotolistState extends Equatable {
  const PhotolistState();

  @override
  List<Object> get props => [];
}

class PhotolistInitial extends PhotolistState {}

class PhotoListLoading extends PhotolistState {}

class PhotoListLoaded extends PhotolistState {
  final List<Photo> photos;
  final bool hasReachedMax;

  const PhotoListLoaded({required this.photos, required this.hasReachedMax});

  @override
  List<Object> get props => [photos, hasReachedMax];

  PhotoListLoaded copyWith({
    List<Photo>? photos,
    bool? hasReachedMax,
  }) {
    return PhotoListLoaded(
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class PhotoListError extends PhotolistState {
  final String message;

  const PhotoListError({required this.message});

  @override
  List<Object> get props => [message];
}
