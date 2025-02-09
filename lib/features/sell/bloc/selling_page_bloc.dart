import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selling_page_event.dart';
part 'selling_page_state.dart';

class SellingPageBloc extends Bloc<SellingPageEvent, SellingPageState> {
  SellingPageBloc() : super(SellingPageInitial()) {
    // on<SellingPageEvent>((event, emit) {
    //   // TODO: implement event handler
    //   on(handler)
    // });

    on<SelectPropertyType>((event, emit) {
      emit(PropertyTypeSelected(selectedType: event.propertyType));
    });

    on<SelectCommercialSubType>((event, emit) {
      if (state is PropertyTypeSelected) {
        final currentState = state as PropertyTypeSelected;
        emit(PropertyTypeSelected(
          selectedType: currentState.selectedType,
          selectedCommercialSubType: event.commercialSubType,
        ));
      }
    });

    on<SelectResedentialSubType>((event, emit) {
      if (state is PropertyTypeSelected) {
        final currentState = state as PropertyTypeSelected;
        emit(PropertyTypeSelected(
          selectedType: currentState.selectedType,
          selectedResedentialSubType: event.resedentialSubType,
        ));
      }
    });
  }
}
