import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/listing/domain/listing_property_model.dart';

class PropertyCard extends StatefulWidget {
  final Property property;

  const PropertyCard({super.key, required this.property});

  @override
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image Carousel
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  items: widget.property.imageUrls.map((url) {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        url,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),

                // Dots Indicator
                Positioned(
                  bottom: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.property.imageUrls.length,
                      (index) => Container(
                        width: _currentIndex == index ? 8 : 6,
                        height: _currentIndex == index ? 8 : 6,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? AppColors.primary
                              : Colors.white54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text Content with Padding
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("₹${widget.property.price} L",
                        style: AppTextStyles.heading),
                    Row(
                      children: [
                        Icon(Icons.done_rounded, color: AppColors.success),
                        Text("Active", style: AppTextStyles.success),
                      ],
                    ),
                  ],
                ),
                Text(
                  "Status: ${widget.property.status}",
                  style: AppTextStyles.body,
                ),
                Text(
                  "Size: ${widget.property.sizes} sq.ft",
                  style: AppTextStyles.body,
                ),
                Text(
                  "Location: ${widget.property.locality}",
                  style: AppTextStyles.success,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
