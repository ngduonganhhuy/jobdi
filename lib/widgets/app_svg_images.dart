import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobdi/core/themes/app_image.dart' show SVGAsset;

class AppNetWorkImage extends StatefulWidget {
  const AppNetWorkImage({
    required this.url,
    super.key,
    this.errorImage,
    this.fit,
    this.width,
    this.height,
    this.showLoading = true,
  });
  final String url;
  final Widget? errorImage;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final bool showLoading;

  @override
  State<AppNetWorkImage> createState() => _AppNetWorkImageState();
}

class _AppNetWorkImageState extends State<AppNetWorkImage> {
  late bool isSvg;
  bool isTimeout = false;

  @override
  void initState() {
    isSvg = widget.url.endsWith('.svg');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppNetWorkImage oldWidget) {
    if (oldWidget.url != widget.url) {
      isSvg = widget.url.endsWith('.svg');
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return isSvg
        ? buildSvgImage()
        : CachedNetworkImage(
            imageUrl: widget.url,
            fit: widget.fit ?? BoxFit.cover,
            width: widget.width,
            height: widget.height,
            placeholder: (context, url) => widget.showLoading
                ? buildLoading(context)
                : const SizedBox.shrink(),
            errorWidget: (context, url, error) => buildError(),
          );
  }

  Widget buildError() =>
      widget.errorImage ??
      SvgPicture.asset(
        SVGAsset.icon_close,
        width: widget.width,
        height: widget.height,
        fit: widget.fit ?? BoxFit.cover,
      );

  Widget buildSvgImage() {
    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted) return;
      setState(() => isTimeout = true);
    });
    return SvgPicture.network(
      widget.url,
      fit: widget.fit ?? BoxFit.cover,
      width: widget.width,
      height: widget.height,
      placeholderBuilder: (context) =>
          isTimeout ? buildError() : buildLoading(context),
    );
  }

  Widget buildLoading(BuildContext context) {
    return Container(
          width: widget.width,
          height: widget.height,
          constraints: BoxConstraints(
            minWidth: widget.width ?? 50,
            minHeight: widget.height ?? 20,
          ),
        )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1.5.seconds);
  }
}

class AppSvgImage extends StatelessWidget {
  const AppSvgImage({
    required this.assetName,
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });
  final String assetName;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
