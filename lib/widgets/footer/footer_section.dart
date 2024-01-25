import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/footer/copyright_footer_section.dart';
import 'package:makhosandile_me/widgets/footer/footer_contact_form.dart';
import 'package:makhosandile_me/widgets/footer/footer_links_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewPortHeight = MediaQuery.of(context).size.height;
    final viewPortWidth = MediaQuery.of(context).size.width;
    final padding = viewPortWidth * 0.08;
    final isBiggerScreen = viewPortWidth > 800;
    const verticalSpacing = 60.0;

    return Column(
      children: [
        Container(
          width: viewPortWidth,
          // constraints: BoxConstraints(
          //   maxHeight: viewPortHeight,
          //   minHeight: viewPortHeight / 2,
          // ),
          padding: EdgeInsets.all(padding),
          child: Wrap(
            runSpacing: verticalSpacing,
            children: [
              Container(
                width: (isBiggerScreen ? (viewPortWidth / 2) : viewPortWidth) -
                    padding,
                child: const FooterLinksText(),
              ),
              Container(
                width: (isBiggerScreen ? (viewPortWidth / 2) : viewPortWidth) -
                    padding,
                child: const FooterContactForm(),
              )
            ],
          ),
        ),
        const CopyrightFooterSection(
          key: Key("copyright-footer-section"),
        )
      ],
    );
  }
}
