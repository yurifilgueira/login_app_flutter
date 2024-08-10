import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginTextField(labelText: "Email"),
              const SizedBox(height: 30),
              const LoginTextField(labelText: "Password", obscureText: true),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text("Login successful.",
                              style: getTextStyle(
                                  Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  20)),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withAlpha(200),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer)),
                      child: Text(
                        "LogIn",
                        style: getTextStyle(
                            Theme.of(context).colorScheme.primaryContainer, 20),
                      )),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text("Registered successfully.",
                              style: getTextStyle(
                                  Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  20)),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withAlpha(200),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer)),
                      child: Text(
                        "Register",
                        style: getTextStyle(
                            Theme.of(context).colorScheme.primaryContainer, 18),
                      )),
                ],
              ),
            ],
          ),
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

class LoginTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  const LoginTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  LoginTextFieldState createState() => LoginTextFieldState();
}

class LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    final labelText = widget.labelText;
    final obscureText = widget.obscureText;

    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          focusColor: Theme.of(context).colorScheme.onPrimaryContainer,
          fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
          labelText: labelText,
          labelStyle: GoogleFonts.bebasNeue(
              textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 20)),
        ),
        style: GoogleFonts.bebasNeue(
            textStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 20)),
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Login",
        style: getTextStyle(Theme.of(context).colorScheme.onSurface, 100));
  }
}

TextStyle getTextStyle(Color color, double fontSize) {
  return GoogleFonts.bebasNeue(
      textStyle: TextStyle(color: color, fontSize: fontSize));
}
