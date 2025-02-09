import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/core/utils/constants.dart';
import 'package:homescout/features/property_details/ui/property_details_page.dart';
import 'package:homescout/features/sell/bloc/selling_page_bloc.dart';
import 'package:homescout/features/widgets/app_button.dart';

class SellingPage extends StatelessWidget {
  const SellingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SellingPageBloc(),
      child: SellingPageView(),
    );
  }
}

class SellingPageView extends StatelessWidget {
  const SellingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Text(
            "Sell Property",
            style: AppTextStyles.appBarTitle,
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Property Type",
                      style: AppTextStyles.small.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<SellingPageBloc, SellingPageState>(
                            builder: (context, state) {
                              bool isSelected = state is PropertyTypeSelected &&
                                  state.selectedType == "Residential";
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: isSelected
                                      ? AppColors.primary
                                      : Colors.white,
                                  foregroundColor: isSelected
                                      ? Colors.white
                                      : AppColors.primary,
                                ),
                                onPressed: () {
                                  context
                                      .read<SellingPageBloc>()
                                      .add(SelectPropertyType("Residential"));
                                },
                                child: Text("Residential"),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BlocBuilder<SellingPageBloc, SellingPageState>(
                            builder: (context, state) {
                              bool isSelected = state is PropertyTypeSelected &&
                                  state.selectedType == "Commercial";
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: isSelected
                                      ? AppColors.primary
                                      : Colors.white,
                                  foregroundColor: isSelected
                                      ? Colors.white
                                      : AppColors.primary,
                                ),
                                onPressed: () {
                                  context
                                      .read<SellingPageBloc>()
                                      .add(SelectPropertyType("Commercial"));
                                },
                                child: Text("Commercial"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // 🔹 Show Commercial Subtypes when "Commercial" is selected
                    BlocBuilder<SellingPageBloc, SellingPageState>(
                      builder: (context, state) {
                        if (state is PropertyTypeSelected &&
                            state.selectedType == "Commercial") {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Commercial Property Type",
                                style:
                                    AppTextStyles.small.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: commercialSubTypes.map((subType) {
                                    bool isSelected =
                                        state.selectedCommercialSubType ==
                                            subType;
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          backgroundColor: isSelected
                                              ? AppColors.primary
                                              : Colors.white,
                                          foregroundColor: isSelected
                                              ? Colors.white
                                              : AppColors.primary,
                                        ),
                                        onPressed: () {
                                          context.read<SellingPageBloc>().add(
                                              SelectCommercialSubType(subType));
                                        },
                                        child: Text(subType),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    BlocBuilder<SellingPageBloc, SellingPageState>(
                      builder: (context, state) {
                        if (state is PropertyTypeSelected &&
                            state.selectedType == "Residential") {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Resedential Property Type",
                                style:
                                    AppTextStyles.small.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: residentialSubTypes.map((subType) {
                                    bool isSelected =
                                        state.selectedResedentialSubType ==
                                            subType;
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          backgroundColor: isSelected
                                              ? AppColors.primary
                                              : Colors.white,
                                          foregroundColor: isSelected
                                              ? Colors.white
                                              : AppColors.primary,
                                        ),
                                        onPressed: () {
                                          context.read<SellingPageBloc>().add(
                                              SelectResedentialSubType(
                                                  subType));
                                        },
                                        child: Text(subType),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(
                        height:
                            80), // 🔹 Extra space so button doesn't overlap with content
                  ],
                ),
              ),
            ),
            AppButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PropertyDetailsPage(),
                  ),
                );
              },
              child: Text(
                "Next, add address & price",
                style: AppTextStyles.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
