part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {} // Added loading state

class ProfileLoaded extends ProfileState {
  final User user;
  ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {}
