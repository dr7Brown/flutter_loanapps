
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/png/logo.png',
              height: 60,
              width: 60,
            ),
            Spacer(),
            Container(
              width: 400,
              child: TabBar(
                labelColor: Color.fromRGBO(4, 2, 46, 1),
                labelStyle: theme.textTheme.headline1,
                indicatorColor: Color.fromRGBO(4, 2, 46, 1),
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: [
                  Text('الفاتورة'),
                  Text('دليفري'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: tabController,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}