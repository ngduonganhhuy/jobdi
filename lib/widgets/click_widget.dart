import 'package:flutter/widgets.dart';

/// {@template click_widget}
/// ClickWidget widget.
/// {@endtemplate}
class ClickWidget extends StatelessWidget {
  /// {@macro click_widget}
  const ClickWidget({
    required this.child,
    this.onTap,
    this.onDoubleTap,
    super.key,
  });
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    onDoubleTap: onDoubleTap,
    child: child,
  );
}
