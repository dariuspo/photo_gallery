part of 'photo_list_bloc.dart';

abstract class PhotoListEvent {}

class FetchPhotos extends PhotoListEvent{}

class SearchPhotos extends PhotoListEvent{
  SearchPhotos({required this.query});

  final String query;
}
