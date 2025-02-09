import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color backgroundColor;
  final Color indicatorBackgroundColor;

  const AppButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.buttonWidth,
    this.buttonHeight,
    this.isLoading = false,
    this.indicatorBackgroundColor = AppColors.colorWhite,
    this.backgroundColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 54),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator.adaptive(
              backgroundColor: indicatorBackgroundColor,
            )
          : child,
    );
  }
}
