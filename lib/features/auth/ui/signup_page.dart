import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/auth/bloc/auth_bloc.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';
import 'package:homescout/routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _isOtpFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                hintText: "Enter your name",
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                hintText: "Enter your phone number",
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              if (_isOtpFieldVisible) ...[
                CustomTextField(
                  controller: _otpController,
                  hintText: "Enter OTP",
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Simulate OTP verification

                      Navigator.pushNamed(context, AppRoutes.passwordSetup);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      "Verify OTP",
                      style: AppTextStyles.button,
                    ),
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isOtpFieldVisible = true;
                      });
                      // Simulate sending OTP
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("OTP sent to ${_phoneController.text}")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      "Next",
                      style: AppTextStyles.button,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTextStyles.body,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: AppColors.accent),
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
