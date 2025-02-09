import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';
import 'package:homescout/routes.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.background, // Use background color from AppColors
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          // Allow scrolling in case of keyboard
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "Sign Up",
                  style: AppTextStyles.heading.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  "assets/images/signup5.webp",
                  width: MediaQuery.of(context).size.width *
                      0.8, // Responsive width
                  height: 180, // Adjusted height
                  fit:
                      BoxFit.contain, // Ensures the image doesn't get stretched
                ),
              ),
              const SizedBox(height: 30),
              // Text(
              //   "Name",
              //   style: AppTextStyles.subHeading.copyWith(
              //     fontSize: 16,
              //     fontWeight: FontWeight.normal, // Lighter weight
              //   ),
              // ),
              // const SizedBox(height: 8),
              CustomTextField(
                hintText: "Enter your name",
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 16),
              // Text(
              //   "Phone Number",
              //   style: AppTextStyles.subHeading.copyWith(
              //     fontSize: 16,
              //     fontWeight: FontWeight.normal, // Lighter weight
              //   ),
              // ),
              // const SizedBox(height: 8),
              CustomTextField(
                hintText: "Enter your phone number",
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              // Text(
              //   "Password",
              //   style: AppTextStyles.subHeading.copyWith(
              //     fontSize: 16,
              //     fontWeight: FontWeight.normal, // Lighter weight
              //   ),
              // ),
              // const SizedBox(height: 8),
              CustomTextField(
                hintText: "Enter your password",
                prefixIcon: Icons.lock,
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off),
              ),
              const SizedBox(height: 16),
              // Text(
              //   "Confirm Password",
              //   style: AppTextStyles.subHeading.copyWith(
              //     fontSize: 16,
              //     fontWeight: FontWeight.normal, // Lighter weight
              //   ),
              // ),
              // const SizedBox(height: 8),
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
                    backgroundColor:
                        AppColors.primary, // Use primary color for the button
                  ),
                  child: Text(
                    "Sign Up",
                    style: AppTextStyles.button, // Use button text style
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTextStyles
                        .body, // Use body text style for normal text
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: AppColors.accent), // Use accent color for link
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
