part of 'selling_page_bloc.dart';

@immutable
sealed class SellingPageEvent {}

class SelectPropertyType extends SellingPageEvent {
  final String propertyType;

  SelectPropertyType(this.propertyType);
}

class SelectCommercialSubType extends SellingPageEvent {
  final String commercialSubType;

  SelectCommercialSubType(this.commercialSubType);
}

class SelectResedentialSubType extends SellingPageEvent {
  final String resedentialSubType;

  SelectResedentialSubType(this.resedentialSubType);
}
