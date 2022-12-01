import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:loanapp/screens/add_deposite_screen.dart';
import 'package:loanapp/screens/add_expenses_screeen.dart';
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
    {'group': 'Nov 11/2022', 'name': 'Evans'},
    {'group': 'Nov 11/2022', 'name': 'Evans'},
    {'group': 'Nov 11/2022', 'name': 'Evans'},
    {'group': 'Nov 30/2022', 'name': 'Evans'},
    {'group': 'Nov 11/2022', 'name': 'Evans'},
    {'group': 'Nov 11/2022', 'name': 'Evans'},
    {'group': 'Nov 21/2022', 'name': 'Evans'},
    {'group': 'Nov 11/2022', 'name': 'Evans'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          backgroundColor: kAmberColor,
          label: const Text('Add Expense'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddExpensesScreen()));
          },
          heroTag: null,
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddDepositeScreen()))
          },
          backgroundColor: kcolormix,
          label: const Text('Add Deposit'),
          heroTag: null,
        )
      ]),
      body: Padding(
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
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    color: kPrimaryColor),
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
                      trailing: const Text(
                        'GHC 2000',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: kAmberColor),
                      ), //const Icon(Icons.arrow_forward),
                      onTap: () {
                        /*    */
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
