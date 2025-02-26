import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';
import 'package:homescout/routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "Sign Up",
                  style: AppTextStyles.heading.copyWith(fontSize: 24),
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
                controller: _nameController,
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
                _buildButton(
                  text: "Verify OTP",
                  onPressed: () {
                    if (_otpController.text.isEmpty ||
                        _otpController.text.length < 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please enter a valid OTP")),
                      );
                      return;
                    }
                    Navigator.pushNamed(context, AppRoutes.passwordSetup);
                  },
                ),
              ] else ...[
                _buildButton(
                  text: "Next",
                  onPressed: () {
                    if (_phoneController.text.length != 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("Enter a valid 10-digit phone number")),
                      );
                      return;
                    }
                    setState(() {
                      _isOtpFieldVisible = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("OTP sent to ${_phoneController.text}")),
                    );
                  },
                ),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: AppTextStyles.body),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Login",
                        style: TextStyle(color: AppColors.accent)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.primary,
        ),
        child: Text(text, style: AppTextStyles.button),
      ),
    );
  }
}
