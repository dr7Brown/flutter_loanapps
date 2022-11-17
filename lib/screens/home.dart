import 'package:flutter/material.dart';
import 'package:loanapp/theme.dart';
import 'package:loanapp/screens/layouts.dart';
import 'package:loanapp/screens/dashboard.dart';
import 'package:loanapp/screens/loading_screen.dart';
import 'package:loanapp/screens/login.dart';
import 'package:loanapp/screens/signup.dart';
import 'package:loanapp/widgets/todelete_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decorationThickness: 1,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0,
      ),
      
      
    );
  }
}
