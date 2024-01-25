import 'package:url_launcher/url_launcher.dart';

Future<void> launchSocialMediaUrl(String url) async =>
    await launchUrl(Uri.parse(url));

const designsUrl =
    "https://www.figma.com/file/eJQQkQFWGVmQkTDTFOJx7C/Portfolio-website-template-(Community)?type=design&node-id=0-1&mode=design";
