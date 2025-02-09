import 'package:bloc/bloc.dart';
import 'package:homescout/features/listing/domain/listing_property_model.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchProperties>((event, emit) async {
      emit(SearchLoading());
      await Future.delayed(Duration(seconds: 2)); // Simulate network delay
      final properties = [
        Property(
          title: 'Property 1',
          desciption: 'Description for property 1',
          price: 100000,
          status: 'Available',
          sizes: "1200",
          locality: event.query,
          imageUrls: [
            'https://media.istockphoto.com/id/1317323736/photo/a-view-up-into-the-trees-direction-sky.jpg?s=612x612&w=0&k=20&c=i4HYO7xhao7CkGy7Zc_8XSNX_iqG0vAwNsrH1ERmw2Q='
          ],
          developer: '',
          location: '',
          propertyType: '',
          possessionDate: '',
          averagePrice: '',
          emi: 1500,
          nearbyPlaces: [],
        ),
        Property(
          title: 'Property 2',
          desciption: 'Description for property 2',
          price: 200000,
          status: 'Sold',
          sizes: "1500",
          locality: event.query,
          imageUrls: [
            'https://media.istockphoto.com/id/1317323736/photo/a-view-up-into-the-trees-direction-sky.jpg?s=612x612&w=0&k=20&c=i4HYO7xhao7CkGy7Zc_8XSNX_iqG0vAwNsrH1ERmw2Q='
          ],
          developer: '',
          location: '',
          propertyType: '',
          possessionDate: '',
          averagePrice: '',
          emi: 1500,
          nearbyPlaces: [],
        ),
        // Add more properties as needed
      ];
      if (properties.isEmpty) {
        emit(SearchError("No properties found"));
      } else {
        emit(SearchLoaded(properties));
      }
    });
  }
}
