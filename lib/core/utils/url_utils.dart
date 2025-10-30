import 'package:url_launcher/url_launcher_string.dart' as url_launcher;

class UrlUtils {
  static Future<void> makePhoneCall(num phoneNum) async {
    if (await url_launcher.canLaunchUrlString('tel://$phoneNum')) {
      url_launcher.launchUrlString('tel://$phoneNum');
    }
  }
}
