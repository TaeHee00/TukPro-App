import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuk_pro_app/views/widgets/main_header.dart';
import 'package:tuk_pro_app/views/widgets/progressing_project.dart';

class ProjectListScreen extends ConsumerStatefulWidget {
  const ProjectListScreen({super.key});

  @override
  ConsumerState<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends ConsumerState<ProjectListScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: Column(
          children: [
            const MainHeader(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 1));
                },
                child: SingleChildScrollView(
                  child: Container(
                    height: 3000,
                    child: Column(
                      children: [
                        // const SizedBox(height: 2),
                        ProgressingProject(),
                        ProgressingProject(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // ListView.builder(
    //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    //       itemCount: 10,
    //       itemBuilder: (context, index) => Container(
    //         width: double.infinity,
    //         height: 300,
    //         child: Card(
    //           child: Center(
    //             child: Text(
    //               "Hi",
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),

    // return Scaffold(
    //   extendBody: true,
    //   bottomNavigationBar: Container(
    //       decoration: const BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //             topRight: Radius.circular(30), topLeft: Radius.circular(30)),
    //         boxShadow: [
    //           BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
    //         ],
    //       ),
    //       child: ClipRRect(
    //         borderRadius: const BorderRadius.only(
    //           topLeft: Radius.circular(30.0),
    //           topRight: Radius.circular(30.0),
    //         ),
    //         child: BottomNavigationBar(
    //           // backgroundColor: Colors.transparent,
    //           backgroundColor: const Color.fromARGB(255, 244, 243, 255),
    //           selectedItemColor: const Color.fromARGB(255, 136, 136, 203),
    //           unselectedItemColor: Colors.grey.shade500,
    //           iconSize: 48,
    //           showSelectedLabels: false,
    //           showUnselectedLabels: false,
    //           currentIndex: _selectedIndex,
    //           onTap: _onItemTapped,
    //           items: const [
    //             BottomNavigationBarItem(
    //               icon: Icon(
    //                 Icons.list,
    //               ),
    //               label: "",
    //             ),
    //             BottomNavigationBarItem(
    //               icon: Icon(
    //                 Icons.add_circle_outline,
    //               ),
    //               label: "",
    //             ),
    //             BottomNavigationBarItem(
    //               icon: Icon(
    //                 Icons.account_circle_outlined,
    //               ),
    //               label: "",
    //             ),
    //           ],
    //         ),
    //       )),
    //   body: Container(
    //     decoration: const BoxDecoration(
    //       color: Color.fromARGB(255, 232, 243, 252),
    //     ),
    //     child: ListView.builder(
    //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    //       itemCount: 10,
    //       itemBuilder: (context, index) => Container(
    //         width: double.infinity,
    //         height: 300,
    //         child: Card(
    //           child: Center(
    //             child: Text(
    //               "Hi",
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
