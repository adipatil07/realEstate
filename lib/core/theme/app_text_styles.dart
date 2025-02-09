import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle heading = GoogleFonts.poppins(
    fontSize: 18, // Reduced font size
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle subHeading = GoogleFonts.poppins(
    fontSize: 14, // Reduced font size
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontSize: 12, // Reduced font size
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static TextStyle small = GoogleFonts.poppins(
    fontSize: 11, // Reduced font size
    color: AppColors.textSecondary,
  );

  static TextStyle button = GoogleFonts.poppins(
    fontSize: 14, // Reduced font size
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 10, // Reduced font size
    color: AppColors.textSecondary,
  );

  static TextStyle inputField = GoogleFonts.poppins(
    fontSize: 14, // Reduced font size
    color: AppColors.textPrimary,
  );

  // Additional text styles
  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 16, // Reduced font size
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle error = GoogleFonts.poppins(
    fontSize: 12, // Reduced font size
    color: AppColors.error,
    fontWeight: FontWeight.bold,
  );

  static TextStyle success = GoogleFonts.poppins(
    fontSize: 12, // Reduced font size
    color: AppColors.success,
    fontWeight: FontWeight.bold,
  );

  static TextStyle warning = GoogleFonts.poppins(
    fontSize: 12, // Reduced font size
    color: AppColors.warning,
    fontWeight: FontWeight.bold,
  );

  static TextStyle disabled = GoogleFonts.poppins(
    fontSize: 12, // Reduced font size
    color: AppColors.disabled,
  );
  static TextStyle appBarTitle = GoogleFonts.poppins(
    fontSize: 20, // Reduced font size
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w600,
  );
}
