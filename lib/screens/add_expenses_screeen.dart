import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/theme.dart';
import 'package:intl/intl.dart';
import 'package:loanapp/controller/simple_ui_controller.dart';
import 'package:lottie/lottie.dart';

class AddExpensesScreen extends StatefulWidget {
  const AddExpensesScreen({super.key});

  @override
  State<AddExpensesScreen> createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  TextEditingController purposeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? mPurpose;
  int? mAmount;
  String? mDate;

  @override
  void initState() {
    super.initState();
    dateController.text = "${DateTime.now().toLocal()}".split(' ')[0];
  }

  @override
  void dispose() {
    super.dispose();
    purposeController.dispose();
    amountController.dispose();
    dateController.dispose();
  }

  var size;
  SimpleUIController simpleUIController = Get.put(SimpleUIController());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses Form'),
          elevation: 1,
          backgroundColor: kcolormix,
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
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
        Container(
          margin: const EdgeInsets.all(10),
          height: 140,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kcolormix,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: kAmbeziColor,
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28)),
            border: Border.all(
              color: kPrimaryColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox.square(
                child: Lottie.asset(
                  'assets/ripple.json',
                  //height: 140, //size.height * 0.3,
                  //width: 140, //double.infinity,
                  fit: BoxFit.fill,
                ),
                dimension: 140,
              )
            ],
          ),
        ),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  /// Full name
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      // hintText: 'Full Name',
                      labelText: "Purpose",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: purposeController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter full name';
                      } else if (value.length < 4) {
                        return 'Name too short';
                      } else if (value.length > 25) {
                        return 'maximum character is 25';
                      }
                      return null;
                    },
                  ),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  //amount
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      // hintText: 'Loan Amount',
                      labelText: 'Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: amountController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Amount';
                      }
                      return null;
                    },
                  ),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  //date
                  DateWidgetTextView(),

                  SizedBox(
                    height: size.height * 0.05,
                  ),

                  /// Submit Button
                  submitButton(),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container DateWidgetTextView() {
    return Container(
      child: TextFormField(
        controller: dateController, //editing controller of this TextField4

        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.calendar_today), //icon of text field
          labelText: "Date yyyy/mm/dd", //label text of field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
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
              dateController.text =
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
  Widget submitButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kAmberColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            //Get data.
            mPurpose = purposeController.text;

            mAmount = int.parse(amountController.text);

            mDate = dateController.text;

            print("success");
            print(mPurpose);

            print(mAmount);

            print(mDate);
          } else {
            print("Failed");
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Add Expenses',
              style: kDefualtFontStyleBody(size),
            ),
          ],
        ),
      ),
    );
  }
}
