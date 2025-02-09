import 'package:bloc/bloc.dart';
import 'package:homescout/features/listing/domain/listing_property_model.dart';
import 'package:meta/meta.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc() : super(ListingInitial()) {
    on<FetchListings>((event, emit) async {
      emit(ListingLoading());

      try {
        final properties = [
          Property(
            locality: "Pune",
            sizes: "1200 Sq.foot",
            desciption:
                "A beautiful 2 BHK flat in Bibwewadi, Pune, with a great view of the city, and a great location.",
            title: 'Sanskruti Panchtatva',
            developer: 'Sanskruti Group',
            location: 'Bibwewadi, Pune',
            propertyType: '2 BHK Flat',
            possessionDate: 'Apr 2026',
            status: 'Under Construction',
            averagePrice: '₹11.88K/sq.ft',
            price: 9400000, // ₹94.0 L
            emi: 46670, // EMI example
            imageUrls: [
              'https://www.mustikaland.co.id/img/apa-itu-real-estate.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDS43ER1Br-EGbTUI_cN6K8j_Q2QYFD4z1_kqpIYS5sC3Rvam_YJ0tEj0-ExCayqPUM5M&usqp=CAU',
            ],
            nearbyPlaces: ['Vidyaniketan - 1.2 km', 'Vighnahar - 1.7 km'],
          ),
          Property(
            locality: "Mumbai",
            sizes: "1500 Sq.foot",
            desciption:
                "Luxurious 3 BHK apartment in Andheri, Mumbai, with modern amenities and great connectivity.",
            title: 'Oberoi Splendor',
            developer: 'Oberoi Realty',
            location: 'Andheri, Mumbai',
            propertyType: '3 BHK Apartment',
            possessionDate: 'Dec 2023',
            status: 'Ready to Move',
            averagePrice: '₹20.00K/sq.ft',
            price: 30000000, // ₹3.0 Cr
            emi: 150000, // EMI example
            imageUrls: [
              'https://www.mustikaland.co.id/img/apa-itu-real-estate.jpg',
              'https://www.mustikaland.co.id/img/apa-itu-real-estate.jpg',
            ],
            nearbyPlaces: [
              'Infinity Mall - 0.5 km',
              'Andheri Station - 1.0 km'
            ],
          ),
          Property(
            locality: "Bangalore",
            sizes: "1800 Sq.foot",
            desciption:
                "Spacious 4 BHK villa in Whitefield, Bangalore, with a private garden and clubhouse access.",
            title: 'Prestige Lakeside Habitat',
            developer: 'Prestige Group',
            location: 'Whitefield, Bangalore',
            propertyType: '4 BHK Villa',
            possessionDate: 'Jun 2025',
            status: 'Under Construction',
            averagePrice: '₹15.00K/sq.ft',
            price: 27000000, // ₹2.7 Cr
            emi: 135000, // EMI example
            imageUrls: [
              'https://www.mustikaland.co.id/img/apa-itu-real-estate.jpg',
              'https://www.mustikaland.co.id/img/apa-itu-real-estate.jpg',
            ],
            nearbyPlaces: ['Forum Mall - 2.0 km', 'ITPL - 3.0 km'],
          ),
        ];

        emit(ListingLoaded(properties));
      } catch (e) {
        emit(ListingError("Failed to fetch listings"));
      }
    });

    on<FetchListingDetailsEvent>((event, emit) {
      emit(ListingDetailsLoadingState());
      try {
        emit(
          ListingDetailsLoadedState(
            Property(
              locality: "Pune",
              sizes: "1200 Sq.foot",
              desciption:
                  "A beautiful 2 BHK flat in Bibwewadi, Pune, with a great view of the city, and a great location.",
              title: 'Sanskruti Panchtatva',
              developer: 'Sanskruti Group',
              location: 'Bibwewadi, Pune',
              propertyType: '2 BHK Flat',
              possessionDate: 'Apr 2026',
              status: 'Under Construction',
              averagePrice: '₹11.88K/sq.ft',
              price: 9400000,
              emi: 46670,
              imageUrls: [
                'https://www.mustikaland.co.id/img/apa-itu-real-estate.jpg',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDS43ER1Br-EGbTUI_cN6K8j_Q2QYFD4z1_kqpIYS5sC3Rvam_YJ0tEj0-ExCayqPUM5M&usqp=CAU',
              ],
              nearbyPlaces: ['Vidyaniketan - 1.2 km', 'Vighnahar - 1.7 km'],
            ),
          ),
        );
      } catch (e) {
        emit(ListingDetailsErrorState("Failed to load property details"));
      }
    });

    on<ToggleAmenitiesVisibilityEvent>((event, emit) {
      if (state is ListingDetailsLoadedState) {
        final currentState = state as ListingDetailsLoadedState;
        emit(ListingDetailsLoadedState(currentState.property,
            showAllAmenities: !currentState.showAllAmenities));
      }
    });

    on<ToggleDetailsVisibilityEvent>((event, emit) {
      if (state is ListingDetailsLoadedState) {
        final currentState = state as ListingDetailsLoadedState;
        emit(ListingDetailsLoadedState(currentState.property,
            showAllDetails: !currentState.showAllDetails));
      }
    });
  }
}
