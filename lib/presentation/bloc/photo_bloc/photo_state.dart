part of 'photo_bloc.dart';

class PhotoState extends Equatable {
  final Map<int, List<Photo>> photos;
  final bool isLoading;

  const PhotoState({required this.photos, required this.isLoading});

  factory PhotoState.initial() =>
      const PhotoState(photos: {}, isLoading: false);

  PhotoState copyWith({Map<int, List<Photo>>? photos, bool? isLoading}) =>
      PhotoState(
        photos: photos ?? this.photos,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [photos, isLoading];
}
