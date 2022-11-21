import 'dart:html';

import 'package:flutter/material.dart';
import 'package:loanapp/theme.dart';
import 'package:grouped_list/grouped_list.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool ischecked = false;
  final List _elements = [
    {'group': 'Nov 11', 'name': 'Evans'},
    {'group': 'Team A', 'name': 'Evans'},
    {'group': 'Team A', 'name': 'Evans'},
    {'group': 'Team B', 'name': 'Evans'},
    {'group': 'Team B', 'name': 'Evans'},
    {'group': 'Team B', 'name': 'Evans'},
    {'group': 'Team B', 'name': 'Evans'},
    {'group': 'Team B', 'name': 'Evans'},
    {'group': 'Team C', 'name': 'Evans'},
    {'group': 'Team C', 'name': 'Evans'},
    {'group': 'Team C', 'name': 'Evans'},
    {'group': 'Team C', 'name': 'Evans'},
    {'group': 'Team C', 'name': 'Evans'},
    {'group': 'Team D', 'name': 'Evans'},
    {'group': 'Team D', 'name': 'Evans'},
    {'group': 'Team D', 'name': 'Evans'},
    {'group': 'Team D', 'name': 'Evans'},
    {'group': 'Team E', 'name': 'Evans'},
    {'group': 'Team E', 'name': 'Evans'},
    {'group': 'Team F', 'name': 'Evans'},
    {'group': 'Team F', 'name': 'Evans'},
    {'group': 'Team G', 'name': 'Evans'},
    {'group': 'Team G', 'name': 'Evans'},
    {'group': 'Team J', 'name': 'Evans'},
    {'group': 'Team J', 'name': 'Evans'},
    {'group': 'Team J', 'name': 'Evans'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decorationThickness: 1,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Add Loan'),
        icon: const Icon(Icons.add),
        backgroundColor: kcolormix,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  child: Stack(
                    children: [
                      Container(
                        //width: double.infinity,
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.rectangle,
                        ),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Text(
                            'Weekly Summary',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0.88),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                //padding: const EdgeInsetsDirectional.fromSTEB(
                                //   16, 0, 0, 12),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 140,
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    color: kOffWhitcolor,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: kAmbeziColor,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: kPrimaryColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            color: kPrimaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: kPrimaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Icon(
                                                Icons.arrow_circle_up_sharp,
                                                color: kWhiteColor,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Disbursed',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  //decoration: TextDecoration.underline,
                                                  decorationThickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  '2,000',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: kcolormix,
                                                    fontSize: 16,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w700,
                                                    //decoration: TextDecoration.underline,
                                                    decorationThickness: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                //padding: const EdgeInsetsDirectional.fromSTEB(
                                //    16, 0, 16, 12),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 140,
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    color: kOffWhitcolor,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: kAmbeziColor,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: kPrimaryColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            color: kPrimaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: kPrimaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Icon(
                                                Icons
                                                    .arrow_circle_down_outlined,
                                                color: kWhiteColor,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Received',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  //decoration: TextDecoration.underline,
                                                  decorationThickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  '3,200',
                                                  style: TextStyle(
                                                    color: kcolormix,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    //decoration: TextDecoration.underline,
                                                    decorationThickness: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  //ListView starts here
                  //physics: ScrollPhysics(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x1F000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GroupedListView<dynamic, String>(
                        //physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        elements: _elements,
                        groupBy: (element) => element['group'],
                        groupComparator: (value1, value2) => value2.compareTo(
                            value1), //change orders of group to sort alphabetically
                        itemComparator: (item1, item2) => item1['name']
                            .compareTo(item2[
                                'name']), //change orders of items to sort alphabetically
                        order: GroupedListOrder.DESC,
                        useStickyGroupSeparators: true,
                        groupSeparatorBuilder: (String value) => Container(
                          padding: const EdgeInsets.all(8.0),
                          width: double.infinity,
                          color: kBlackColor,
                          child: Text(
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kAmbeziColor),
                          ),
                        ),
                        itemBuilder: (c, element) {
                          return Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  leading: const Icon(Icons.account_circle),
                                  title: Text(element['name']),
                                  trailing: const Icon(Icons.arrow_forward),
                                  onTap: () {
                                    /*    */
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    const Text(
                                      'Last five repayments',
                                      style: TextStyle(
                                        color: kDarkGreyColor,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      height: 30,
                                      alignment:
                                          Alignment.center, // This is needed
                                      child: Image.asset(
                                        'images/mat_checked.png',
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      alignment:
                                          Alignment.center, // This is needed
                                      child: Image.asset(
                                        'images/mat_cancel.png',
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      alignment:
                                          Alignment.center, // This is needed
                                      child: Image.asset(
                                        'images/mat_empty_box.png',
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      alignment:
                                          Alignment.center, // This is needed
                                      child: Image.asset(
                                        'images/mat_empty_box.png',
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      alignment:
                                          Alignment.center, // This is needed
                                      child: Image.asset(
                                        'images/mat_empty_box.png',
                                      ),
                                    ),
                                    /*
                                    TextButton(
                                      child: const Text('BUY TICKETS'),
                                      onPressed: () {/* ... */},
                                    ),
                                    const SizedBox(width: 8),
                                    TextButton(
                                      child: const Text('SELL TICKETS'),
                                      onPressed: () {/* ... */},
                                    ),
                                    */
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
