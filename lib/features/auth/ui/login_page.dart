import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';
import 'package:homescout/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.background, // Use background color from AppColors
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Welcome back!",
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/login1.webp",
                    width: 500,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Text(
                //   "Phone number",
                //   style: AppTextStyles.subHeading.copyWith(
                //     fontSize: 16,
                //     fontWeight: FontWeight.normal,
                //   ), // Use heading style
                // ),
                // const SizedBox(height: 8),
                CustomTextField(
                  hintText: "Enter your phone number",
                  prefixIcon: FontAwesomeIcons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                // Text(
                //   "Password",
                //   style: AppTextStyles.subHeading.copyWith(
                //     fontSize: 16,
                //     fontWeight: FontWeight.normal,
                //   ), // Use heading style
                // ),
                // const SizedBox(height: 8),
                CustomTextField(
                  hintText: "Enter your password",
                  prefixIcon: FontAwesomeIcons.lock,
                  obscureText: true,
                  suffixIcon: Icon(FontAwesomeIcons.eyeSlash),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: AppColors.accent), // Use accent color
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.primary, // Use primary color
                    ),
                    child: Text(
                      "Log in",
                      style: AppTextStyles.button, // Use button text style
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppTextStyles.body, // Use body text style
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.signup,
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: AppColors.accent), // Use accent color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
