import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/footer/copyright_footer_section.dart';
import 'package:makhosandile_me/widgets/footer/footer_contact_form.dart';
import 'package:makhosandile_me/widgets/footer/footer_links_text.dart';
import 'package:makhosandile_me/widgets/utils/scroll_to.dart';

class FooterSection extends StatefulWidget {
  final GlobalKey<FooterSectionState> glKey;
  const FooterSection({required this.glKey}) : super(key: glKey);

  @override
  State<FooterSection> createState() => FooterSectionState();
}

class FooterSectionState extends State<FooterSection> with ScrollTo {
  ///
  void Function()? scrollToWidget = () => {};

  @override
  void initState() {
    super.initState();
    scrollToWidget = scrollToInvocation(context, widget.glKey);
  }

  @override
  Widget build(BuildContext context) {
    final viewPortWidth = MediaQuery.of(context).size.width;
    final padding = viewPortWidth * 0.08;
    final isBiggerScreen = viewPortWidth > 800;
    const verticalSpacing = 60.0;

    return Column(
      children: [
        Container(
          width: viewPortWidth,
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
