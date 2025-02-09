import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';

class AgentProfilePage extends StatelessWidget {
  final String name;
  final double rating;
  final String contactInfo;

  AgentProfilePage({
    required this.name,
    required this.rating,
    required this.contactInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agent Profile', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppTextStyles.heading),
            SizedBox(height: 8),
            Text('Rating: $rating', style: AppTextStyles.body),
            SizedBox(height: 16),
            Text('Contact Info:', style: AppTextStyles.subtitle),
            SizedBox(height: 8),
            Text(contactInfo, style: AppTextStyles.body),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement schedule call functionality
              },
              child: Text('Schedule Call', style: AppTextStyles.button),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement schedule visit functionality
              },
              child: Text('Schedule Visit', style: AppTextStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
