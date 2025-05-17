import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/presentation/blocs/album_bloc.dart';
import 'package:flutter_assignment/presentation/blocs/album_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Album')),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];
                return ListTile(
                  title: Text(album.title),
                  subtitle: Text('Album ID: ${album.id}'),
                );
              },
            );
          } else if (state is AlbumError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Press a button to load albums.'));
        },
      ),
    );
  }
}
