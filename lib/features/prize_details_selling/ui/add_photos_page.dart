import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/review_selling_property/ui/property_review_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homescout/features/prize_details_selling/bloc/prize_details_bloc.dart';
import 'package:homescout/features/widgets/app_button.dart';

class AddPhotosPage extends StatelessWidget {
  const AddPhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Photos",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PrizeDetailsBloc, PrizeDetailsState>(
              builder: (context, state) {
                List<File> selectedImages = [];
                if (state is PrizeDetailsUpdated) {
                  selectedImages = state.selectedImages;
                }

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showImageSourceDialog(context);
                        },
                        child: DottedBorderContainer(
                          child: selectedImages.isNotEmpty
                              ? const Text(
                                  "Tap to add more photos",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              : const UploadPlaceholder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (selectedImages.isNotEmpty)
                         SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: selectedImages.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: FileImage(selectedImages[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<PrizeDetailsBloc>()
                                            .add(RemoveImageEvent(index));
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        child: const Icon(Icons.close,
                                            size: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take a photo"),
                onTap: () {
                  context
                      .read<PrizeDetailsBloc>()
                      .add(PickImageEvent(ImageSource.camera));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from gallery"),
                onTap: () {
                  context
                      .read<PrizeDetailsBloc>()
                      .add(PickImageEvent(ImageSource.gallery));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class DottedBorderContainer extends StatelessWidget {
  final Widget child;

  const DottedBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border:
            Border.all(color: AppColors.secondary, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Center(child: child),
    );
  }
}

class UploadPlaceholder extends StatelessWidget {
  const UploadPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.cloud_upload_outlined,
            size: 50, color: AppColors.primary),
        const SizedBox(height: 8),
        const Text("Drag and drop here",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        const Text("or", style: TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            _showImageSourceDialog(context);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.secondary,
            backgroundColor: AppColors.primary,
          ),
          child: Text(
            "Browse",
            style: AppTextStyles.button,
          ),
        ),
      ],
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take a photo"),
                onTap: () {
                  context
                      .read<PrizeDetailsBloc>()
                      .add(PickImageEvent(ImageSource.camera));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from gallery"),
                onTap: () {
                  context
                      .read<PrizeDetailsBloc>()
                      .add(PickImageEvent(ImageSource.gallery));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
