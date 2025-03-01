import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/core/utils/constants.dart';
import 'package:homescout/features/bloc/property_submission_bloc.dart';
import 'package:homescout/features/prize_details_selling/ui/add_photos_page.dart';
import 'package:homescout/features/widgets/app_button.dart';

class AddAmenitiesPage extends StatelessWidget {
  const AddAmenitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Amenities",
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Make Your Property Stand Out with These Amenities",
                style: AppTextStyles.subtitle,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  BlocBuilder<PropertySubmissionBloc, PropertySubmissionState>(
                builder: (context, state) {
                  List<String> selectedAmenities = [];
                  if (state is PropertyDataUpdated) {
                    selectedAmenities = state.property.amenities;
                  }

                  return GridView.builder(
                    itemCount: amenities.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      String amenityLabel = amenities[index]["label"] as String;
                      bool isSelected =
                          selectedAmenities.contains(amenityLabel);

                      return AmenitiesCard(
                        icon: amenities[index]["icon"] as IconData,
                        label: amenityLabel,
                        isSelected: isSelected,
                        onSelect: () {
                          List<String> updatedAmenities =
                              List.from(selectedAmenities);
                          if (isSelected) {
                            updatedAmenities.remove(amenityLabel);
                          } else {
                            updatedAmenities.add(amenityLabel);
                          }
                          context.read<PropertySubmissionBloc>().add(
                                UpdatePropertyData(amenities: updatedAmenities),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: screenWidth * 0.9, // Responsive width
              child: AppButton(
                child: Text(
                  "Continue",
                  style: AppTextStyles.button,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPhotosPage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AmenitiesCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onSelect;

  const AmenitiesCard({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: 2,
          ),
          color: isSelected ? AppColors.primary.withOpacity(0.2) : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 28, color: isSelected ? AppColors.primary : Colors.black),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.primary : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
