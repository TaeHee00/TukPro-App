import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressingProject extends StatelessWidget {
  const ProgressingProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Colors.white,
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "진행중인 프로젝트",
                      style: GoogleFonts.nanumGothic(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right_outlined,
                      size: 30,
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        "assets/images/dummy_project_img.png",
                        fit: BoxFit.cover,
                        width: 90,
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "대규모 트래픽 처리 소셜 서비스",
                            style: GoogleFonts.nanumGothic(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Task: 로그인 서버 구현",
                            style: GoogleFonts.nanumGothic(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black54),
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Task Deadline: 10-21 12:30",
                            style: GoogleFonts.nanumGothic(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black54),
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "다음 회의: 10-21 21:30",
                            style: GoogleFonts.nanumGothic(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black54),
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
