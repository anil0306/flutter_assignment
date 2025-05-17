import 'package:flutter_assignment/core/network/api_service.dart';
import 'package:flutter_assignment/presentation/blocs/album_event.dart';
import 'package:flutter_assignment/presentation/blocs/album_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final ApiService api;

  AlbumBloc(this.api) : super(AlbumInitial()) {
    on<LoadAlbums>(_onLoadAlbums);
  }

  Future<void> _onLoadAlbums(LoadAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      final albums = await api.getAlbums();
      emit(AlbumLoaded(albums));
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }
}
