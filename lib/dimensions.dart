//common device dimensions
import 'package:flutter/material.dart';

// const mobileWidth = 600;
// const tabletWidth = 800; // not specific
// const desktopWith = 1200; //not specific

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 576;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= 576 &&
    MediaQuery.of(context).size.width <= 992;

bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 992;
