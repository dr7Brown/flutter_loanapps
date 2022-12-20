import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/controller/simple_ui_controller.dart';
import 'package:loanapp/theme.dart';
import 'package:lottie/lottie.dart';

class ReportsLoansScreen extends StatefulWidget {
  const ReportsLoansScreen({super.key});

  @override
  State<ReportsLoansScreen> createState() => _ReportsLoansScreenState();
}

class _ReportsLoansScreenState extends State<ReportsLoansScreen> {
  var size;
  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          //title: const Text('Report Page'),
          elevation: 1,
          toolbarHeight: 80,
          backgroundColor: kGreyDarkColor,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 900) {
              return _buildLargeScreen(size, simpleUIController);
            } else {
              return _buildSmallScreen(size, simpleUIController);
            }
          },
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: RotatedBox(
            quarterTurns: 3,
            child: Lottie.asset(
              'assets/coin.json',
              height: size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 3,
          child: _buildMainBody(
            size,
            simpleUIController,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return ListView(
      children: [
        _buildMainBody(
          size,
          simpleUIController,
        ),
      ],
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
