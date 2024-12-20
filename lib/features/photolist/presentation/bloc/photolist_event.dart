part of 'photolist_bloc.dart';

abstract class PhotoListEvent extends Equatable {
  const PhotoListEvent();

  @override
  List<Object> get props => [];
}

class GetFirstPageOfPhotosEvent extends PhotoListEvent {
  const GetFirstPageOfPhotosEvent();
}

class GetNextPageOfPhotosEvent extends PhotoListEvent {
  const GetNextPageOfPhotosEvent();
}

class OpenDetailPageEvent extends PhotoListEvent {
  final Photo photo;

  const OpenDetailPageEvent({required this.photo});

  @override
  List<Object> get props => [photo];
}

class ReturnToPhotoListPageEvent extends PhotoListEvent {
  const ReturnToPhotoListPageEvent();
}
