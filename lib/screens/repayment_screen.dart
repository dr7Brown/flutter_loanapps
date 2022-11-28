import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:loanapp/screens/add_repayment_screen.dart';
import 'package:loanapp/theme.dart';

class RepaymentScreen extends StatefulWidget {
  const RepaymentScreen({super.key});

  @override
  State<RepaymentScreen> createState() => _RepaymentScreenState();
}

class _RepaymentScreenState extends State<RepaymentScreen> {
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
      key: scaffoldKey,
      backgroundColor: kWhiteColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddRepaymentScreen()));
        },
        label: const Text('Repayment'),
        icon: const Icon(Icons.add),
        backgroundColor: kAmberTransColor,
      ),
      body: Container(
        //ListView starts here
        //physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(1, 0, 1, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kOffWhitecolor2,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color.fromARGB(31, 224, 216, 216),
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
              itemComparator: (item1, item2) => item1['name'].compareTo(item2[
                  'name']), //change orders of items to sort alphabetically
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              groupSeparatorBuilder: (String value) => Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                color: kOffWhitecolor2,
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
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
                            alignment: Alignment.center, // This is needed
                            child: Image.asset(
                              'images/mat_checked.png',
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.center, // This is needed
                            child: Image.asset(
                              'images/mat_cancel.png',
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.center, // This is needed
                            child: Image.asset(
                              'images/mat_empty_box.png',
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.center, // This is needed
                            child: Image.asset(
                              'images/mat_empty_box.png',
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.center, // This is needed
                            child: Image.asset(
                              'images/mat_empty_box.png',
                            ),
                          ),
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
    );
  }
}
