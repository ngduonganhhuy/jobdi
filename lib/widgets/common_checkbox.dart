import 'package:flutter/material.dart' show Icons, InkWell;
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';

class CommonCheckbox extends StatelessWidget {
  const CommonCheckbox({
    required this.onChanged,
    required this.isChecked,
    super.key,
  });
  final ValueChanged<bool> onChanged;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isChecked),
      child: AnimatedContainer(
        margin: const EdgeInsets.all(2),
        duration: const Duration(milliseconds: 200),
        width: 24.r,
        height: 24.r,
        decoration: BoxDecoration(
          color: isChecked ? appScheme.blue500 : appScheme.gray100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                size: 16,
                color: appScheme.white,
              )
            : null,
      ),
    );
  }
}
