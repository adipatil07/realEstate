part of 'property_submission_bloc.dart';

abstract class PropertySubmissionEvent {}

class UpdatePropertyData extends PropertySubmissionEvent {
  final String? propertyType;
  final String? propertyId;
  final String? commercialSubType;
  final String? residentialSubType;
  final String? city;
  final String? buildingName;
  final String? locality;
  final String? address;
  final double? price;
  final double? expectedRent;
  final String? possessionStatus;
  final int? ageOfProperty;
  final DateTime? completionDate;
  final String? locationHubType;
  final double? builtUpArea;
  final double? carpetArea;
  final String? ownershipType;
  final String? roomType;
  final String? furnishedCondition;
  final int? totalFloors;
  final int? propertyFloor;
  final List<String>? amenities;
  final List<String>? images;
  final String? description;

  UpdatePropertyData({
    this.propertyId, 
    this.propertyType,
    this.commercialSubType,
    this.residentialSubType,
    this.city,
    this.buildingName,
    this.locality,
    this.address,
    this.price,
    this.expectedRent,
    this.possessionStatus,
    this.ageOfProperty,
    this.completionDate,
    this.locationHubType,
    this.builtUpArea,
    this.carpetArea,
    this.ownershipType,
    this.roomType,
    this.furnishedCondition,
    this.totalFloors,
    this.propertyFloor,
    this.amenities,
    this.images,
    this.description,
  });
}

class SubmitProperty extends PropertySubmissionEvent {}
