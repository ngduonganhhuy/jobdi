import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show RSizedBox;

/// {@template gap}
/// Gap widget.
/// {@endtemplate}
class Gap extends StatelessWidget {
  /// {@macro gap}
  const Gap(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) => RSizedBox(
    width: size,
    height: size,
  );
}
