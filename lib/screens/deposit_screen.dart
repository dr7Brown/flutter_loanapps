import 'package:flutter/material.dart';
import 'package:loanapp/theme.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool ischecked = false;
  final List _elements = [
    {'group': 'Nov 11', 'name': 'Evans'},
    {'group': 'Team A', 'name': 'Evans'},
    {'group': 'Team A', 'name': 'Evans'},
    {'group': 'Team B', 'name': 'Evans'},
    {'group': 'Team B', 'name': 'Evans'},
    {'group': 'Team c', 'name': 'Evans'},
    {'group': 'Team c', 'name': 'Evans'},
    {'group': 'Team c', 'name': 'Evans'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Deposit'),
        icon: const Icon(Icons.add),
        backgroundColor: kcolormix,
      ),
    );
  }
}
