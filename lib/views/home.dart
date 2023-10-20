import 'package:flutter/material.dart';
import 'package:tuk_pro_app/views/widgets/main_header.dart';
import 'package:tuk_pro_app/views/widgets/progressing_project.dart';
import 'package:tuk_pro_app/views/widgets/project.dart';
import 'package:tuk_pro_app/views/widgets/project_list_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MainHeader(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(milliseconds: 300));
            },
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 300)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          // const SizedBox(height: 2),
                          ProgressingProject(content_bool: false),
                          SizedBox(height: 16),
                          ProjectListBar(),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          ////////////////////////////////////////////////////////////////////////////////
                          Project(),
                          Project(),
                          Project(),
                          Project(),
                          Project(),
                        ],
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ],
    );
  }
}
