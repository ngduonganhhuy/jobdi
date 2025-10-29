import 'package:flutter/material.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/utils/utils.dart';
import 'package:jobdi/widgets/app_text.dart';

final class ActivityEntity {
  ActivityEntity({
    required this.title,
    required this.address,
    required this.status,
    required this.image,
    required this.staffName,
    this.salary,
    this.timeFinished,
  });

  final String title;
  final String address;
  final ActivityStatus status;
  final int? timeFinished;
  final num? salary;
  final String image;
  final String staffName;

  static final List<ActivityEntity> mockData = [
    ActivityEntity(
      title: 'Dắt cho đi dạo',
      address: '128 Điện Biên Phủ, Thạnh Mỹ Tây, TP. HCM',
      status: ActivityStatus.working,
      image: PNGAsset.activity1,
      staffName: 'John Nguyễn',
    ),
    ActivityEntity(
      title: 'Dắt cho đi dạo',
      address: '128 Điện Biên Phủ, Thạnh Mỹ Tây, TP. HCM',
      status: ActivityStatus.coming,
      image: PNGAsset.activity1,
      staffName: 'John Nguyễn',
    ),
    ActivityEntity(
      title: 'Gia sư',
      address: '128 Điện Biên Phủ, Thạnh Mỹ Tây, TP. HCM',
      status: ActivityStatus.done,
      timeFinished: DateTime.now().millisecondsSinceEpoch,
      salary: 120000,
      image: PNGAsset.activity1,
      staffName: 'John Nguyễn',
    ),
  ];

  String get displayAmount =>
      salary != null ? '+ ${Utils.formatNumber(salary!)}đ' : '+ 0';
}

enum ActivityStatus {
  coming,
  working,
  done;

  String get label => switch (this) {
    ActivityStatus.coming => 'Sắp tới',
    ActivityStatus.working => 'Đang làm việc',
    ActivityStatus.done => '',
  };

  Color get color => switch (this) {
    ActivityStatus.coming => appScheme.blue600,
    ActivityStatus.working => appScheme.orange600,
    ActivityStatus.done => Colors.transparent,
  };

  Color get bgColor => switch (this) {
    ActivityStatus.coming => appScheme.blue50,
    ActivityStatus.working => appScheme.orange50,
    ActivityStatus.done => Colors.transparent,
  };

  Widget get statusWidget => Container(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: MediumText(
      label,
      color: color,
      fontSize: 12,
    ),
  );
}
