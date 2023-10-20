import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuk_pro_app/views/widgets/user_icon.dart';

import 'app_icon.dart';

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 18.0,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 3,
                right: 3,
                child: AppIcon(imageName: "flutter", isHome: true),
              ),
              Positioned(
                top: 3,
                right: 27,
                child: AppIcon(imageName: "flutter", isHome: true),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 135, 51, 253),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "App",
                        style: GoogleFonts.nanumGothic(
                          color: const Color.fromARGB(255, 135, 51, 253),
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "YouTuBe",
                          style: GoogleFonts.nanumGothic(
                            color: Colors.black87.withOpacity(0.8),
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "사용자가 동영상을 자유롭게 올리거나 시청할 수 있는 영상 플랫폼",
                          style: GoogleFonts.nanumGothic(
                            color: Colors.black87.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 0.3),
                          Text(
                            "3명 참여중",
                            style: GoogleFonts.nanumGothic(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 3),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const SizedBox(height: 1),
                          Text(
                            "모집중!",
                            style: GoogleFonts.nanumGothic(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 3),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: -0,
                left: 20,
                child: const UserIcon(),
              ),
              Positioned(
                bottom: -0,
                left: 12,
                child: const UserIcon(),
              ),
              Positioned(
                bottom: -0,
                left: 4,
                child: const UserIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
