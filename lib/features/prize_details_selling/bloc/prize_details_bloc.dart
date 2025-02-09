import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'prize_details_event.dart';
part 'prize_details_state.dart';

class PrizeDetailsBloc extends Bloc<PrizeDetailsEvent, PrizeDetailsState> {
  final ImagePicker _picker = ImagePicker();

  PrizeDetailsBloc() : super(PrizeDetailsInitial()) {
    on<ToggleAmenitySelection>((event, emit) {
      if (state is PrizeDetailsUpdated) {
        final updatedState = state as PrizeDetailsUpdated;
        final List<String> updatedAmenities = List.from(updatedState.selectedAmenities);

        if (updatedAmenities.contains(event.amenity)) {
          updatedAmenities.remove(event.amenity);
        } else {
          updatedAmenities.add(event.amenity);
        }

        emit(PrizeDetailsUpdated(
          selectedAmenities: updatedAmenities,
          selectedImages: updatedState.selectedImages,
        ));
      } else {
        emit(PrizeDetailsUpdated(selectedAmenities: [event.amenity], selectedImages: []));
      }
    });

    on<PickImageEvent>((event, emit) async {
      final XFile? pickedFile = await _picker.pickImage(source: event.source);
      if (pickedFile != null) {
        final List<File> updatedImages = (state is PrizeDetailsUpdated)
            ? List.from((state as PrizeDetailsUpdated).selectedImages)
            : [];

        updatedImages.add(File(pickedFile.path));

        emit(PrizeDetailsUpdated(
          selectedAmenities: (state is PrizeDetailsUpdated)
              ? (state as PrizeDetailsUpdated).selectedAmenities
              : [],
          selectedImages: updatedImages,
        ));
      }
    });

    on<RemoveImageEvent>((event, emit) {
      if (state is PrizeDetailsUpdated) {
        final updatedState = state as PrizeDetailsUpdated;
        final List<File> updatedImages = List.from(updatedState.selectedImages);
        updatedImages.removeAt(event.index);

        emit(PrizeDetailsUpdated(
          selectedAmenities: updatedState.selectedAmenities,
          selectedImages: updatedImages,
        ));
      }
    });
  }
}
