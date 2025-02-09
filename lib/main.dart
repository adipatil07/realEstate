import 'package:flutter/material.dart';
import 'package:homescout/features/auth/ui/login_page.dart';
import 'package:homescout/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      initialRoute: AppRoutes.login, // Default screen
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
