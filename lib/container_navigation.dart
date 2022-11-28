import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loanapp/screens/dashboard.dart';
import 'package:loanapp/screens/payment_container.dart';
import 'package:loanapp/screens/views/loan_application_view.dart';
import 'package:loanapp/theme.dart';
import 'package:loanapp/myhomepage.dart';

class ContainerMainNav extends StatefulWidget {
  const ContainerMainNav({super.key});

  @override
  State<ContainerMainNav> createState() => _ContainerMainNavState();
}

class _ContainerMainNavState extends State<ContainerMainNav> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        sizing: StackFit.loose,
        index: index,
        children: const [
          DashboardWidget(),
          PayDepoContainer(),
          LoanApplicationScreen(),
          MyHomePage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: kPrimaryColor,
        //height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              color: Colors.white,
              activeColor: kcolormix,
              //hoverColor: kcolormix,
              gap: 8,
              padding: const EdgeInsets.all(16),
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
                  icon: Icons.group,
                  text: 'Users',
                ),
                GButton(
                  icon: Icons.print,
                  text: 'Reports',
                )
              ]),
        ),
      ),
    );
  }
}
