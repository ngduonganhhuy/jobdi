import 'package:flutter/material.dart';
import 'package:jobdi/widgets/shimmer_widget.dart' show ShimmerWidget;

class ListViewWithNoData extends ListView {
  ListViewWithNoData({
    required this.separatorBuilder,
    required this.itemBuilder,
    super.key,
    super.padding,
    super.shrinkWrap,
    super.physics,
    this.itemCount = 0,
    this.noDataWidget,
    this.hasMoreWidget,
    this.isLoading = false,
    this.heightLoading = 200,
  });
  final int itemCount;
  final Widget? noDataWidget;
  final Widget? hasMoreWidget;
  final Widget Function(BuildContext, int) separatorBuilder;
  final Widget? Function(BuildContext, int) itemBuilder;
  final bool isLoading;
  final double? heightLoading;

  @override
  Widget build(BuildContext context) {
    final finalItemCount = itemCount + (hasMoreWidget != null ? 1 : 0);
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding ?? EdgeInsets.zero,
      itemCount: isLoading ? 10 : finalItemCount,
      separatorBuilder: separatorBuilder,
      itemBuilder: (c, i) => buildItemBuilder(c, i, finalItemCount),
    );
  }

  Widget? buildItemBuilder(BuildContext c, int i, int finalItemCount) {
    if (isLoading) {
      return ShimmerWidget(
        height: heightLoading,
        radius: 10,
      );
    }
    if (hasMoreWidget != null && finalItemCount == 1) {
      return noDataWidget ?? const SizedBox.shrink();
    } else if (hasMoreWidget != null && i == finalItemCount - 1) {
      return const SizedBox.shrink();
    } else {
      return itemBuilder(c, i);
    }
  }
}
