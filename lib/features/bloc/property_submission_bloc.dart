import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/data/models/property_model.dart';
import 'package:homescout/services/firebase_service.dart';

part 'property_submission_event.dart';
part 'property_submission_state.dart';

class PropertySubmissionBloc
    extends Bloc<PropertySubmissionEvent, PropertySubmissionState> {
  CreatePropertyModel _property =
      CreatePropertyModel.empty(); // Initial empty property

  PropertySubmissionBloc() : super(PropertySubmissionInitial()) {
    on<UpdatePropertyData>((event, emit) {
      _property = _property.copyWith(
        id: event.propertyId ?? _property.id,
        propertyType: event.propertyType ?? _property.propertyType,
        commercialSubType:
            event.commercialSubType ?? _property.commercialSubType,
        residentialSubType:
            event.residentialSubType ?? _property.residentialSubType,
        city: event.city ?? _property.city,
        buildingName: event.buildingName ?? _property.buildingName,
        locality: event.locality ?? _property.locality,
        address: event.address ?? _property.address,
        price: event.price ?? _property.price,
        expectedRent: event.expectedRent ?? _property.expectedRent,
        possessionStatus: event.possessionStatus ?? _property.possessionStatus,
        ageOfProperty: event.ageOfProperty ?? _property.ageOfProperty,
        completionDate: event.completionDate ?? _property.completionDate,
        locationHubType: event.locationHubType ?? _property.locationHubType,
        builtUpArea: event.builtUpArea ?? _property.builtUpArea,
        carpetArea: event.carpetArea ?? _property.carpetArea,
        ownershipType: event.ownershipType ?? _property.ownershipType,
        roomType: event.roomType ?? _property.roomType,
        furnishedCondition:
            event.furnishedCondition ?? _property.furnishedCondition,
        totalFloors: event.totalFloors ?? _property.totalFloors,
        propertyFloor: event.propertyFloor ?? _property.propertyFloor,
        amenities: event.amenities ?? _property.amenities,
        images: event.images ?? _property.images,
        description: event.description ?? _property.description,
      );
      emit(PropertyDataUpdated(_property));
    });

    on<SubmitProperty>((event, emit) async {
      emit(PropertySubmitting());
      try {
        await FirebaseService().addProperty(_property);
        emit(PropertySubmittedSuccess());
      } catch (e) {
        emit(PropertySubmittedFailure("Error submitting property: $e"));
      }
    });
  }
}
