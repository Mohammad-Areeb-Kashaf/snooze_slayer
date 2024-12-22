import 'package:flutter/material.dart';

class ScaffoldBackground extends StatelessWidget {
  const ScaffoldBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            image: DecorationImage(
              image: AssetImage(Theme.of(context).brightness == Brightness.dark ? 'assets/images/background_dark.png': 'assets/images/background_light.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
