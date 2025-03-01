import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/features/auth/ui/login_page.dart';
import 'package:homescout/features/bloc/property_submission_bloc.dart';
import 'package:homescout/features/prize_details_selling/bloc/prize_details_bloc.dart';
import 'package:homescout/features/property_details/bloc/property_details_bloc.dart';
import 'package:homescout/features/sell/bloc/selling_page_bloc.dart';
import 'package:homescout/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PropertySubmissionBloc()),
        BlocProvider(create: (context) => SellingPageBloc()),
        BlocProvider(create: (context) => PrizeDetailsBloc()),
        BlocProvider(create: (context) => PropertyDetailsBloc()),
      ],
      child: MaterialApp(
        title: 'Real Estate App',
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
