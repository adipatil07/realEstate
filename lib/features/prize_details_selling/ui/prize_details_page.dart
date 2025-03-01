import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/prize_details_selling/ui/add_amenities_page.dart';
import 'package:homescout/features/widgets/app_button.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';

import '../../bloc/property_submission_bloc.dart';

class PrizeDetailsPage extends StatefulWidget {
  const PrizeDetailsPage({super.key});

  @override
  _PrizeDetailsPageState createState() => _PrizeDetailsPageState();
}

class _PrizeDetailsPageState extends State<PrizeDetailsPage> {
  final TextEditingController _expectedRentController = TextEditingController();

  @override
  void dispose() {
    _expectedRentController.dispose();
    super.dispose();
  }

  void _updateFinancialDetails() {
    double? expectedRent = double.tryParse(_expectedRentController.text);
    context.read<PropertySubmissionBloc>().add(
          UpdatePropertyData(expectedRent: expectedRent),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prize Details", style: AppTextStyles.appBarTitle),
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
                      Text("Financials", style: AppTextStyles.subHeading),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _expectedRentController,
                        hintText: "Expected Rent",
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              AppButton(
                onPressed: () {
                  _updateFinancialDetails();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAmenitiesPage(),
                    ),
                  );
                },
                child: Text("Post Property", style: AppTextStyles.button),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
