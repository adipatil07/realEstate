import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homescout/routes.dart';

class PostSignupPage extends StatelessWidget {
  const PostSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "What would you like to do?",
                style: AppTextStyles.heading.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Icon(
                FontAwesomeIcons.houseUser, // Icon representing a house
                size: 100, // Adjust size as needed
                color: AppColors.primary, // Primary color
              ),
            ),
            const SizedBox(height: 40),
             SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Want to Buy?" action here
                  Navigator.pushNamed(context, AppRoutes.base);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: AppColors.primary, // Primary color
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.shoppingCart, // Icon for buying
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Want to Buy?",
                      style: AppTextStyles.button, // Button text style
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
             SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.selling);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: AppColors.accent, // Accent color
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHandPaper, // Icon for selling
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Want to Sell?",
                      style: AppTextStyles.button, // Button text style
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not sure yet?",
                  style:
                      AppTextStyles.body, // Use body text style for normal text
                ),
                TextButton(
                  onPressed: () {
                    // Handle "Not sure yet?" action
                  },
                  child: Text(
                    "Explore more",
                    style: TextStyle(
                        color: AppColors.accent), // Accent color for link
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
