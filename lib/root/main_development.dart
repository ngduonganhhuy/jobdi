import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:jobdi/core/constants/app_constants.dart';
import 'package:jobdi/main.dart';

Future<void> main() async {
  AppConstants.setEnvironment(Environment.DEV);
  await dotenv.load(fileName: '.env_dev');
  await mainDelegate();
}
