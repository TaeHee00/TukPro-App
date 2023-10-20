import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuk_pro_app/provider/login_session_provider.dart';
import 'package:tuk_pro_app/views/login.dart';
import 'package:tuk_pro_app/views/project_list.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasLoginSession = ref.watch(loginSessionProvider).isLogin;

    return MaterialApp(
      title: "TukPro",
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 232, 243, 252)), // textTheme: Theme.of(context).textTheme.apply(fontFamily: GoogleFonts.openSans())
      ),
      home: hasLoginSession ? ProjectListScreen() : const LoginScreen(),
    );
  }
}
