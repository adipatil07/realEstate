import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/enquiry/domain/data/enquiry_model.dart';

class EnquiryDetailPage extends StatelessWidget {
  final Enquiry enquiry;

  EnquiryDetailPage({required this.enquiry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enquiry Details', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(enquiry.title, style: AppTextStyles.heading),
            SizedBox(height: 8),
            Text(enquiry.description, style: AppTextStyles.body),
            SizedBox(height: 16),
            Text('Status: ${enquiry.status}', style: AppTextStyles.subtitle),
            SizedBox(height: 8),
            Text('Date: ${enquiry.timestamp}', style: AppTextStyles.small),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement follow-up functionality
              },
              child: Text('Follow Up', style: AppTextStyles.button),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement chat functionality
              },
              child: Text('Chat with Agent', style: AppTextStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
