import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/extensions/widget_extension.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;
import 'package:jobdi/widgets/three_bounce_loading.dart' show ThreeRotatingDots;

enum GradientOrientation {
  vertical,
  horizontal,
}

class PrimaryButton extends StatefulWidget {
  PrimaryButton({
    this.onTap,
    this.child,
    super.key,
    this.borderColor,
    this.progressColor = Colors.white,
    this.progressSize = 20,
    this.borderRadius = 12,
    this.borderThickness = 5,
    this.height = 42,
    this.width = 200,
    this.stretch = true,
    this.progress = false,
    this.disabled = false,
    this.startColor,
    this.endColor,
    this.processing = false,
    this.label,
    this.textColor,
  }) : br = BorderRadius.all(Radius.circular(borderRadius)),
       calculatedWidth = stretch ? double.infinity : width;

  final Color? startColor;
  final Color? endColor;
  final Color? borderColor;
  final Color? textColor;
  final Color progressColor;
  final double progressSize;
  final double borderThickness;
  final double height;
  final double borderRadius;
  final bool stretch;
  final double width;
  final bool progress;
  final bool disabled;
  final VoidCallback? onTap;
  final Widget? child;
  final BorderRadius br;
  final double calculatedWidth;
  final bool processing;
  final String? label;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with TickerProviderStateMixin {
  late double _borderThickness = 5;
  late double _moveMargin = 0;
  late double _progressWidth = 0;
  late bool _showProgress = false;
  late bool _tapped = false;
  late int _progressBarMillis = 2500;
  @override
  void initState() {
    _borderThickness = widget.borderThickness;
    super.initState();
  }

  Widget _buildBackLayout() {
    return Container(
      padding: EdgeInsets.only(top: _borderThickness.r),
      width: double.infinity,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: widget.br,
          color: widget.disabled
              ? appScheme.gray200
              : (widget.borderColor ?? widget.endColor),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget _buildFrontLayout() {
    return AnimatedContainer(
      onEnd: () {
        setState(() {
          _moveMargin = 0;
          if (widget.progress && !_showProgress && _tapped) {
            _showProgress = true;
            _progressWidth = double.infinity;
            _progressBarMillis = 2500;
          }
          _tapped = false;
        });
      },
      margin: EdgeInsets.only(top: _moveMargin),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: widget.br,
        gradient: LinearGradient(
          colors: [
            if (widget.disabled)
              appScheme.gray200
            else
              widget.startColor ?? appScheme.primaryColor,
            if (widget.disabled)
              appScheme.gray200
            else
              widget.endColor ?? appScheme.primaryColor,
          ],
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
          width: double.infinity,
          height: widget.height - _borderThickness.r,
        ),
        child: ClipRRect(
          borderRadius: widget.br,
          child: Stack(
            children: <Widget>[
              _buildProgressBar(),
              if (widget.processing) _buildProgressCircle(),
              if (!widget.processing) _buildUserChild(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return AnimatedSize(
      duration: Duration(milliseconds: _progressBarMillis),
      curve: Curves.fastOutSlowIn,
      child: Container(
        width: _progressWidth,
        height: double.infinity,
        color: const Color.fromARGB(60, 255, 255, 255),
      ),
    );
  }

  Widget _buildProgressCircle() {
    return ThreeRotatingDots(color: Colors.white, size: 20.r);
  }

  Widget _buildUserChild() {
    return Align(
      child:
          widget.child ??
          SemiBoldText(
            widget.label ?? '',
            color: widget.disabled
                ? appScheme.gray300
                : (widget.textColor ?? appScheme.white),
          ),
    ).paddingOnly(top: widget.borderThickness);
  }

  void _onTap() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _moveMargin = _borderThickness.r;
      _tapped = true;
    });
    widget.onTap?.call();
    _finish();
  }

  void _finish() {
    setState(() {
      _showProgress = false;
      _progressWidth = 0;
      _progressBarMillis = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled || widget.processing ? null : _onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
          width: widget.calculatedWidth,
          height: widget.height,
        ),
        child: Stack(
          children: <Widget>[
            _buildBackLayout(),
            _buildFrontLayout(),
          ],
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    this.bgColor,
    this.onTap,
    this.child,
    this.label,
  }) : assert(
         child != null || label != null,
         'Either child or label must be provided',
       );
  final Color? bgColor;
  final VoidCallback? onTap;
  final Widget? child;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return ClickWidget(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: bgColor ?? appScheme.primaryColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child:
            child ??
            SemiBoldText(
              label!,
              fontSize: 16,
              color: appScheme.white,
            ),
      ),
    );
  }
}
