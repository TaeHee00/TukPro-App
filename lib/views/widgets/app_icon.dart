import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.imageSelect});
  final imageSelect;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 50,
      height: 50,
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
        width: 45,
        height: 45,
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
              width: imageSelect == 0 ? 35 : 40,
              height: imageSelect == 0 ? 35 : 40,
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(40),
                child: Image.asset(
                  imageSelect == 0 ?
                  "assets/images/flutter.png" : "assets/images/spring-boot.png",
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
