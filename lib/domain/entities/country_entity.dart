import 'package:jobdi/core/themes/app_image.dart';

final class CountryEntity {
  CountryEntity({
    required this.name,
    required this.slug,
    required this.code,
    required this.icon,
  });

  final String name;
  final String slug;
  final String code;
  final String icon;

  static List<CountryEntity> get listCountries => [
    CountryEntity(
      name: 'Việt Nam',
      slug: 'VN',
      code: '+84',
      icon: SVGAsset.vietnam,
    ),
    CountryEntity(
      name: 'Việt Nam',
      slug: 'VN',
      code: '+84',
      icon: SVGAsset.vietnam,
    ),
    CountryEntity(
      name: 'Việt Nam',
      slug: 'VN',
      code: '+84',
      icon: SVGAsset.vietnam,
    ),
    CountryEntity(
      name: 'Việt Nam',
      slug: 'VN',
      code: '+84',
      icon: SVGAsset.vietnam,
    ),
  ];
}
