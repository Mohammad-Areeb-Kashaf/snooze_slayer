import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class ScaffoldBackground extends StatelessWidget {
  const ScaffoldBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Stack(
      children: [
        ValueListenableBuilder(
            valueListenable: themeController.notifier,
            builder: (_, mode, __) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  image: DecorationImage(
                    image: AssetImage(mode == ThemeMode.dark
                        ? 'assets/images/background_dark.png'
                        : 'assets/images/background_light.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
        ),
        child,
      ],
    );
  }
}
