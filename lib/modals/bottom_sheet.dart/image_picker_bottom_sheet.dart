// ignore_for_file: use_build_context_synchronously, document_ignores

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource;
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart' show SVGAsset;
import 'package:jobdi/core/utils/permission_helper.dart' show PermissionHelper;
import 'package:jobdi/core/utils/utils.dart' show Utils;
import 'package:jobdi/domain/entities/custom_file.dart' show CustomFile;
import 'package:jobdi/modals/bottom_sheet.dart/bottom_sheet.dart'
    show BottomSheetWidget, BottomSheetWidgetState;
import 'package:jobdi/widgets/app_svg_images.dart' show AppSvgImage;
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;
import 'package:jobdi/widgets/gap.dart' show Gap;

class ImagePickerBottomSheet extends BottomSheetWidget {
  const ImagePickerBottomSheet({
    super.key,
    this.title,
    this.isPickMultipleFiles = false,
  });
  final String? title;
  final bool isPickMultipleFiles;

  @override
  State<BottomSheetWidget> createState() => _ImagePickerBottomSheetState();
}

class _ImagePickerBottomSheetState
    extends BottomSheetWidgetState<ImagePickerBottomSheet> {
  final ImagePicker picker = ImagePicker();

  void handlePickSuccess(CustomFile pickedFile) {
    NavigatorService.goBack(context, pickedFile);
  }

  Future<void> handlePickMultiSuccess(
    List<Future<CustomFile>> pickedFiles,
  ) async {
    final newList = await Future.wait(pickedFiles);
    NavigatorService.goBack(context, newList);
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: SemiBoldText(
                widget.title ?? 'Tải ảnh lên',
                color: appScheme.gray900,
              ),
            ),
            ClickWidget(
              onTap: () => NavigatorService.goBack<void>(context),
              child: const AppSvgImage(assetName: SVGAsset.icon_close),
            ),
          ],
        ),
        const Gap(14),
        ClickWidget(
          onTap: () async {
            picker
                .pickImage(imageQuality: 50, source: ImageSource.camera)
                .then((res) async {
                  if (res != null) {
                    final actualFile = await Utils.compressXFile(res);
                    final byte = await actualFile.readAsBytes();
                    final file = CustomFile(
                      byte: byte,
                      fileName: actualFile.name,
                      filePath: actualFile.path,
                    );
                    if (widget.isPickMultipleFiles) {
                      handlePickMultiSuccess([Future(() => file)]);
                    } else {
                      handlePickSuccess(
                        CustomFile(
                          byte: byte,
                          fileName: actualFile.name,
                          filePath: actualFile.path,
                        ),
                      );
                    }
                  }
                })
                .onError<PlatformException>((error, stackTrace) async {
                  if (error.code == 'camera_access_denied') {
                    PermissionHelper.retryCameraPermission();
                  }
                });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const AppSvgImage(assetName: SVGAsset.icon_camera),
                const SizedBox(width: 12),
                MediumText(
                  'Chụp ảnh',
                  color: appScheme.gray700,
                ),
              ],
            ),
          ),
        ),
        ClickWidget(
          onTap: () async {
            if (widget.isPickMultipleFiles) {
              picker
                  .pickMultiImage(imageQuality: 50)
                  .then((res) async {
                    if (res.isNotEmpty) {
                      final listFiles = res.map((e) async {
                        final actualFile = await Utils.compressXFile(e);
                        final byte = await actualFile.readAsBytes();
                        return CustomFile(
                          byte: byte,
                          fileName: actualFile.name,
                          filePath: actualFile.path,
                        );
                      }).toList();
                      handlePickMultiSuccess(listFiles);
                    }
                  })
                  .onError<PlatformException>((error, stackTrace) async {
                    if (error.code == 'camera_access_denied') {
                      await PermissionHelper.retryCameraPermission();
                    }
                  });
            } else {
              picker
                  .pickImage(
                    imageQuality: 50,
                    source: ImageSource.gallery,
                  )
                  .then((res) async {
                    if (res != null) {
                      final actualFile = await Utils.compressXFile(res);
                      final byte = await actualFile.readAsBytes();
                      handlePickSuccess(
                        CustomFile(
                          byte: byte,
                          fileName: actualFile.name,
                          filePath: actualFile.path,
                        ),
                      );
                    }
                  })
                  .onError<PlatformException>((error, stackTrace) async {
                    if (error.code == 'read_external_storage_denied') {
                      PermissionHelper.retryPhotoPermission();
                    }
                  });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const AppSvgImage(assetName: SVGAsset.icon_lib),
                const SizedBox(width: 12),
                MediumText(
                  'Chọn ảnh từ thư viện',
                  color: appScheme.gray700,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
