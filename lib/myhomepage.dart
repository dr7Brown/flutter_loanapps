import 'package:flutter/material.dart';

import 'package:loanapp/responsive/desktop_body.dart';
import 'package:loanapp/responsive/mobile_body.dart';
import 'package:loanapp/responsive/responsive_layout.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyMobileBody(),
        desktopBody: MyDesktopBody(),
      ),
    );
  }
}
