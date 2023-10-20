import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.imageName, required this.isHome});
  final imageName;
  final bool isHome;

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
      width: isHome ? 50 : 60,
      height: isHome ? 50 : 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 135, 51, 253),
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
        width: isHome ? 45 : 55,
        height: isHome ? 45 : 55,
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
              width: isHome ? 35 : 45,
              height:isHome ? 35 : 45,
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
