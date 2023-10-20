import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuk_pro_app/views/home.dart';
import 'package:tuk_pro_app/views/new_project.dart';
import 'package:tuk_pro_app/views/widgets/main_header.dart';
import 'package:tuk_pro_app/views/widgets/progressing_project.dart';
import 'package:tuk_pro_app/views/widgets/project.dart';
import 'package:tuk_pro_app/views/widgets/project_list_bar.dart';

class ProjectListScreen extends ConsumerStatefulWidget {
  const ProjectListScreen({super.key});

  @override
  ConsumerState<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends ConsumerState<ProjectListScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      HomeScreen(),
      NewProjectScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
    
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 136, 136, 203),
          selectedLabelStyle: GoogleFonts.nanumGothic(
            fontWeight: FontWeight.w800,
            fontSize: 13,
          ),
          unselectedItemColor: null,
          unselectedLabelStyle: GoogleFonts.nanumGothic(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: "랭킹",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: "생성",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded),
              label: "메시지",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 29,
              ),
              label: "내 정보",
            ),
          ],
          currentIndex: _selectedIndex,
          // 지정 인덱스로 이동
          onTap: _onItemTapped,
        ),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
