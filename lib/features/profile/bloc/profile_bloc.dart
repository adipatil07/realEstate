import 'package:bloc/bloc.dart';
import 'package:homescout/features/profile/domain/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading()); // New loading state
      await Future.delayed(Duration(seconds: 2));
      final user = User(
        name: 'John Doe',
        email: 'johndoe@example.com',
        username: 'john_doe',
        phone: '+1 234 567 890',
        address: '123 Main St, Springfield, USA',
        propertiesListed: 5,
        favorites: 10,
      );
      emit(ProfileLoaded(user));
    });
  }
}
