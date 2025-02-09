import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/prize_details_selling/ui/add_amenities_page.dart';
import 'package:homescout/features/widgets/app_button.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';

class PrizeDetailsPage extends StatelessWidget {
  const PrizeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prize Details",
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Financials",
                      style: AppTextStyles.subHeading,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(hintText: "Expected Rent"),
                  ],
                ),
              ),
            ),
            AppButton(
              child: Text(
                "Post Property",
                style: AppTextStyles.button,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAmenitiesPage(),
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
