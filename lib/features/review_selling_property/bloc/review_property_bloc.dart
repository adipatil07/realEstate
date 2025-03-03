import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:homescout/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'review_property_event.dart';
part 'review_property_state.dart';

class ReviewPropertyBloc
    extends Bloc<ReviewPropertyEvent, ReviewPropertyState> {
  // final FirebaseService _firebaseService;

  ReviewPropertyBloc() : super(ReviewPropertyLoading()) {
    on<LoadReviewProperty>((event, emit) async {
      // Simulating data fetching
      emit(ReviewPropertyLoading());

      try {
        final propertyData =
            await FirebaseService().fetchPropertyById(event.propertyId);

        if (propertyData != null) {
          print("✅ [Bloc] Emitting ReviewPropertyLoaded State");

          emit(ReviewPropertyLoaded(
            propertyId: event.propertyId,
            price: propertyData['price'].toString(),
            propertyType: propertyData['propertyType'],
            area: "${propertyData['builtUpArea']} sq. ft.",
            location: propertyData['city'],
            listingScore: 98.0, // Add logic for score calculation if needed
            imagePath: propertyData['images'].isNotEmpty
                ? propertyData['images'][0]
                : "",
          ));
        } else {
          emit(ReviewPropertyError(msg: "Property not found!"));
        }
      } catch (e) {
        emit(ReviewPropertyError(msg: "Error fetching property details: $e"));
      }
    });
  }
}
