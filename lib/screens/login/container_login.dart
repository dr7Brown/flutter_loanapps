import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/screens/login/login_screen.dart';
import 'package:loanapp/screens/login/signup_screen.dart';
import 'package:loanapp/theme.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Sign In' /*icon: Icon(Icons.directions_car)*/),
                Tab(
                  text: 'Sign Up', /*icon: Icon(Icons.directions_transit)*/
                ),
              ],
            ),
            title: const Text('Loan Us'),
            backgroundColor: kPrimaryColor,
          ),
          body: const TabBarView(
            // physics: BouncingScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: [
              LoginScreen(),
              SignupScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
