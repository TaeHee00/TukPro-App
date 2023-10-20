import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectListBar extends StatelessWidget {
  const ProjectListBar({super.key});

  @override
  Widget build(BuildContext context) {
    return                           Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          " 프로젝트 목록",
          style: GoogleFonts.nanumGothic(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        const Spacer(),
        Container(
          width: 78,
          height: 35,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black54),
              foregroundColor:
              Colors.black.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  "필터",
                  style: GoogleFonts.nanumGothic(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.filter_alt,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
      ],
    );
  }
}
