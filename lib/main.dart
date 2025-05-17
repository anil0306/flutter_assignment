import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/di/injector.dart';
import 'package:flutter_assignment/presentation/album_bloc/album_bloc.dart';
import 'package:flutter_assignment/presentation/album_bloc/album_event.dart';
import 'package:flutter_assignment/presentation/pages/home_page.dart';
import 'package:flutter_assignment/presentation/photo_bloc/photo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AlbumBloc>()..add(LoadAlbums())),
        BlocProvider(create: (_) => sl<PhotoBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Album App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
      ),
    );
  }
}
