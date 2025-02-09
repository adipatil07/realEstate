part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchProperties extends SearchEvent {
  final String query;

  SearchProperties(this.query);
}