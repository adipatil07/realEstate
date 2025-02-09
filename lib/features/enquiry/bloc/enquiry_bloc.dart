import 'package:bloc/bloc.dart';
import 'package:homescout/features/enquiry/domain/data/enquiry_model.dart';
import 'package:meta/meta.dart';

part 'enquiry_event.dart';
part 'enquiry_state.dart';

class EnquiryBloc extends Bloc<EnquiryEvent, EnquiryState> {
  EnquiryBloc() : super(EnquiryInitial()) {
    on<LoadEnquiries>((event, emit) async {
      emit(EnquiryLoading());
      await Future.delayed(Duration(seconds: 2));
      final enquiries = [
        Enquiry(
          title: 'Enquiry 1',
          description: 'Description for enquiry 1',
          status: 'Pending',
          timestamp: DateTime.now().toString(),
        ),
        Enquiry(
          title: 'Enquiry 2',
          description: 'Description for enquiry 2',
          status: 'Responded',
          timestamp: DateTime.now().toString(),
        ),
        // Add more enquiries as needed
      ];
      if (enquiries.isEmpty) {
        emit(EnquiryError("Failed to load enquiries"));
      } else {
        emit(EnquiryLoaded(enquiries));
      }
    });
  }
}
