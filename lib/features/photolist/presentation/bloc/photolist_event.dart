part of 'photolist_bloc.dart';

abstract class PhotolistEvent extends Equatable {
  const PhotolistEvent();

  @override
  List<Object> get props => [];
}

class GetNextPageOfPhotosEvent extends PhotolistEvent {
  const GetNextPageOfPhotosEvent();
}
