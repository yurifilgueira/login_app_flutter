import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: const LoginPage(title: 'Flutter Demo Home Page'),
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
  const LoginPage({super.key, required this.title});
  
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            child: const Align(
              alignment: Alignment.center,
              child: LoginText(),
          )),
          const Expanded(
            child: LoginCard(),
          ),
        ],
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
        width: double.infinity,
        child: Container(
          decoration: _getDecorationLoginContainer(context),
          child: const Placeholder(),
        ),
      ),
    );
  }

  BoxDecoration _getDecorationLoginContainer(BuildContext context) {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      color: Color.fromRGBO(240, 247, 238, 1),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return  Text(
      "Login",
      style: GoogleFonts.bebasNeue(textStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 100)),
    );
  }
}