import 'package:flutter/material.dart';
import 'package:loanapp/container_navigation.dart';
import 'package:loanapp/screens/dashboard.dart';
import 'package:loanapp/screens/views/login_view.dart';
import 'package:loanapp/screens/views/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      //initialRoute: '/login_view',    //uncomment after testing
      initialRoute: '/container_navigation',
      routes: {
        //  '/': (context) => const LoginView(),  //uncomment after testing
        '/': (context) => const ContainerMainNav(),
        '/login': (context) => const LoginView(),
        '/signup': (context) => const SignUpView(),
        '/dashboard': (context) => const DashboardWidget(),
        '/container_navigation': (context) => const ContainerMainNav(),
      },
    );
  }
}
