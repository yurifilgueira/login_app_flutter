import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class TitleWidget extends StatelessWidget {

  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: textFont(
            textStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 100)));
  }
}