import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/domain/entities/activity_detail_entity.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/gap.dart';

final class ConversationEntity {
  ConversationEntity({
    required this.staff,
    required this.work,
    required this.staffStatus,
    required this.message,
  });

  final StaffEntity staff;
  final WorkEntity work;
  final StaffStatus staffStatus;
  final String message;
}

enum StaffStatus {
  online,
  offline;

  String get label => switch (this) {
    StaffStatus.online => 'Sẵn sàng',
    StaffStatus.offline => 'Vắng mặt',
  };

  Color get color => switch (this) {
    StaffStatus.online => appScheme.green500,
    StaffStatus.offline => appScheme.gray300,
  };

  Color get bgColor => switch (this) {
    StaffStatus.online => appScheme.green50,
    StaffStatus.offline => appScheme.gray25,
  };

  Widget get statusWidget => Container(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 7.r,
          height: 7.r,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const Gap(10),
        MediumText(
          label,
          color: appScheme.gray900,
          fontSize: 10,
        ),
      ],
    ),
  );
}

final mockConversations = [
  ConversationEntity(
    staff: mockActivityDetail.work.staff,
    work: mockActivityDetail.work,
    staffStatus: StaffStatus.online,
    message: 'Dắt chó đi dạo',
  ),
  ConversationEntity(
    staff: mockActivityDetail.work.staff,
    work: mockActivityDetail.work,
    staffStatus: StaffStatus.offline,
    message: 'Sửa ống nước',
  ),
];
