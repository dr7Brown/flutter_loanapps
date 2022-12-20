import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/screens/payments_screen.dart';
import 'package:loanapp/screens/deposit_screen.dart';
import 'package:loanapp/screens/repayment_screen.dart';
import 'package:loanapp/screens/reports_deposit_screen.dart';
import 'package:loanapp/screens/reports_expenses_screen.dart';
import 'package:loanapp/screens/reports_loans_screen.dart';
import 'package:loanapp/screens/reports_repayment_screen.dart';
import 'package:loanapp/theme.dart';

class ReportsContainer extends StatefulWidget {
  const ReportsContainer({super.key});

  @override
  State<ReportsContainer> createState() => _ReportsContainerState();
}

class _ReportsContainerState extends State<ReportsContainer> {
  int index = 0;
/*
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }
 

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            //flexibleSpace: ,
            title: const TabBar(
              tabs: [
                Tab(text: 'Repayments' /*icon: Icon(Icons.directions_car)*/),
                Tab(
                  text: 'Loans', /*icon: Icon(Icons.directions_transit)*/
                ),
                Tab(
                  text: 'Deposit', /*icon: Icon(Icons.directions_transit)*/
                ),
                Tab(
                  text: 'Expenses', /*icon: Icon(Icons.directions_transit)*/
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            //title: const Text('Loan Us'),
            backgroundColor: kPrimaryColor,
          ),
          body: const TabBarView(
            // physics: BouncingScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: [
              ReportsRepaymentScreen(),
              ReportsLoansScreen(),
              ReportsDepositScreen(),
              ReportsExpensesScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
