import 'package:flutter/material.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';

class MediumText extends StatelessWidget {
  const MediumText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: appFont.useFont(
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}

class RegularText extends StatelessWidget {
  const RegularText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: appFont.useFont(
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}

class SemiBoldText extends StatelessWidget {
  const SemiBoldText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.lineheight,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? lineheight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: appFont.useFont(
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: fontSize,
        lineHeight: lineheight,
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  const BoldText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: appFont.useFont(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
