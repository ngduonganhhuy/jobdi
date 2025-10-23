import 'package:jobdi/core/themes/app_image.dart';

final class CategoryEntity {
  CategoryEntity({
    required this.image,
    required this.title,
    required this.description,
    required this.quantity,
  });

  final String image;
  final String title;
  final String description;
  final int quantity;

  static final List<CategoryEntity> mockList = [
    CategoryEntity(
      image: PNGAsset.category1,
      title: 'Gia đình – sinh hoạt',
      description: 'Giặt giũ, giúp việc, làm việc nhà',
      quantity: 140,
    ),
    CategoryEntity(
      image: PNGAsset.category4,
      title: 'Vận chuyển – lắp đặt',
      description: 'Giặt giũ, giúp việc, làm việc nhà',
      quantity: 140,
    ),
  ];
}
