import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/listing/bloc/listing_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:homescout/features/listing/domain/listing_property_model.dart';

class ListingPropertyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingBloc(),
      child: ListingPropertyDetailsPageView(),
    );
  }
}

class ListingPropertyDetailsPageView extends StatefulWidget {
  const ListingPropertyDetailsPageView({super.key});

  @override
  _ListingPropertyDetailsPageViewState createState() =>
      _ListingPropertyDetailsPageViewState();
}

class _ListingPropertyDetailsPageViewState
    extends State<ListingPropertyDetailsPageView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingBloc()..add(FetchListingDetailsEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            'Property Details',
            style: AppTextStyles.appBarTitle,
          ),
          backgroundColor: AppColors.background,
        ),
        body: BlocBuilder<ListingBloc, ListingState>(
          builder: (context, state) {
            if (state is ListingDetailsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListingDetailsLoadedState) {
              final property = state.property;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Carousel
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                      ),
                      items: property.imageUrls.map((url) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(url,
                              fit: BoxFit.cover, width: double.infinity),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),

                    // Property Title
                    Text(
                      property.title,
                      style: AppTextStyles.heading,
                    ),
                    SizedBox(height: 8),

                    // Property Description
                    Text(
                      property.desciption,
                      style: AppTextStyles.body,
                    ),
                    SizedBox(height: 16),

                    // Price
                    Text(
                      'Price: ₹${property.price} L',
                      style: AppTextStyles.subHeading,
                    ),
                    SizedBox(height: 16),

                    // Project Details Card
                    _buildProjectDetailsCard(property),
                    SizedBox(height: 16),

                    // Available Amenities with "Show More"
                    _buildAmenitiesSection(property, state.showAllAmenities),
                  ],
                ),
              );
            } else if (state is ListingDetailsErrorState) {
              return Center(child: Text('Failed to load property details'));
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildAmenitiesSection(Property property, bool showAllAmenities) {
    List<Map<String, dynamic>> amenities = [
      {"icon": Icons.videocam, "label": "CCTV"},
      {"icon": Icons.power, "label": "Power Backup"},
      {"icon": Icons.chair, "label": "Furnishing"},
      {"icon": Icons.battery_full, "label": "UPS"},
      {"icon": Icons.ac_unit, "label": "Central AC"},
      {"icon": Icons.air, "label": "Oxygen Duct"},
      {"icon": Icons.wifi, "label": "Internet"},
      {"icon": Icons.compass_calibration, "label": "Vastu"},
      {"icon": Icons.fire_extinguisher, "label": "Fire Safety"},
      {"icon": Icons.sensor_door, "label": "Fire Sensors"},
      {"icon": Icons.security, "label": "Security"},
      {"icon": Icons.water, "label": "Water Storage"},
      {"icon": Icons.electric_bolt, "label": "DG Backup"},
      {"icon": Icons.coffee, "label": "Cafeteria"},
      {"icon": Icons.recent_actors, "label": "Reception"},
      {"icon": Icons.kitchen, "label": "Pantry"},
      {"icon": Icons.verified, "label": "Fire NOC"},
      {"icon": Icons.article, "label": "Occupancy Certificate"},
    ];
    int visibleCount = showAllAmenities ? amenities.length : 9;

    return Card(
      color: AppColors.colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Project Amenities", style: AppTextStyles.subHeading),
            const SizedBox(height: 12),
            Wrap(
              spacing: 20, // Horizontal spacing
              runSpacing: 16, // Vertical spacing
              alignment: WrapAlignment.start,
              children: amenities.take(visibleCount).map((amenity) {
                return SizedBox(
                  width: 80, // Fixed width for uniform alignment
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(amenity["icon"], size: 28), // Increased icon size
                      const SizedBox(height: 4),
                      Text(
                        amenity["label"],
                        textAlign: TextAlign.center,
                        style: AppTextStyles.small,
                        maxLines: 2, // Allow wrapping for long labels
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            if (amenities.length > 9)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context
                        .read<ListingBloc>()
                        .add(ToggleAmenitiesVisibilityEvent());
                  },
                  child: Text(showAllAmenities
                      ? "Show Less"
                      : "+${amenities.length - 9} more"),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectDetailsCard(Property property) {
    return Card(
      color: AppColors.colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text("${property.title} Overview", style: AppTextStyles.heading),
            SizedBox(height: 12),

            // Grid Layout for Project Details
            Wrap(
              spacing: 10, // Horizontal spacing
              runSpacing: 16, // Vertical spacing
              children: [
                _buildProjectDetailItem(
                    Icons.location_city, "Project Area", "1 Acres"),
                _buildProjectDetailItem(
                    Icons.apartment, "Project Size", "12 Buildings"),
                _buildProjectDetailItem(
                    Icons.date_range, "Launch Date", "Dec 2024"),
                _buildProjectDetailItem(
                    Icons.attach_money, "Avg. Price", "₹1500 K/sq.ft"),
                _buildProjectDetailItem(
                    Icons.home, "Configurations", "3, 4 BHK"),
                _buildProjectDetailItem(
                    Icons.calendar_today, "Possession Starts", "2028"),
                _buildProjectDetailItem(
                    Icons.verified, "Rera Id", "P5210005058",
                    isLink: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectDetailItem(IconData icon, String label, String value,
      {bool isLink = false}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade700),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: AppTextStyles.small.copyWith(color: Colors.grey)),
                isLink
                    ? InkWell(
                        onTap: () {},
                        child: Text(
                          value,
                          style: AppTextStyles.subHeading.copyWith(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    : Text(value, style: AppTextStyles.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
