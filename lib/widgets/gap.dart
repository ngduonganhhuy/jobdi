import 'package:flutter/widgets.dart';

/// {@template gap}
/// Gap widget.
/// {@endtemplate}
class Gap extends StatelessWidget {
  /// {@macro gap}
  const Gap(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
  );
}
