import 'package:flutter/material.dart';
import 'package:loanapp/container_navigation.dart';
import 'package:loanapp/screens/dashboard.dart';
import 'package:loanapp/screens/login/login_screen.dart';
import 'package:loanapp/screens/login/signup_screen.dart';
import 'myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/container_navigation',
      routes: {
        '/': (context) => LoginScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/myhomepage': (context) => MyHomePage(),
        '/dashboard': (context) => DashboardWidget(),
        '/container_navigation': (context) => ContainerMainNav(),
      },
    );
  }
}
