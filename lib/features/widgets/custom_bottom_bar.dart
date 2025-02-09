import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/base/bloc/base_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(context, Icons.home, "Home", 0, state.index),
                  _buildNavItem(context, Icons.add_chart_sharp, "Enquiry", 1,
                      state.index),
                  _buildNavItem(context, Icons.add, "Add", 2, state.index),
                  _buildNavItem(context, Icons.list, "Listing", 3, state.index),
                  _buildNavItem(
                      context, Icons.person, "Profile", 4, state.index),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label,
      int index, int selectedIndex) {
    return GestureDetector(
      onTap: () {
        context.read<BaseBloc>().add(UpdateBottomNavEvent(index: index));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedIndex == index ? AppColors.primary : Colors.grey,
          ),
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              color: selectedIndex == index ? AppColors.primary : Colors.grey,
              fontWeight:
                  selectedIndex == index ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
