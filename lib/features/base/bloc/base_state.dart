part of 'base_bloc.dart';

@immutable
sealed class BaseState {
  final int index;
  const BaseState({required this.index});
}

final class BaseInitial extends BaseState {
  const BaseInitial() : super(index: 0);
}

final class BaseUpdated extends BaseState {
  const BaseUpdated({required int index}) : super(index: index);
}
