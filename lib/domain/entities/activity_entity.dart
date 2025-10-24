import 'package:jobdi/core/themes/app_image.dart';

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
}

enum ActivityStatus { coming, working, done }
