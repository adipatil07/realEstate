part of 'base_bloc.dart';

@immutable
sealed class BaseEvent {}

class UpdateBottomNavEvent extends BaseEvent {
  final int index;
  UpdateBottomNavEvent({required this.index});
}