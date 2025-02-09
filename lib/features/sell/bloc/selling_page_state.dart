part of 'selling_page_bloc.dart';

@immutable
sealed class SellingPageState {}

final class SellingPageInitial extends SellingPageState {}

class PropertyTypeSelected extends SellingPageState {
  final String? selectedType;
  final String? selectedCommercialSubType;
  final String? selectedResedentialSubType;

  PropertyTypeSelected({this.selectedType, this.selectedCommercialSubType,this.selectedResedentialSubType});
}
