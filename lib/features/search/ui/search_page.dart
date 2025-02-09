import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/search/bloc/search_bloc.dart';
import 'package:homescout/features/search/ui/search_results_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: SearchPageView(),
    );
  }
}

class SearchPageView extends StatefulWidget {
  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Properties', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.background,
      ),
      body: Container(
        color: AppColors.background,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Locality, Landmark, Project...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (query) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultsPage(query: query),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            // Filters section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterOption('Price'),
                _buildFilterOption('Location'),
                _buildFilterOption('Type'),
                _buildFilterOption('More'),
              ],
            ),
            SizedBox(height: 16),
            // Recent searches
            _buildSectionTitle('Your Recent Searches'),
            SizedBox(height: 10),
            _buildHorizontalList(['Buy, Vadgaon Budruk, Any BHK, Any price']),
            SizedBox(height: 16),
            // Popular localities
            _buildSectionTitle('Popular Localities'),
            SizedBox(height: 10),
            _buildHorizontalList(['Punawale', 'Tathawade', 'Charholi']),
            SizedBox(height: 16),
            // Trending projects
            _buildSectionTitle('Trending Projects'),
            SizedBox(height: 10),
            _buildHorizontalList(
                ['Kohinoor Woodshire', 'Pride Wellington EHJK']),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: AppTextStyles.subHeading),
    );
  }

  Widget _buildHorizontalList(List<String> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(item, style: AppTextStyles.body),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFilterOption(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(label, style: AppTextStyles.body),
          Icon(Icons.keyboard_arrow_down, size: 18),
        ],
      ),
    );
  }
}
