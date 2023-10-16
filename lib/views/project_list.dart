import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuk_pro_app/views/main_header.dart';

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
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            color: Colors.white,
                            child: Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    const SizedBox(height: 5,),
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
                                        const SizedBox(width: 10,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 6,),
                                              Text(
                                                "대규모 트래픽 처리 소셜 서비스",
                                                style: GoogleFonts.nanumGothic(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                                softWrap: true,
                                              ),
                                              const SizedBox(height: 15,),
                                              Text("Task: 로그인 서버 구현",
                                                style: GoogleFonts.nanumGothic(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.black54
                                                ),
                                                softWrap: true,
                                              ),
                                              const SizedBox(height: 5,),
                                              Text("Task Deadline: 10-21 12:30",
                                                style: GoogleFonts.nanumGothic(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.black54
                                                ),
                                                softWrap: true,
                                              ),
                                              const SizedBox(height: 5,),
                                              Text("다음 회의: 10-21 21:30",
                                                style: GoogleFonts.nanumGothic(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.black54
                                                ),
                                                softWrap: true,
                                              ),
                                              const SizedBox(height: 10,)
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
                        ),
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
