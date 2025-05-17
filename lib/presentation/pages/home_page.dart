import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/album_bloc/album_bloc.dart';
import 'package:flutter_assignment/presentation/album_bloc/album_state.dart';
import 'package:flutter_assignment/presentation/photo_bloc/photo_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Album')),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, albumState) {
          if (albumState is AlbumLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (albumState is AlbumLoaded) {
            final albums = albumState.albums;

            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];

                // Trigger load of photos for this album
                context.read<PhotoBloc>().add(LoadPhotos(album.id));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(title: Text('Album ID: ${album.id}')),
                    SizedBox(
                      height: 150,
                      child: BlocBuilder<PhotoBloc, PhotoState>(
                        builder: (context, photoState) {
                          final photos = photoState.photos[album.id] ?? [];

                          if (photos.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final loopedPhotos = List.generate(
                            50,
                            (i) => photos[i % photos.length],
                          );

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: loopedPhotos.length,
                            itemBuilder: (_, i) {
                              final photo = loopedPhotos[i];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: photo.url,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  placeholder:
                                      (_, __) => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                  errorWidget:
                                      (_, __, ___) => const Icon(Icons.error),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (albumState is AlbumError) {
            return Center(child: Text(albumState.message));
          }
          return const Center(child: Text('Press a button to load albums.'));
        },
      ),
    );
  }
}
