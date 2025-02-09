part of 'prize_details_bloc.dart';

@immutable
sealed class PrizeDetailsState {}

final class PrizeDetailsInitial extends PrizeDetailsState {}

final class PrizeDetailsUpdated extends PrizeDetailsState {
  final List<String> selectedAmenities;
  final List<File> selectedImages;

  PrizeDetailsUpdated({required this.selectedAmenities, required this.selectedImages});
}
