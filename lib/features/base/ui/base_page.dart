import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/features/base/bloc/base_bloc.dart';
import 'package:homescout/features/enquiry/ui/enquiry_page.dart';
import 'package:homescout/features/home/ui/home_page.dart';
import 'package:homescout/features/listing/ui/lisiting_page.dart';
import 'package:homescout/features/sell/ui/selling_page.dart';
import 'package:homescout/features/widgets/custom_bottom_bar.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseBloc(),
      child: Scaffold(
        extendBody: false,
        body: BlocBuilder<BaseBloc, BaseState>(
          builder: (context, state) {
            return _getScreen(state.index);
          },
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return EnquiryPage();
      case 2:
        return const SellingPage();
      case 3:
        return ListingPage();
      default:
        return const HomePage();
    }
  }
}
