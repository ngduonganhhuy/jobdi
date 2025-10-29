import 'package:flutter/foundation.dart' show BindingBase;
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:jobdi/core/constants/app_constants.dart';
import 'package:jobdi/main.dart';

Future<void> main() async {
  BindingBase.debugZoneErrorsAreFatal = false;
  AppConstants.setEnvironment(Environment.DEV);
  await dotenv.load(fileName: '.env_dev');
  await mainDelegate();
}
