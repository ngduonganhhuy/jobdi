import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/gap.dart' show Gap;
import 'package:jobdi/widgets/primary_button.dart' show PrimaryButton;

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({
    super.key,
    this.title = '',
    this.message = '',
    this.onConfirm,
    this.onBack,
    this.useLoading = false,
    this.showClose = true,
    this.padding,
    this.content,
    this.confirmText,
    this.cancelText,
    this.constraint,
    this.alignment = Alignment.bottomCenter,
    this.margin,
  });
  final String title;
  final String message;
  final Future<void> Function(BuildContext)? onConfirm;
  final Future<void> Function(BuildContext)? onBack;
  final bool useLoading;
  final bool showClose;
  final Widget? content;
  final String? confirmText;
  final String? cancelText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraint;
  final Alignment alignment;

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final alignment = widget.alignment;
    return SafeArea(
      child: Align(
        alignment: alignment,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: widget.constraint,
              padding: widget.padding ?? const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: appScheme.white,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: widget.margin ?? const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.content ??
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SemiBoldText(
                            widget.title,
                            color: appScheme.gray900,
                          ),
                          const Gap(14),
                          MediumText(
                            widget.message,
                            color: appScheme.gray500,
                          ),
                        ],
                      ),
                  const Gap(16),
                  buildAgreeBtn(context),
                  if (widget.showClose) buildDisagreeBtn(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildDisagreeBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      child: PrimaryButton(
        startColor: appScheme.gray50,
        endColor: appScheme.gray50,
        textColor: appScheme.gray900,
        onTap: () {
          widget.onBack?.call(context);
          try {
            NavigatorService.goBack<void>(context);
          } on Exception catch (_) {
            SmartDialog.dismiss<void>();
          }
        },
        label: widget.cancelText ?? 'Trở lại',
      ),
    );
  }

  PrimaryButton buildAgreeBtn(BuildContext context) {
    return PrimaryButton(
      onTap: loading
          ? null
          : () async {
              if (widget.useLoading && mounted) setState(() => loading = true);
              await widget.onConfirm?.call(context);
              if (widget.useLoading && mounted) setState(() => loading = false);
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading)
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: appScheme.white,
                strokeWidth: 2,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MediumText(
              widget.confirmText ?? 'Xác nhận',
              color: appScheme.white,
            ),
          ),
          if (loading) const SizedBox(height: 20, width: 20),
        ],
      ),
    );
  }
}
