import 'package:flutter/material.dart';

import 'app_icon.dart';
import 'new_project_app_icon.dart';

class AppDevIcons extends StatefulWidget {
  const AppDevIcons({super.key});

  @override
  State<AppDevIcons> createState() => _AppDevIconsState();
}

class _AppDevIconsState extends State<AppDevIcons> {
  String selectFrontStack = "flutter";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Spring / NodeJs / NestJs / Django / Flask
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "flutter";
            });
          },
          child: NewProjectAppIcon(imageName: "flutter", isSelected: selectFrontStack == "flutter"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "swift";
            });
          },
          child: NewProjectAppIcon(imageName: "swift", isSelected: selectFrontStack == "swift"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "kotlin";
            });
          },
          child: NewProjectAppIcon(imageName: "kotlin", isSelected: selectFrontStack == "kotlin"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "react-native";
            });
          },
          child: NewProjectAppIcon(imageName: "react-native", isSelected: selectFrontStack == "react-native"),
        ),
      ],
    );
  }
}
