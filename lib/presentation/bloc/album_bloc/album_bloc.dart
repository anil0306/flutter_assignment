import 'package:flutter_assignment/domain/usecases/get_albums.dart';
import 'package:flutter_assignment/presentation/bloc/album_bloc/album_event.dart';
import 'package:flutter_assignment/presentation/bloc/album_bloc/album_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetAlbums getAlbums;

  AlbumBloc(this.getAlbums) : super(AlbumInitial()) {
    on<LoadAlbums>(_onLoadAlbums);
  }

  Future<void> _onLoadAlbums(LoadAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      final albums = await getAlbums();
      emit(AlbumLoaded(albums));
    } catch (e) {
      emit(AlbumError("Failed to load albums: ${e.toString()}"));
    }
  }
}
