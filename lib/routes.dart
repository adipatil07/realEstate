import 'package:flutter/material.dart';
import 'package:homescout/features/auth/ui/otp_verification_page.dart';
import 'package:homescout/features/auth/ui/password_setup_page.dart';
import 'package:homescout/features/base/ui/base_page.dart';
import 'package:homescout/features/enquiry/ui/enquiry_page.dart';
import 'package:homescout/features/home/ui/home_page.dart';
import 'package:homescout/features/auth/ui/login_page.dart';
import 'package:homescout/features/auth/ui/post_signup_page.dart';
import 'package:homescout/features/auth/ui/signup_page.dart';
import 'package:homescout/features/prize_details_selling/ui/add_amenities_page.dart';
import 'package:homescout/features/prize_details_selling/ui/prize_details_page.dart';
import 'package:homescout/features/property_details/ui/property_details_page.dart';
import 'package:homescout/features/sell/ui/selling_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String postsignup = '/postsignup';
  static const String home = '/home';
  static const String selling = '/selling_page';
  static const String propertyDetails = '/property_details';
  static const String prizeDetails = '/prize_details';
  static const String addAmenities = '/add_amenities';
  static const String base = '/base';
  static const String enquiry = '/enquiry';
  static const String otpVerification = '/otpVerification';
  static const String passwordSetup = '/passwordSetup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case postsignup:
        return MaterialPageRoute(builder: (_) => PostSignupPage());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case selling:
        return MaterialPageRoute(builder: (_) => SellingPage());
      case propertyDetails:
        return MaterialPageRoute(builder: (_) => PropertyDetailsPage());
      case prizeDetails:
        return MaterialPageRoute(builder: (_) => PrizeDetailsPage());
      case addAmenities:
        return MaterialPageRoute(builder: (_) => AddAmenitiesPage());
      case base:
        return MaterialPageRoute(builder: (_) => BasePage());
      case enquiry:
        return MaterialPageRoute(builder: (_) => EnquiryPage());
      case otpVerification:
        return MaterialPageRoute(builder: (_) => OtpVerificationPage());
      case passwordSetup:
        return MaterialPageRoute(builder: (_) => PasswordSetupPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
