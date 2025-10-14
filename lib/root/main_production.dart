import 'package:jobdi/core/constants/app_constants.dart';
import 'package:jobdi/main.dart';

Future<void> main() async {
  AppConstants.setEnvironment(Environment.PRODUCT);
  await mainDelegate();
}
