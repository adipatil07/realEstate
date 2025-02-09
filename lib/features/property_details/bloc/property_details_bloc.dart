import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'property_details_event.dart';
part 'property_details_state.dart';

class PropertyDetailsBloc
    extends Bloc<PropertyDetailsEvent, PropertyDetailsState> {
  PropertyDetailsBloc() : super(PropertyDetailsInitial()) {
    on<PropertyDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SelectCompletionDate>((event, emit) {
      if (state is PropertyProfessionInformationSelectedState) {
        final currentState =
            state as PropertyProfessionInformationSelectedState;
        emit(PropertyProfessionInformationSelectedState(
          selectedProfessionInformation:
              currentState.selectedProfessionInformation,
          completionDate: event.completionDate,
        ));
      }
    });

    on<SelectPropertyProfessionInformation>((event, emit) {
      final currentState = state is PropertyProfessionInformationSelectedState
          ? state as PropertyProfessionInformationSelectedState
          : null;

      emit(PropertyProfessionInformationSelectedState(
        selectedProfessionInformation: event.professionInformation,
        completionDate: currentState?.completionDate,
        selectedLocationHubType: currentState?.selectedLocationHubType,
      ));
    });

    on<SelectLocationHubType>((event, emit) {
      if (state is PropertyProfessionInformationSelectedState) {
        final currentState =
            state as PropertyProfessionInformationSelectedState;
        emit(currentState.copyWith(
            selectedLocationHubType: event.locationHubType));
      } else {
        // If no profession type is selected, still allow hub selection
        emit(PropertyProfessionInformationSelectedState(
          selectedLocationHubType: event.locationHubType,
        ));
      }
    });

    on<SelectOwnershipType>((event, emit) {
      if (state is PropertyProfessionInformationSelectedState) {
        final currentState =
            state as PropertyProfessionInformationSelectedState;
        emit(currentState.copyWith(selectedOwnershipType: event.ownershipType));
      } else {
        // If no profession type is selected, still allow ownership selection
        emit(PropertyProfessionInformationSelectedState(
          selectedOwnershipType: event.ownershipType,
        ));
      }
    });
    on<SelectRoomType>((event, emit) {
      if (state is PropertyProfessionInformationSelectedState) {
        final currentState =
            state as PropertyProfessionInformationSelectedState;
        emit(currentState.copyWith(selectedRoomType: event.roomType));
      } else {
        // If no profession type is selected, still allow ownership selection
        emit(PropertyProfessionInformationSelectedState(
          selectedRoomType: event.roomType,
        ));
      }
    });
    on<SelectFurnishedType>((event, emit) {
      if (state is PropertyProfessionInformationSelectedState) {
        final currentState =
            state as PropertyProfessionInformationSelectedState;
        emit(currentState.copyWith(selectedFurnishedType: event.furnishedType));
      } else {
        // If no profession type is selected, still allow ownership selection
        emit(PropertyProfessionInformationSelectedState(
          selectedFurnishedType: event.furnishedType,
        ));
      }
    });
  }
}
