import 'package:flutter/material.dart';

import 'app_icon.dart';
import 'new_project_app_icon.dart';

class FrontIcons extends StatefulWidget {
  const FrontIcons({super.key});

  @override
  State<FrontIcons> createState() => _FrontIconsState();
}

class _FrontIconsState extends State<FrontIcons> {
  String selectFrontStack = "react";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // React / Vue / Angular / Svelte
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "react";
            });
          },
          child: NewProjectAppIcon(imageName: "react", isSelected: selectFrontStack == "react"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "vue";
            });
          },
          child: NewProjectAppIcon(imageName: "vue", isSelected: selectFrontStack == "vue"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "angular";
            });
          },
          child: NewProjectAppIcon(imageName: "angular", isSelected: selectFrontStack == "angular"),
        ),
        SizedBox(width: 3),
        InkWell(
          onTap: () {
            setState(() {
              selectFrontStack = "svelte";
            });
          },
          child: NewProjectAppIcon(imageName: "svelte", isSelected: selectFrontStack == "svelte"),
        ),
      ],
    );
  }
}
