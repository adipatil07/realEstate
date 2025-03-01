import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/core/utils/constants.dart';
import 'package:homescout/features/bloc/property_submission_bloc.dart';
import 'package:homescout/features/prize_details_selling/ui/prize_details_page.dart';
import 'package:homescout/features/property_details/bloc/property_details_bloc.dart';
import 'package:homescout/features/widgets/app_button.dart';
import 'package:homescout/features/widgets/custom_text_field.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropertyDetailsBloc(),
      child: PropertyDetailsView(),
    );
  }
}

class PropertyDetailsView extends StatefulWidget {
  const PropertyDetailsView({super.key});

  @override
  State<PropertyDetailsView> createState() => _PropertyDetailsViewState();
}

class _PropertyDetailsViewState extends State<PropertyDetailsView> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _builtUpAreaController = TextEditingController();
  final TextEditingController _carpetAreaController = TextEditingController();
  final TextEditingController _totalFloorsController = TextEditingController();
  final TextEditingController _propertyFloorController =
      TextEditingController();
  final TextEditingController _ageOfPropertyController =
      TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    _buildingController.dispose();
    _localityController.dispose();
    _builtUpAreaController.dispose();
    _carpetAreaController.dispose();
    _totalFloorsController.dispose();
    _propertyFloorController.dispose();
    _ageOfPropertyController.dispose();
    super.dispose();
  }

  void _updatePropertyDetails() {
    context.read<PropertySubmissionBloc>().add(
          UpdatePropertyData(
            city: _cityController.text,
            buildingName: _buildingController.text,
            locality: _localityController.text,
            builtUpArea: double.tryParse(_builtUpAreaController.text) ?? 0,
            carpetArea: double.tryParse(_carpetAreaController.text) ?? 0,
            totalFloors: int.tryParse(_totalFloorsController.text) ?? 0,
            propertyFloor: int.tryParse(_propertyFloorController.text) ?? 0,
            ageOfProperty: int.tryParse(_ageOfPropertyController.text),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> pickDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        context
            .read<PropertyDetailsBloc>()
            .add(SelectCompletionDate(pickedDate));

        context.read<PropertySubmissionBloc>().add(
              UpdatePropertyData(completionDate: pickedDate),
            );
      }
    }

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        title: Text("Property Details", style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      // margin: EdgeInsets.symmetric(
                      //     horizontal:
                      //         16), // Add margin to keep space from edges
                      padding: EdgeInsets.all(12), // Inner spacing
                      decoration: BoxDecoration(
                        color: AppColors.background, // Background color
                        borderRadius:
                            BorderRadius.circular(12), // Rounded borders
                        border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1), // Border styling
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            color: AppColors.background,
                            child: Text(
                              "About Property",
                              style: AppTextStyles.small.copyWith(fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            hintText: "City",
                            controller: _cityController,
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            hintText: "Building / Project / Society",
                            controller: _buildingController,
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            hintText: "Locality",
                            controller: _localityController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Possesstion Information",
                              style:
                                  AppTextStyles.small.copyWith(fontSize: 14)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: BlocBuilder<PropertyDetailsBloc,
                                    PropertyDetailsState>(
                                  builder: (context, state) {
                                    bool isSelected = state
                                            is PropertyProfessionInformationSelectedState &&
                                        state.selectedProfessionInformation ==
                                            "Ready to Move";

                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        backgroundColor: isSelected
                                            ? AppColors.primary
                                            : Colors.white,
                                        foregroundColor: isSelected
                                            ? Colors.white
                                            : AppColors.primary,
                                      ),
                                      onPressed: () {
                                        context.read<PropertyDetailsBloc>().add(
                                              SelectPropertyProfessionInformation(
                                                  "Ready to Move"),
                                            );
                                        context
                                            .read<PropertySubmissionBloc>()
                                            .add(
                                              UpdatePropertyData(
                                                  possessionStatus:
                                                      "Ready to Move"),
                                            );
                                      },
                                      child: Text("Ready to Move"),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: BlocBuilder<PropertyDetailsBloc,
                                    PropertyDetailsState>(
                                  builder: (context, state) {
                                    bool isSelected = state
                                            is PropertyProfessionInformationSelectedState &&
                                        state.selectedProfessionInformation ==
                                            "Under Construction";
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        backgroundColor: isSelected
                                            ? AppColors.primary
                                            : Colors.white,
                                        foregroundColor: isSelected
                                            ? Colors.white
                                            : AppColors.primary,
                                      ),
                                      onPressed: () {
                                        context.read<PropertyDetailsBloc>().add(
                                            SelectPropertyProfessionInformation(
                                                "Under Construction"));
                                        context
                                            .read<PropertySubmissionBloc>()
                                            .add(
                                              UpdatePropertyData(
                                                  possessionStatus:
                                                      "Under Construction"),
                                            );
                                      },
                                      child: Text(
                                        "Under Construction",
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          BlocBuilder<PropertyDetailsBloc,
                              PropertyDetailsState>(
                            builder: (context, state) {
                              if (state
                                      is PropertyProfessionInformationSelectedState &&
                                  state.selectedProfessionInformation ==
                                      "Ready to Move") {
                                return CustomTextField(
                                  hintText: "Age in Years",
                                  prefixIcon: Icons.calendar_today,
                                  keyboardType: TextInputType.number,
                                  controller: _ageOfPropertyController,
                                );
                              }

                              if (state
                                      is PropertyProfessionInformationSelectedState &&
                                  state.selectedProfessionInformation ==
                                      "Under Construction") {
                                return GestureDetector(
                                  onTap: () => pickDate(context),
                                  child: AbsorbPointer(
                                    child: TextField(
                                      // controller: ,
                                      decoration: InputDecoration(
                                        hintText: state.completionDate != null
                                            ? "${state.completionDate!.day}-${state.completionDate!.month}-${state.completionDate!.year}"
                                            : "Expected Completion Date",
                                        prefixIcon: Icon(Icons.calendar_today,
                                            size: 20),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Location Hub",
                              style:
                                  AppTextStyles.small.copyWith(fontSize: 14)),
                          const SizedBox(height: 8),
                          BlocBuilder<PropertyDetailsBloc,
                              PropertyDetailsState>(
                            builder: (context, state) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: locationHubTypes.map((subType) {
                                    bool isSelected = (state
                                            is PropertyProfessionInformationSelectedState) &&
                                        state.selectedLocationHubType ==
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
                                          context
                                              .read<PropertyDetailsBloc>()
                                              .add(SelectLocationHubType(
                                                  subType));
                                          context
                                              .read<PropertySubmissionBloc>()
                                              .add(UpdatePropertyData(
                                                  locationHubType: subType));
                                        },
                                        child: Text(subType),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Area",
                            style: AppTextStyles.small.copyWith(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            hintText: "Built Up Area",
                            controller: _builtUpAreaController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            hintText: "Carpet Area",
                            controller: _carpetAreaController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Ownership",
                              style:
                                  AppTextStyles.small.copyWith(fontSize: 14)),
                          const SizedBox(
                            height: 8,
                          ),
                          BlocBuilder<PropertyDetailsBloc,
                              PropertyDetailsState>(
                            builder: (context, state) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: ownershipTypes.map((subType) {
                                    bool isSelected = (state
                                            is PropertyProfessionInformationSelectedState) &&
                                        state.selectedOwnershipType == subType;

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
                                          context
                                              .read<PropertyDetailsBloc>()
                                              .add(
                                                  SelectOwnershipType(subType));
                                          context
                                              .read<PropertySubmissionBloc>()
                                              .add(UpdatePropertyData(
                                                  ownershipType: subType));
                                        },
                                        child: Text(subType),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Room Type",
                              style:
                                  AppTextStyles.small.copyWith(fontSize: 14)),
                          const SizedBox(
                            height: 8,
                          ),
                          BlocBuilder<PropertyDetailsBloc,
                              PropertyDetailsState>(
                            builder: (context, state) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: roomType.map((subType) {
                                    bool isSelected = (state
                                            is PropertyProfessionInformationSelectedState) &&
                                        state.selectedRoomType == subType;

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
                                          context
                                              .read<PropertyDetailsBloc>()
                                              .add(SelectRoomType(subType));
                                          context
                                              .read<PropertySubmissionBloc>()
                                              .add(UpdatePropertyData(
                                                  roomType: subType));
                                        },
                                        child: Text(subType),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Furnished Condition",
                              style:
                                  AppTextStyles.small.copyWith(fontSize: 14)),
                          const SizedBox(
                            height: 8,
                          ),
                          BlocBuilder<PropertyDetailsBloc,
                              PropertyDetailsState>(
                            builder: (context, state) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: furnishedType.map((subType) {
                                    bool isSelected = (state
                                            is PropertyProfessionInformationSelectedState) &&
                                        state.selectedFurnishedType == subType;

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
                                          context
                                              .read<PropertyDetailsBloc>()
                                              .add(
                                                  SelectFurnishedType(subType));
                                          context
                                              .read<PropertySubmissionBloc>()
                                              .add(UpdatePropertyData(
                                                  furnishedCondition: subType));
                                        },
                                        child: Text(subType),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Floors Available",
                              style:
                                  AppTextStyles.small.copyWith(fontSize: 14)),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            hintText: "Total Floors",
                            controller: _totalFloorsController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            hintText: "Your Floor",
                            controller: _propertyFloorController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              child: Text(
                "Next",
                style: AppTextStyles.button,
              ),
              onPressed: () {
                _updatePropertyDetails();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrizeDetailsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
