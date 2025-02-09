import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics & Insights', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Analytics & Insights', style: AppTextStyles.heading),
            SizedBox(height: 16),
            // Add analytics and insights widgets here
          ],
        ),
      ),
    );
  }
}
