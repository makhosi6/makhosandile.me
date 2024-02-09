import 'package:flutter/material.dart';
import 'package:makhosandile_me/widgets/utils/scroll_to.dart';
import 'package:makhosandile_me/widgets/work/work_item.dart';

class WorkSection extends StatefulWidget {
  final GlobalKey<WorkSectionState> glKey;
  const WorkSection({required this.glKey}) : super(key: glKey);

  @override
  State<WorkSection> createState() => WorkSectionState();
}

class WorkSectionState extends State<WorkSection> with ScrollTo {
  ///
  void Function()? scrollToWidget;

  ///
  @override
  void initState() {
    super.initState();
    scrollToWidget = scrollToInvocation(context, widget.glKey);
  }

  @override
  Widget build(BuildContext context) {
    final viewPortWidth = MediaQuery.of(context).size.width;
    final padding = viewPortWidth * 0.08;
    final primaryPadding = EdgeInsets.all(padding);
    return Container(
      width: viewPortWidth,
      padding: primaryPadding.copyWith(top: padding / 3, bottom: padding / 3),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Work Section",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(
                projects.length,
                (index) {
                  final title = projects[index]["name"];
                  final subtitle = projects[index]["description"];
                  final image = projects[index]["image"];
                  final url = projects[index]["codeRepository"];

                  return WorkItem(
                      title: title, subTitle: subtitle, image: image, url: url);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

var projects = [
  {
    "name": "Canonical Agency",
    "image": "canonical_agency",
    "codeRepository": "https://github.com/makhosi6/canonical.agency",
    "description":
        "Showcasing a blend of creativity and technical expertise, Canonical Agency (Canonical Labs) stands as a testament to high-quality digital experience creation. Based in Cape Town, this project highlights my adeptness in leveraging cutting-edge design and development practices to transform client visions into reality, emphasizing a user-centric approach and meticulous attention to detail."
  },
  {
    "name": "Taura AI",
    "image": "taura-ai",
    "codeRepository": "https://github.com/makhosi6/taura-ai",
    "description":
        "Taura AI epitomizes the forefront of innovation in AI-powered video localization services. This project underlines my expertise in Python and AI technologies, demonstrating an ability to craft seamless solutions that revolutionize how video content is translated and adapted for diverse audiences, ensuring both precision and ease of integration."
  },
  {
    "name": "Muse",
    "image": "muse",
    "codeRepository": "https://github.com/makhosi6/muse",
    "description":
        "Muse represents a sanctuary of information, delivering accurate, comprehensive data in a minimalist design. This project highlights my proficiency in ReactJs and my commitment to creating user-friendly interfaces, presenting information in a context-rich, noise-free environment that empowers users."
  },
  {
    "name": "Dictionary App",
    "image": "dictionary-react-app",
    "codeRepository": "https://github.com/makhosi6/dictionary-react-app",
    "description":
        "The Dictionary App, powered by Wikipedia, serves as a testament to my skills in JavaScript/React, showcasing the ability to build educational tools that are both informative and engaging. This project embodies my dedication to enriching the learning experience through intuitive design and reliable content."
  },
  {
    "name": "RSA ID Number",
    "image": "rsa_id_number",
    "codeRepository": "https://github.com/makhosi6/rsa_id_number",
    "description":
        "Focusing on the nuances of South African identity verification, the RSA ID Number project is a clear demonstration of my proficiency in Dart. It highlights a meticulous approach to data validation, ensuring accuracy and reliability in identity management systems."
  },
  {
    "name": "Nguni",
    "image": "nguni",
    "codeRepository": "https://github.com/makhosi6/nguni",
    "description":
        """Nguni is an ambitious project aimed at digitizing and enhancing the digital presence of South African Nguni languages. This project showcases my commitment to preserving and promoting cultural heritage through technology. It involves creating a comprehensive language model and dataset that not only includes a detailed dictionary resource outlining the usage, etymology, and pronunciation of words."""
  },
  {
    "name": "Verified",
    "image": "verified",
    "codeRepository": "https://github.com/makhosi6/verified",
    "description":
        "Verified is an epitome of trust and data integrity, offering a user-friendly platform for instant verification of personal information. This project showcases my expertise in Dart/Flutter, highlighting an adeptness in creating secure, efficient, and user-centric applications that prioritize data accuracy and user trust."
  },
  {
    "name": "Muse API",
    "image": "muse_api",
    "codeRepository": "https://github.com/makhosi6/muse_api",
    "description":
        "Muse API is the backbone of data-driven applications, interfacing seamlessly with other micro-services (scrappers) and the Muse UI app. This project emphasizes my proficiency in backend development with Laravel, showcasing the ability to handle complex data operations and provide robust, scalable solutions."
  }
];
