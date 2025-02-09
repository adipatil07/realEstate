import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'review_property_event.dart';
part 'review_property_state.dart';

class ReviewPropertyBloc extends Bloc<ReviewPropertyEvent, ReviewPropertyState> {
  ReviewPropertyBloc() : super(ReviewPropertyLoading()) {
    on<LoadReviewProperty>((event, emit) async {
      // Simulating data fetching
      await Future.delayed(const Duration(seconds: 2));

      emit(ReviewPropertyLoaded(
        price: "20000",
        propertyType: "Commercial Office",
        area: "1500 sq. ft.",
        location: "Developer World",
        listingScore: 98.0,
        imagePath: event.image, // ✅ Use image from event
      ));
    });
  }
}
