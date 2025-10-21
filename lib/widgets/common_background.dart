import 'package:flutter/material.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;

class CommonBackground extends StatelessWidget {
  const CommonBackground({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                appScheme.primaryColor,
                appScheme.primaryColor600,
              ],
              stops: const [0.0, 0.25],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
