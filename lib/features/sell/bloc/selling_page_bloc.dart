import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selling_page_event.dart';
part 'selling_page_state.dart';

class SellingPageBloc extends Bloc<SellingPageEvent, SellingPageState> {
  SellingPageBloc() : super(SellingPageInitial()) {
    on<SelectPropertyType>((event, emit) {
      emit(PropertyTypeSelected(
        selectedType: event.propertyType,
        selectedCommercialSubType: null, // Reset subtype
        selectedResedentialSubType: null, // Reset subtype
      ));
    });

    on<SelectCommercialSubType>((event, emit) {
      if (state is PropertyTypeSelected) {
        final currentState = state as PropertyTypeSelected;
        emit(PropertyTypeSelected(
          selectedType: currentState.selectedType,
          selectedCommercialSubType: event.commercialSubType,
          selectedResedentialSubType: currentState.selectedResedentialSubType, // Preserve
        ));
      }
    });

    on<SelectResedentialSubType>((event, emit) {
      if (state is PropertyTypeSelected) {
        final currentState = state as PropertyTypeSelected;
        emit(PropertyTypeSelected(
          selectedType: currentState.selectedType,
          selectedCommercialSubType: currentState.selectedCommercialSubType, // Preserve
          selectedResedentialSubType: event.resedentialSubType,
        ));
      }
    });
  }
}
