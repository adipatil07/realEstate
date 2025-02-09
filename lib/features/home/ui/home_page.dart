import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/search/ui/search_page.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CategoryCard({
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(16.0),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: AppColors.primary),
            const SizedBox(height: 10),
            Text(label, style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    "assets/images/dashboard.webp",
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: -25,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomTextField(
                        hintText: "Search for properties",
                        prefixIcon: Icons.search,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50), // Space after the search bar

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                      },
                      child: Text("Get Started With HomeScout",
                          style: AppTextStyles.heading),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Find your dream home with HomeScout",
                      style: AppTextStyles.body,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Popular Categories",
                      style: AppTextStyles.subHeading,
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryCard(
                            icon: Icons.house,
                            label: "Houses",
                            onTap: () {
                              // Navigate to houses category
                            },
                          ),
                          CategoryCard(
                            icon: Icons.apartment,
                            label: "Apartments",
                            onTap: () {
                              // Navigate to apartments category
                            },
                          ),
                          CategoryCard(
                            icon: Icons.villa,
                            label: "Villas",
                            onTap: () {
                              // Navigate to villas category
                            },
                          ),
                          CategoryCard(
                            icon: Icons.house,
                            label: "Farmhouse",
                            onTap: () {
                              // Navigate to villas category
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Explore Neighborhoods",
                      style: AppTextStyles.subHeading,
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildNeighborhoodCard(
                            context,
                            "assets/images/dashboard2.jpg",
                            "Downtown",
                          ),
                          _buildNeighborhoodCard(
                            context,
                            "assets/images/dashboard2.jpg",
                            "Suburbs",
                          ),
                          _buildNeighborhoodCard(
                            context,
                            "assets/images/dashboard2.jpg",
                            "Countryside",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Recently Viewed",
                      style: AppTextStyles.subHeading,
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryCard(
                            icon: Icons.history,
                            label: "Property 1",
                            onTap: () {
                              // Navigate to recently viewed property 1
                            },
                          ),
                          CategoryCard(
                            icon: Icons.history,
                            label: "Property 2",
                            onTap: () {
                              // Navigate to recently viewed property 2
                            },
                          ),
                          CategoryCard(
                            icon: Icons.history,
                            label: "Property 3",
                            onTap: () {
                              // Navigate to recently viewed property 3
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Explore on Map",
                      style: AppTextStyles.subHeading,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "Map Placeholder",
                          style: AppTextStyles.body,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNeighborhoodCard(
      BuildContext context, String imagePath, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imagePath,
              width: 120,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(label, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
