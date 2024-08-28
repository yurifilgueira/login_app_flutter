import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/pages/login_page.dart';
import 'package:login_app/app/pages/profile_page.dart';
import 'package:login_app/app/pages/register_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
      },
      theme: ThemeData(
        colorScheme: getColorScheme(),
        useMaterial3: true,
      ),
      initialRoute: '/login',
    );
  }
}
