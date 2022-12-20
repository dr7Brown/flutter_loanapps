// ignore_for_file: unnecessary_const

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/screens/loan_application_newuser.dart';
import 'package:loanapp/screens/loan_application_existuser_screen.dart';

import 'package:loanapp/theme.dart';

class LoanClientsContainer extends StatefulWidget {
  const LoanClientsContainer({super.key});

  @override
  State<LoanClientsContainer> createState() => _LoanClientsContainerState();
}

class _LoanClientsContainerState extends State<LoanClientsContainer>
    with TickerProviderStateMixin {
  int index = 0;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //title: const Text('Loan Us'),
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            //Back button
            ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 20),
                label: const Text('')),

            const Spacer(),
            SizedBox(
              width: 300,
              child: TabBar(
                labelColor: const Color.fromARGB(255, 229, 228, 243),
                labelStyle: knormalTextSize, //theme.textTheme.headline1,
                indicatorColor: const Color.fromARGB(255, 38, 211, 250),
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: const [
                  Tab(text: 'New Client' /*icon: Icon(Icons.directions_car)*/),
                  Tab(
                    text:
                        'Existing Client', /*icon: Icon(Icons.directions_transit)*/
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        // physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        children: const [
          LoanApplicationScreen(),
          LoanAppExistUserScreen(),
        ],
      ),
    );
  }
}
