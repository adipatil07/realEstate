import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';
import 'package:homescout/routes.dart';

class PasswordSetupPage extends StatelessWidget {
  const PasswordSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    "Set Password",
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Enter your password",
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: "Confirm your password",
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.postsignup,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      "Set Password",
                      style: AppTextStyles.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
