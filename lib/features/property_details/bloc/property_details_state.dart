part of 'property_details_bloc.dart';

@immutable
sealed class PropertyDetailsState {}

final class PropertyDetailsInitial extends PropertyDetailsState {}

final class PropertyProfessionInformationSelectedState
    extends PropertyDetailsState {
  final String? selectedProfessionInformation;
  final DateTime? completionDate;
  final String? selectedLocationHubType;
  final String? selectedOwnershipType;
  final String? selectedRoomType;
  final String? selectedFurnishedType;

  PropertyProfessionInformationSelectedState({
    this.selectedProfessionInformation,
    this.completionDate,
    this.selectedLocationHubType,
    this.selectedOwnershipType,
    this.selectedRoomType,
    this.selectedFurnishedType,
  });

  PropertyProfessionInformationSelectedState copyWith(
      {String? selectedProfessionInformation,
      DateTime? completionDate,
      String? selectedLocationHubType,
      String? selectedOwnershipType,
      String? selectedRoomType,
      String? selectedFurnishedType}) {
    return PropertyProfessionInformationSelectedState(
      selectedProfessionInformation:
          selectedProfessionInformation ?? this.selectedProfessionInformation,
      completionDate: completionDate ?? this.completionDate,
      selectedLocationHubType:
          selectedLocationHubType ?? this.selectedLocationHubType,
      selectedOwnershipType:
          selectedOwnershipType ?? this.selectedOwnershipType,
      selectedRoomType: selectedRoomType ?? this.selectedRoomType,
      selectedFurnishedType:
          selectedFurnishedType ?? this.selectedFurnishedType,
    );
  }
}

final class PropertyDetailsError extends PropertyDetailsState {
  final String message;

  PropertyDetailsError(this.message);
}

final class PropertyDetailsLoading extends PropertyDetailsState {}
