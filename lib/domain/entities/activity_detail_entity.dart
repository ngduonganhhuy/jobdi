import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/widgets/app_text.dart';

class ActivityDetailEntity {
  ActivityDetailEntity({
    required this.timeStarted,
    required this.work,
    required this.status,
    required this.paymentGate,
    required this.scheduleWork,
  });

  final int timeStarted;
  final WorkEntity work;
  final AcitivityDetailStatus status;
  final PaymentGate paymentGate;
  final ScheduleWork scheduleWork;

  String get title => work.title;
}

class ScheduleWork {
  ScheduleWork({
    required this.totalSessions,
    required this.currentSession,
    required this.totalSessionsDone,
    required this.timeStarted,
    required this.timeDuration,
  });

  final int totalSessions;
  final int currentSession;
  final int totalSessionsDone;
  final int timeStarted;
  final int timeDuration;

  String get displayTimeStarted {
    final format = DateFormat('EE, HH:mm');
    return format.format(
      DateTime.fromMillisecondsSinceEpoch(timeStarted),
    );
  }

  String get displayTimeWorking {
    final format = DateFormat('HH:mm');
    final timeStart = DateTime.fromMillisecondsSinceEpoch(timeStarted);
    final timeStartDisplay = format.format(timeStart);
    final timeEnd = timeStart.add(Duration(hours: timeDuration));
    final timeEndDisplay = format.format(timeEnd);
    return '$timeStartDisplay - $timeEndDisplay';
  }
}

class WorkEntity {
  WorkEntity({
    required this.id,
    required this.title,
    required this.address,
    required this.status,
    required this.staff,
    required this.firstPrice,
    required this.lastPrice,
  });

  final String id;
  final String title;
  final String address;
  final WorkingStatus status;
  final StaffEntity staff;
  final num firstPrice;
  final num lastPrice;
}

class StaffEntity {
  StaffEntity({
    required this.name,
    required this.image,
    required this.works,
    required this.rating,
    required this.phone,
  });

  final String name;
  final String image;
  final List<String> works;
  final double rating;
  final int phone;
}

enum WorkingStatus {
  realtime,
  scheduled;

  String get label => switch (this) {
    WorkingStatus.realtime => 'Việc tức thì',
    WorkingStatus.scheduled => 'Việc định kì',
  };

  Color get color => switch (this) {
    WorkingStatus.realtime => appScheme.orange600,
    WorkingStatus.scheduled => appScheme.blue600,
  };

  Color get bgColor => switch (this) {
    WorkingStatus.realtime => appScheme.orange50,
    WorkingStatus.scheduled => appScheme.blue50,
  };

  Widget get statusWidget => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
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

enum PaymentGate {
  credit,
  cash;

  String get label => switch (this) {
    PaymentGate.credit => 'Thẻ tín dụng',
    PaymentGate.cash => 'Tiền mặt',
  };
}

enum AcitivityDetailStatus {
  started,
  negotiate,
  coming,
  working,
  done;

  String get label => switch (this) {
    AcitivityDetailStatus.started => 'Đã bắt đầu',
    AcitivityDetailStatus.negotiate => 'Đang thương lượng',
    AcitivityDetailStatus.coming => 'Đang tới',
    AcitivityDetailStatus.working => 'Đang làm việc',
    AcitivityDetailStatus.done => 'Đã hoàn thành',
  };

  String get icon => switch (this) {
    AcitivityDetailStatus.started => SVGAsset.icon_box_search,
    AcitivityDetailStatus.negotiate => SVGAsset.icon_negotiate,
    AcitivityDetailStatus.coming => 'Đang tới',
    AcitivityDetailStatus.working => SVGAsset.icon_working,
    AcitivityDetailStatus.done => 'Đã hoàn thành',
  };

  String get desc => switch (this) {
    AcitivityDetailStatus.started => 'Đã bắt đầu',
    AcitivityDetailStatus.negotiate => 'Thợ sẽ kiểm tra trình trạng và báo giá cuối cùng',
    AcitivityDetailStatus.coming => 'Đang tới',
    AcitivityDetailStatus.working => 'Đang làm việc',
    AcitivityDetailStatus.done => 'Đã hoàn thành',
  };

  String get iconTimeline => switch (this) {
    AcitivityDetailStatus.started => SVGAsset.icon_bag,
    AcitivityDetailStatus.negotiate => SVGAsset.icon_money_bag,
    AcitivityDetailStatus.coming => SVGAsset.icon_coming,
    AcitivityDetailStatus.working => SVGAsset.icon_settings,
    AcitivityDetailStatus.done => SVGAsset.icon_check,
  };
}

final mockActivityDetail = ActivityDetailEntity(
  scheduleWork: ScheduleWork(
    totalSessions: 10,
    currentSession: 4,
    totalSessionsDone: 3,
    timeStarted: 1761817588,
    timeDuration: 2,
  ),
  paymentGate: PaymentGate.cash,
  timeStarted: 1761727531,
  status: AcitivityDetailStatus.working,
  work: WorkEntity(
    id: '1423',
    title: 'Sửa máy lạnh',
    address: '128 Điện Biên Phủ, Thạnh Mỹ Tây, Hồ Chí Minh',
    status: WorkingStatus.realtime,
    staff: StaffEntity(
      name: 'Nguyễn Anh Nam',
      image:
          'https://media.istockphoto.com/id/2162033406/photo/group-business-meeting-at-bright-beige-office.jpg?s=612x612&w=0&k=20&c=aM9Hqey73JHSz49nrMztNHtvp1BRm2AowEhz6R2jkOs=',
      works: ['điện', 'nước', 'máy lạnh'],
      rating: 5,
      phone: 0348098023,
    ),
    firstPrice: 350000,
    lastPrice: 500000,
  ),
);
