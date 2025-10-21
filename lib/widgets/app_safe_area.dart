import 'package:flutter/cupertino.dart';
import 'package:jobdi/core/themes/app_colors.dart';

class AppSafeArea extends StatelessWidget {
  const AppSafeArea({
    required this.child,
    super.key,
    this.color,
    this.top,
    this.bottom,
  });
  final Color? color;
  final bool? top;
  final bool? bottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? appScheme.primaryColor,
      ),
      child: SafeArea(
        top: top ?? false,
        bottom: bottom ?? false,
        child: child,
      ),
    );
  }
}
