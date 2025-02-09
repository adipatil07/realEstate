import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:homescout/features/listing/bloc/listing_bloc.dart';

import '../domain/listing_property_model.dart';

class ListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingBloc()..add(FetchListings()),
      child: Scaffold(
        appBar: AppBar(title: Text('Property Listings')),
        body: BlocBuilder<ListingBloc, ListingState>(
          builder: (context, state) {
            if (state is ListingLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListingLoaded) {
              return ListView.builder(
                itemCount: state.properties.length,
                itemBuilder: (context, index) {
                  return PropertyCard(property: state.properties[index]);
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

class PropertyCard extends StatelessWidget {
  final Property property;

  PropertyCard({required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CarouselSlider(
                items: property.imageUrls.map((url) {
                  return Image.network(url,
                      fit: BoxFit.cover, width: double.infinity);
                }).toList(),
                options: CarouselOptions(
                    height: 200, autoPlay: true, enlargeCenterPage: true),
              ),
            ),
            SizedBox(height: 10),

            // Price and EMI
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("₹${property.price} L",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("EMI starts at ₹${property.emi}K",
                    style: TextStyle(color: Colors.purple)),
              ],
            ),
            SizedBox(height: 5),

            // Property Title & Developer
            Text(property.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("By ${property.developer}",
                style: TextStyle(color: Colors.grey)),

            Divider(),

            // Property Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetail("Possession Date", property.possessionDate),
                _buildDetail("Avg Price", property.averagePrice),
                _buildDetail("Status", property.status),
              ],
            ),
            SizedBox(height: 8),

            // Nearby Places
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey, size: 16),
                Expanded(
                  // Prevents overflow
                  child: Text(
                    property.nearbyPlaces
                        .join(", "), // Convert List<String> to String
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Action Buttons
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     OutlinedButton.icon(
            //       icon: Icon(Icons.phone, color: Colors.green),
            //       label: Text("View Phone"),
            //       onPressed: () {},
            //     ),
            //     ElevatedButton.icon(
            //       icon: Icon(Icons.message),
            //       label: Text("Contact Developer"),
            //       style:
            //           ElevatedButton.styleFrom(backgroundColor: Colors.green),
            //       onPressed: () {},
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
        SizedBox(height: 2),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
