import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/listing/bloc/listing_bloc.dart';
import 'package:homescout/features/listing/ui/listing_property_details_page.dart';
import 'package:homescout/features/listing/ui/property_card.dart';

class ListingPage extends StatelessWidget {
  const ListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingBloc()..add(FetchListings()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            'Property Listings',
            style: AppTextStyles.appBarTitle,
          ),
          backgroundColor: AppColors.background,
        ),
        body: BlocBuilder<ListingBloc, ListingState>(
          builder: (context, state) {
            if (state is ListingLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListingLoaded) {
              return ListView.builder(
                itemCount: state.properties.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListingPropertyDetailsPage(),
                          ),
                        );
                      },
                      child: PropertyCard(property: state.properties[index]));
                },
              );
            } else {
              return Center(child: Text('No listings available'));
            }
          },
        ),
      ),
    );
  }
}
