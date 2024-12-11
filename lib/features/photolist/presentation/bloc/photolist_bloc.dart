
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photolist_event.dart';
part 'photolist_state.dart';

class PhotolistBloc extends Bloc<PhotolistEvent, PhotolistState> {
  PhotolistBloc() : super(PhotolistInitial()) {
    on<PhotolistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
