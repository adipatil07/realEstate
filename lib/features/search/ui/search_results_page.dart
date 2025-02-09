import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/listing/ui/property_card.dart';
import 'package:homescout/features/search/bloc/search_bloc.dart';

class SearchResultsPage extends StatelessWidget {
  final String query;

  const SearchResultsPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc()..add(SearchProperties(query)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Results', style: AppTextStyles.appBarTitle),
          backgroundColor: AppColors.background,
        ),
        body: Container(
          color: AppColors.background,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Filter options
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterDropdown(
                        'Property Type', ['Flat', 'Villa', 'Plot']),
                    SizedBox(width: 8),
                    _buildFilterDropdown(
                        'BHK Type', ['1 BHK', '2 BHK', '3 BHK', '4+ BHK']),
                    SizedBox(width: 8),
                    _buildFilterDropdown(
                        'Price', ['₹0 - ₹50L', '₹50L - ₹1Cr', '₹1Cr - ₹5Cr']),
                    SizedBox(width: 8),
                    _buildFilterDropdown('Sale Type', ['New', 'Resale']),
                    SizedBox(width: 8),
                    _buildFilterDropdown('Construction Status',
                        ['Under Construction', 'Ready to Move']),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is SearchLoaded) {
                      return ListView.builder(
                        itemCount: state.properties.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PropertyCard(property: state.properties[index]),
                              SizedBox(height: 16),
                            ],
                          );
                        },
                      );
                    } else if (state is SearchError) {
                      return Center(
                          child:
                              Text(state.message, style: AppTextStyles.error));
                    } else {
                      return Center(
                          child: Text('Search for properties',
                              style: AppTextStyles.body));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterDropdown(String label, List<String> options) {
    return DropdownButton<String>(
      hint: Text(label, style: AppTextStyles.body),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: AppTextStyles.body),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }
}
