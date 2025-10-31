import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/widgets/app_text.dart';

class ActivityDetailEntity {
  ActivityDetailEntity({
    required this.timeStarted,
    required this.work,
    required this.paymentGate,
    required this.scheduleWork,
  });

  final int timeStarted;
  final WorkEntity work;

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
    required this.jobStatus,
    required this.staff,
    required this.firstPrice,
    required this.lastPrice,
  });

  final String id;
  final String title;
  final String address;
  final JobStatus jobStatus;
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
    required this.workingStatus,
  });

  final String name;
  final String image;
  final List<String> works;
  final double rating;
  final int phone;
  final WorkingStatus workingStatus;
}

enum JobStatus {
  realtime,
  scheduled;

  String get label => switch (this) {
    JobStatus.realtime => 'Việc tức thì',
    JobStatus.scheduled => 'Việc định kì',
  };

  Color get color => switch (this) {
    JobStatus.realtime => appScheme.orange600,
    JobStatus.scheduled => appScheme.blue600,
  };

  Color get bgColor => switch (this) {
    JobStatus.realtime => appScheme.orange50,
    JobStatus.scheduled => appScheme.blue50,
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

enum WorkingStatus {
  started,
  negotiate,
  coming,
  working,
  done;

  String get label => switch (this) {
    WorkingStatus.started => 'Đã bắt đầu',
    WorkingStatus.negotiate => 'Đang thương lượng',
    WorkingStatus.coming => 'Đang tới',
    WorkingStatus.working => 'Đang làm việc',
    WorkingStatus.done => 'Đã hoàn thành',
  };

  Color get color => switch (this) {
    WorkingStatus.started => appScheme.orange500,
    WorkingStatus.negotiate => appScheme.orange500,
    WorkingStatus.coming => appScheme.orange500,
    WorkingStatus.working => appScheme.orange500,
    WorkingStatus.done => appScheme.orange500,
  };

  String get icon => switch (this) {
    WorkingStatus.started => SVGAsset.icon_box_search,
    WorkingStatus.negotiate => SVGAsset.icon_negotiate,
    WorkingStatus.coming => 'Đang tới',
    WorkingStatus.working => SVGAsset.icon_working,
    WorkingStatus.done => 'Đã hoàn thành',
  };

  String get desc => switch (this) {
    WorkingStatus.started => 'Đã bắt đầu',
    WorkingStatus.negotiate =>
      'Thợ sẽ kiểm tra trình trạng và báo giá cuối cùng',
    WorkingStatus.coming => 'Đang tới',
    WorkingStatus.working => 'Đang làm việc',
    WorkingStatus.done => 'Đã hoàn thành',
  };

  String get iconTimeline => switch (this) {
    WorkingStatus.started => SVGAsset.icon_bag,
    WorkingStatus.negotiate => SVGAsset.icon_money_bag,
    WorkingStatus.coming => SVGAsset.icon_coming,
    WorkingStatus.working => SVGAsset.icon_settings,
    WorkingStatus.done => SVGAsset.icon_check,
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
  work: WorkEntity(
    id: '1423',
    title: 'Sửa máy lạnh',
    address: '128 Điện Biên Phủ, Thạnh Mỹ Tây, Hồ Chí Minh',
    jobStatus: JobStatus.realtime,
    staff: StaffEntity(
      workingStatus: WorkingStatus.working,
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
