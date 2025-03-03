import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/review_selling_property/bloc/review_property_bloc.dart';
import 'package:homescout/features/widgets/app_button.dart';

class ReviewPage extends StatefulWidget {
  final String propertyId;
  const ReviewPage({
    super.key,
    required this.propertyId,
  });

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();
    print("🔍 Dispatching LoadReviewProperty for ID: ${widget.propertyId}");

    // ✅ Dispatch event to fetch property from Firestore
    context
        .read<ReviewPropertyBloc>()
        .add(LoadReviewProperty(propertyId: widget.propertyId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewPropertyBloc()
        ..add(LoadReviewProperty(propertyId: widget.propertyId)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Review",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
        ),
        body: BlocBuilder<ReviewPropertyBloc, ReviewPropertyState>(
          builder: (context, state) {
            print("🖥️ [UI] State Received: $state");
            if (state is ReviewPropertyLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReviewPropertyLoaded) {
              print("✅ [UI] Rendering Property: ${state.propertyId}");
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildSuccessMessage(),
                    const SizedBox(height: 16),
                    _buildPropertyDetails(state),
                    const Spacer(),
                    AppButton(
                      child: const Text(
                        "Continue",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            } else if (state is ReviewPropertyError) {
              return Center(
                  child: Text("Error While Loading Property",
                      style: TextStyle(color: Colors.red)));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade300),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "Congratulations! Your listing is under review.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyDetails(ReviewPropertyLoaded state) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: state.imagePath != null
                  ? DecorationImage(
                      image: NetworkImage(
                          state.imagePath! as String), // ✅ Corrected
                      fit: BoxFit.cover,
                    )
                  : null,
              color: Colors.grey.shade200,
            ),
            child: state.imagePath == null
                ? const Icon(Icons.image, size: 40, color: Colors.grey)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("₹ ${state.price}", style: AppTextStyles.heading),
                const SizedBox(
                  height: 4,
                ),
                Text("${state.propertyType} for Rent",
                    style: AppTextStyles.subHeading),
                const SizedBox(
                  height: 4,
                ),
                Text("${state.area}  |  ${state.location}",
                    style: AppTextStyles.small),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const Text("Listing Score: "),
                    Text("${state.listingScore}%"),
                    const Icon(Icons.emoji_emotions, size: 16),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "+ Add Details",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
