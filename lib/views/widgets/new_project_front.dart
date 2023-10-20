import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProjectFront extends StatefulWidget {
  const NewProjectFront({super.key});

  @override
  State<NewProjectFront> createState() => _NewProjectFrontState();
}

enum Category { App, Web, AppWeb }

class _NewProjectFrontState extends State<NewProjectFront> {
  Category _category = Category.App;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: Category.App,
                  activeColor: const Color.fromARGB(255, 135, 51, 253),
                  groupValue: _category,
                  onChanged: (Category? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: Category.Web,
                  activeColor: const Color.fromARGB(255, 255, 105, 105),
                  groupValue: _category,
                  onChanged: (Category? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                ),
                Text(
                  "Web",
                  style: GoogleFonts.nanumGothic(
                    color: _category == Category.Web
                        ? const Color.fromARGB(255, 255, 105, 105)
                        : Colors.black54,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: Category.AppWeb,
                  activeColor: const Color.fromARGB(255, 249, 148, 23),
                  groupValue: _category,
                  onChanged: (Category? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                ),
                Text(
                  "App/Web",
                  style: GoogleFonts.nanumGothic(
                    color: _category == Category.AppWeb
                        ? const Color.fromARGB(255, 249, 148, 23)
                        : Colors.black54,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
