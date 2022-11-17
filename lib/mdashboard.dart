import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loanapp/screens/dashboard.dart';
import 'package:loanapp/screens/layouts.dart';
import 'package:loanapp/screens/login.dart';
import 'package:loanapp/screens/signup.dart';
import 'package:loanapp/screens/test_listview.dart';
import 'package:loanapp/theme.dart';
import 'package:loanapp/widgets/login_form.dart';

import 'myhomepage.dart';

class MDashboard extends StatefulWidget {
  const MDashboard({super.key});

  @override
  State<MDashboard> createState() => _MDashboardState();
}

class _MDashboardState extends State<MDashboard> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        sizing: StackFit.loose,
        index: index,
        children: [
          //const TestListView(),
          const DashboardWidget(),
          const HomePage(),
          LogInScreen(),
          MyHomePage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              backgroundColor: kPrimaryColor,
              color: Colors.white,
              activeColor: kcolormix,
              //tabBackgroundColor: kSecondaryColor,
              gap: 8,
              padding: EdgeInsets.all(16),
              onTabChange: (int newIndex) {
                //perform on tab change actions here.
                setState(() {
                  index = newIndex;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.payment,
                  text: 'Payments',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Users',
                ),
                GButton(
                  icon: Icons.print,
                  text: 'Reports',
                )
              ]),
        ),
      ),

      /*
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          rippleColor: Color.fromARGB(
              255, 228, 228, 228), // tab button ripple color when pressed
          hoverColor: Color.fromARGB(255, 62, 62, 62), // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          tabActiveBorder:
              Border.all(color: Colors.black, width: 1), // tab button border
          tabBorder:
              Border.all(color: Colors.grey, width: 1), // tab button border
          tabShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          ], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 5), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.purple, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              Colors.purple.withOpacity(0.1), // selected tab background color
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // navigation bar padding
          */
    );
  }
}
