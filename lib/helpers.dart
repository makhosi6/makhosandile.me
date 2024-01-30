import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> launchSocialMediaUrl(String url) async =>
    await launchUrl(Uri.parse(url));

const designsUrl =
    "https://www.figma.com/file/eJQQkQFWGVmQkTDTFOJx7C/Portfolio-website-template-(Community)?type=design&node-id=0-1&mode=design";

Future<bool> sendHelpAndContactInfo(ContactInfo info) async {
  final request = http.Request(
    'POST',
    Uri.parse('https://byteestudio.com/api/send-contact-info'),
  );
  request.body = json.encode(info.toJson());
  request.headers.addAll({'Content-Type': 'application/json'});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    log(await response.stream.bytesToString());

    return true;
  } else {
    log(response.reasonPhrase.toString());

    return false;
  }
}

class ContactInfo {
  ContactInfo({
    this.name,
    this.email,
    this.message,
  });

  ContactInfo.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    message = json['message'];
  }

  String? name = "No Name";
  String? email = "no-mail@domain.com";
  String? message = "No Message";

  ContactInfo copyWith({
    String? name,
    String? email,
    String? message,
  }) =>
      ContactInfo(
        name: name ?? this.name,
        email: email ?? this.email,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['message'] = message;
    return map;
  }
}
