import 'package:flutter/material.dart';

import 'app_icon.dart';
import 'new_project_app_icon.dart';

class BackIcons extends StatefulWidget {
  const BackIcons({super.key});

  @override
  State<BackIcons> createState() => _BackIconsState();
}

class _BackIconsState extends State<BackIcons> {
  String selectFrontStack = "spring";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Spring / NodeJs / NestJs / Django / Flask
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "spring";
            });
          },
          child: NewProjectAppIcon(imageName: "spring", isSelected: selectFrontStack == "spring"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "nodejs";
            });
          },
          child: NewProjectAppIcon(imageName: "nodejs", isSelected: selectFrontStack == "nodejs"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "django";
            });
          },
          child: NewProjectAppIcon(imageName: "django", isSelected: selectFrontStack == "django"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "nestjs";
            });
          },
          child: NewProjectAppIcon(imageName: "nestjs", isSelected: selectFrontStack == "nestjs"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "flask";
            });
          },
          child: NewProjectAppIcon(imageName: "flask", isSelected: selectFrontStack == "flask"),
        ),
      ],
    );
  }
}
