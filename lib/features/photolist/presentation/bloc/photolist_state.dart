part of 'photolist_bloc.dart';

abstract class PhotolistState extends Equatable {
  const PhotolistState();

  @override
  List<Object> get props => [];
}

class PhotolistInitial extends PhotolistState {}
