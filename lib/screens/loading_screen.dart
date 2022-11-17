import 'package:flutter/material.dart';
import 'package:loanapp/screens/layouts.dart';

int count = 5;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        count = 4;
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        count = 3;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        count = 2;
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        count = 1;
      });
    });
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        count = 0;
      });
      //
      Navigator.pushReplacementNamed(context, '/mdashboard');
    });
  }

  void navigateNext() {
    Navigator.pushReplacementNamed(context, '/mdashboard');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
    navigateNext();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Loading   $count"),
        ],
      ),
    );
  }
}
