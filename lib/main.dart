import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homescout/features/auth/ui/login_page.dart';
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
    return MaterialApp(
      title: 'Real Estate App',
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
