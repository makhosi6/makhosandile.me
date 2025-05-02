import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makhosandile_me/helpers.dart';
import 'package:makhosandile_me/theme.dart';

class CopyrightFooterSection extends StatelessWidget {
  const CopyrightFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    return Container(
      color: Colors.grey.shade200,
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width / 2,
            child: RichText(
              strutStyle: const StrutStyle(
                height: 1.5,
              ),
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    'My heartfelt thanks to the open source community for the ',
                style: GoogleFonts.dmSans(
                  color: textColor,
                  // fontSize: 11.5,
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
                  TextSpan(
                    text:
                        '\n© $year Makhosi (makhosandile.me)\nAll rights reserved.',
                    style: GoogleFonts.dmSans(
                      color: textColor,
                      // fontSize: 11.5,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
