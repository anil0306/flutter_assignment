import 'package:flutter_assignment/domain/entities/photo.dart';
import 'package:flutter_assignment/domain/usecases/get_photos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetPhotos getPhotos;

  PhotoBloc(this.getPhotos) : super(PhotoState.initial()) {
    on<LoadPhotos>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final photos = await getPhotos(event.albumId);
        final updatedPhotos = Map<int, List<Photo>>.from(state.photos)
          ..[event.albumId] = photos;
        emit(state.copyWith(photos: updatedPhotos, isLoading: false));
      } catch (_) {
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
