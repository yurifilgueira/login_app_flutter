import 'package:flutter/material.dart';
import 'package:login_app/app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: _getColorScheme(),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }

  _getColorScheme() {
    const primary = Color.fromRGBO(116, 114, 116, 1);
    const onPrimary = Color.fromRGBO(253, 236, 239, 1);
    const primaryContainer = Color.fromRGBO(240, 247, 238, 1);
    const onPrimaryContainer = Color.fromRGBO(93, 115, 126, 1);
    const secondary = Color.fromRGBO(220, 168, 182, 1);
    const errorColor = Colors.red;
    const onErrorColor = Colors.white;

    return const ColorScheme(
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onPrimary,
      brightness: Brightness.dark,
      error: errorColor,
      onError: onErrorColor,
      surface: Colors.black,
      onSurface: onPrimary,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                child: const Align(
                  alignment: Alignment.center,
                  child: LoginText(),
                )),
            const LoginCard(),
          ],
        ),
      ),
    );
  }
}
