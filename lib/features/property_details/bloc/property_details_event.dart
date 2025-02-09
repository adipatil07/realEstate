part of 'property_details_bloc.dart';

@immutable
abstract class PropertyDetailsEvent {}

class SelectPropertyProfessionInformation extends PropertyDetailsEvent {
  final String professionInformation;
  SelectPropertyProfessionInformation(this.professionInformation);
}

class SelectCompletionDate extends PropertyDetailsEvent {
  final DateTime completionDate;
  SelectCompletionDate(this.completionDate);
}

class SelectLocationHubType extends PropertyDetailsEvent {
  final String locationHubType;
  SelectLocationHubType(this.locationHubType);
}

class SelectOwnershipType extends PropertyDetailsEvent {
  final String ownershipType;
  SelectOwnershipType(this.ownershipType);
}

class SelectRoomType extends PropertyDetailsEvent {
  final String roomType;
  SelectRoomType(this.roomType);
}
class SelectFurnishedType extends PropertyDetailsEvent {
  final String furnishedType;
  SelectFurnishedType(this.furnishedType);
}
