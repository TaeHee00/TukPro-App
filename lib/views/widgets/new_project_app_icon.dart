import 'package:flutter/material.dart';

class NewProjectAppIcon extends StatelessWidget {
  const NewProjectAppIcon({super.key, required this.imageName, required this.isSelected});
  final imageName;
  final bool isSelected;

  static const react = "assets/images/react.png";
  static const angular = "assets/images/angular.png";
  static const vue = "assets/images/vue.png";
  static const svelte = "assets/images/svelte.png";

  static const flutter = "assets/images/flutter.png";

  @override
  Widget build(BuildContext context) {
    String? image;

    switch(imageName) {
      case "react":
        image = react;
      case "angular":
        image = angular;
      case "vue":
        image = vue;
      case "svelte":
        image = svelte;
      case "flutter":
        image = flutter;
    }

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepOrangeAccent : Colors.grey,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color:
            Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Container(
        width: 55,
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              width: 45,
              height: 45,
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(40),
                child: Image.asset(
                  image!,
                ),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
          ],
        ),
      ),
    );
  }
}
