import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/utils/utils.dart' show Utils;
import 'package:jobdi/widgets/app_svg_images.dart' show AppNetWorkImage;
import 'package:jobdi/widgets/app_text.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    required this.size,
    super.key,
    this.avatarUrl,
    this.userName,
    this.filepath,
    this.asset,
  });
  final String? avatarUrl;
  final String? filepath;
  final String? userName;
  final String? asset;
  final double size;

  String get usernameDisplay {
    return userName
            ?.trimRight()
            .split(' ')
            .take(2)
            .fold<String>(
              '',
              (previousValue, element) =>
                  previousValue += element[0].toUpperCase(),
            ) ??
        '';
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Builder(
        builder: (context) {
          if (Utils.isNotNullOrEmpty(asset)) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                asset!,
                width: size,
                height: size,
              ),
            );
          } else if (Utils.isNotNullOrEmpty(filepath)) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.file(
                File(filepath!),
                width: size,
                height: size,
              ),
            );
          } else if (Utils.isNotNullOrEmpty(avatarUrl)) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: AppNetWorkImage(
                url: avatarUrl!,
                width: size,
                height: size,
              ),
            );
          } else {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: appScheme.primaryColor.withValues(alpha: .5),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: SizedBox.expand(
                child: FittedBox(
                  child: MediumText(
                    usernameDisplay,
                    color: appScheme.white,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
