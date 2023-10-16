import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeader extends StatefulWidget {
  const MainHeader({super.key});

  @override
  State<MainHeader> createState() => _MainHeaderState();
}

class _MainHeaderState extends State<MainHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                  height: 25,
                ),
                Image.asset("assets/images/tuk_logo.png",
                    width: 35, height: 35),
                const SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "TukPro",
                    style: GoogleFonts.kalam(
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            child: Row(
              children: [
                Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 33,
                      color: Colors.black.withOpacity(0.65),
                    ),
                    Positioned(
                      top: 3,
                      right: 4,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
