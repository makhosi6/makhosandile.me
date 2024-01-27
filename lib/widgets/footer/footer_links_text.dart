import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makhosandile_me/helpers.dart';

class FooterLinksText extends StatelessWidget {
  const FooterLinksText({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPortWidth = MediaQuery.of(context).size.width;
    final isBiggerScreen = viewPortWidth > 800;

    return Container(
        constraints: const BoxConstraints(maxWidth: 320),
        padding: !isBiggerScreen ? const EdgeInsets.only(top: 80) : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: isBiggerScreen
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Let's work together",
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: isBiggerScreen ? null : TextAlign.center,
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 320),
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Got a project? Reach out, Let's chat!  I'm all about making cool stuff with code.",
                textAlign: isBiggerScreen ? null : TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                mainAxisAlignment: isBiggerScreen
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () => launchSocialMediaUrl(
                        'https://linkedin.com/in/makhosandile-ndondo',
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () => launchSocialMediaUrl(
                        'https://github.com/makhosi6/',
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () => launchSocialMediaUrl(
                        'https://www.kaggle.com/makhosandilendondo',
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.kaggle,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
