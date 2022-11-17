import 'package:flutter/material.dart';
import 'package:loanapp/mdashboard.dart';
import 'package:loanapp/screens/dashboard.dart';
import 'package:loanapp/screens/home.dart';
import 'package:loanapp/screens/layouts.dart';
import 'package:loanapp/screens/loading_screen.dart';
import 'package:loanapp/screens/login.dart';
import 'package:loanapp/screens/signup.dart';
import 'package:loanapp/mdashboard.dart';

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
      //home: HomePage(),
      initialRoute: '/dashboard',
      routes: {
        '/': (context) => LoadingScreen(),
        '/login': (context) => LogInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/homepage': (context) => HomePage(),
        '/loading_screen': (context) => LoadingScreen(),
        '/myhomepage': (context) => MyHomePage(),
        '/dashboard': (context) => DashboardWidget(),
        '/mdashboard': (context) => MDashboard(),
      },
    );
  }
}
