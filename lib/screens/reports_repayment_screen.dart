import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loanapp/controller/simple_ui_controller.dart';
import 'package:loanapp/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:data_tables/data_tables.dart';

class ReportsRepaymentScreen extends StatefulWidget {
  const ReportsRepaymentScreen({super.key});

  @override
  State<ReportsRepaymentScreen> createState() => _ReportsRepaymentScreenState();
}

class _ReportsRepaymentScreenState extends State<ReportsRepaymentScreen> {
  var size;
  SimpleUIController simpleUIController = Get.put(SimpleUIController());
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  //TextEditingController searchTextController = TextEditingController();
  String? mStartDate;
  String? mEndDate;

  final List<Map<String, String>> listOfColumns = [
    {"Name": "AAAAAA", "Number": "1", "State": "Yes"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
  ];

  //List results = [];

  @override
  void initState() {
    super.initState();
    startDateController.text = "${DateTime.now().toLocal()}".split(' ')[0];
  }

  @override
  void dispose() {
    super.dispose();
    startDateController.dispose();
    endDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          //title: const Text('Report Page'),
          title: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    child: StartDateWidgetTextView(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 120,
                    child: EndDateWidgetTextView(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
                  /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
                  ///

                  clearButton(),
                  const SizedBox(
                    width: 10,
                  ),
                  generateButton(),
                ],
              ),
            ],
          ),
          elevation: 1,
          toolbarHeight: 180,
          backgroundColor: kGreyLightColor,
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
              children: [
                DataTable(
                  border: TableBorder.all(
                      color: Color.fromARGB(255, 97, 101, 229),
                      style: BorderStyle.solid,
                      width: 1),
                  columns: [
                    DataColumn(label: Text('Patch')),
                    DataColumn(label: Text('Version')),
                    DataColumn(label: Text('Ready')),
                  ],
                  rows:
                      listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                          .map(
                            ((element) => DataRow(
                                  cells: <DataCell>[
                                    //Extracting from Map element the value
                                    DataCell(Text(element["Name"]!)),
                                    DataCell(Text(element["Number"]!)),
                                    DataCell(Text(element["State"]!)),
                                  ],
                                )),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  StartDateWidgetTextView() {
    return Container(
      child: TextFormField(
        controller: startDateController, //editing controller of this TextField4

        decoration: const InputDecoration(
          //prefixIcon: Icon(Icons.calendar_today), //icon of text field
          labelText: "Start Date", //label text of field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
        ),
        readOnly: true, //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(
                  2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

            setState(() {
              startDateController.text =
                  formattedDate; //set output date to TextField value.
            });
          } else {
            //Date is not selected"
          }
        },
      ),
    );
  }

  Container EndDateWidgetTextView() {
    return Container(
      height: 50,
      child: TextFormField(
        controller: endDateController, //editing controller of this TextField4

        decoration: const InputDecoration(
          labelText: "End Date", //label text of field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
        ),
        readOnly: true, //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(
                  2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

            setState(() {
              endDateController.text =
                  formattedDate; //set output date to TextField value.
            });
          } else {
            //Date is not selected"
          }
        },
      ),
    );
  }

  // Login Button
  Widget generateButton() {
    return SizedBox(
      width: 120,
      height: 30,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kcolormix),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        onPressed: () {
          //1 Get start date
          //2. Get end date
          //3. Process request
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              'Generate',
              style: kDefualtFontStyleBody(size * 0.8),
            ),
          ],
        ),
      ),
    );
  }

  // Login Button
  Widget clearButton() {
    return SizedBox(
      width: 120,
      height: 30,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kGreyDarkColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        onPressed: () {
          //Clear date fields
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              'Clear',
              style: kDefualtFontStyleBody(size * 0.8),
            ),
          ],
        ),
      ),
    );
  }
}
