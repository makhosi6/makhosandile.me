import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makhosandile_me/helpers.dart';
import 'package:makhosandile_me/theme.dart';

class CopyrightFooterSection extends StatelessWidget {
  const CopyrightFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    const year = 2020;
    return Container(
      color: Colors.grey.shade200,
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    'My heartfelt thanks to the open source community for the ',
                style: GoogleFonts.dmSans(
                  color: textColor,
                  fontSize: 11.5,
                ),
                children: [
                  TextSpan(
                    text: 'designs',
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () async => await launchSocialMediaUrl(designsUrl),
                    style: const TextStyle(
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(
                    text: '\n© $year Makhosi',
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
