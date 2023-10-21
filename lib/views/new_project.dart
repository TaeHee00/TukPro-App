import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuk_pro_app/views/widgets/app_dev_icons.dart';
import 'package:tuk_pro_app/views/widgets/back_icons.dart';
import 'package:tuk_pro_app/views/widgets/front_icons.dart';
import 'package:tuk_pro_app/views/widgets/main_header.dart';
import 'package:tuk_pro_app/views/widgets/new_project_category.dart';

class NewProjectScreen extends StatefulWidget {
  const NewProjectScreen({super.key});

  @override
  State<NewProjectScreen> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainHeader(
          isHome: false,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "새로운 프로젝트",
                    style: GoogleFonts.nanumGothic(
                      color: Colors.black87.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "카테고리",
                    style: GoogleFonts.nanumGothic(
                      color: Colors.black87.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const NewProjectCategory(),
                  const SizedBox(height: 20),
                  Text(
                    "프로젝트명",
                    style: GoogleFonts.nanumGothic(
                      color: Colors.black87.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "프로젝트 설명",
                    style: GoogleFonts.nanumGothic(
                      color: Colors.black87.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "대표 아이콘",
                    style: GoogleFonts.nanumGothic(
                      color: Colors.black87.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1.3)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "프론트엔드(Web)",
                            style: GoogleFonts.nanumGothic(
                              color: Colors.black87.withOpacity(0.65),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          FrontIcons(),
                          const SizedBox(height: 20),
                          Text(
                            "프론트엔드(App)",
                            style: GoogleFonts.nanumGothic(
                              color: Colors.black87.withOpacity(0.65),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          AppDevIcons(),
                          const SizedBox(height: 20),
                          Text(
                            "백엔드",
                            style: GoogleFonts.nanumGothic(
                              color: Colors.black87.withOpacity(0.65),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const BackIcons(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 136, 136, 203),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("프로젝트 생성",
                        style: GoogleFonts.nanumGothic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
