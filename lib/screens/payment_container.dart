// ignore_for_file: unnecessary_const

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/screens/payments_screen.dart';
import 'package:loanapp/screens/deposit_screen.dart';
import 'package:loanapp/screens/repayment_screen.dart';
import 'package:loanapp/theme.dart';

class PayDepoContainer extends StatefulWidget {
  const PayDepoContainer({super.key});

  @override
  State<PayDepoContainer> createState() => _PayDepoContainerState();
}

class _PayDepoContainerState extends State<PayDepoContainer> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Repayments' /*icon: Icon(Icons.directions_car)*/),
                Tab(
                  text: 'Loans', /*icon: Icon(Icons.directions_transit)*/
                ),
                Tab(
                  text: 'Deposit', /*icon: Icon(Icons.directions_transit)*/
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
              RepaymentScreen(),
              PaymentScreen(),
              DepositScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
