import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_themes.dart';

enum RoleEntity {
  client,
  staff;

  String get image => switch (this) {
    RoleEntity.client => PNGAsset.client,
    RoleEntity.staff => PNGAsset.staff,
  };

  String get name => switch (this) {
    RoleEntity.client => 'Khách hàng',
    RoleEntity.staff => 'Thợ làm',
  };

  String get code => switch (this) {
    RoleEntity.client => 'CLIENT',
    RoleEntity.staff => 'STAFF',
  };

  AppTheme get theme => switch (this) {
    RoleEntity.client => AppTheme.Pink,
    RoleEntity.staff => AppTheme.Green,
  };
}
