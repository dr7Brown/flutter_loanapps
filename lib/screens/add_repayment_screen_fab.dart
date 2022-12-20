import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loanapp/theme.dart';

import '../controller/simple_ui_controller.dart';

class AddRepaymentScreen extends StatefulWidget {
  const AddRepaymentScreen({super.key});

  @override
  State<AddRepaymentScreen> createState() => _AddRepaymentScreenState();
}

class _AddRepaymentScreenState extends State<AddRepaymentScreen> {
  String listOfClient = 'Joseph Annor';
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? mListOfClient;
  int? mAmount;
  String? mDate;

  //String dropdownvalue = 'Joseph Annor';

  //Dammy data
  String mPaid = '2000.00';
  String mBalance = '2000.00';
  String mMonthly = '2000.00';
  String mTotal = '2000.00';

  @override
  void initState() {
    super.initState();
    dateController.text = "${DateTime.now().toLocal()}".split(' ')[0];
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    dateController.dispose();
  }

  // Initial Selected Value
  var size;
  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    //SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Repayment Form'),
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
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kOffWhitcolor,
              ),
              child: Column(
                children: [
                  Row(
                    //Row 1
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: kGreyDarkColor,
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              const Text(
                                'Monthly',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                mMonthly,
                                style: const TextStyle(
                                  backgroundColor: kSecondaryColor,
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: kAmberColor,
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                mTotal,
                                style: const TextStyle(
                                  backgroundColor: kSecondaryColor,
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    //Row 2
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: kcolormix,
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              const Text(
                                'Paid',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                mPaid,
                                style: const TextStyle(
                                  backgroundColor: kSecondaryColor,
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: kTextFieldColor,
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              const Text(
                                'Balance',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                mBalance,
                                style: const TextStyle(
                                  backgroundColor: kSecondaryColor,
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
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
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kOffWhitcolor,
          ),
          child: Column(
            children: [
              Row(
                //Row 1
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: kcolormix,
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Text(
                            'Monthly: $mMonthly',
                            style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Total: $mTotal',
                            style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Paid: $mPaid',
                            style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Balance: $mBalance',
                            style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
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
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    //Dropdown widget
                    children: [
                      Text(
                        'Select Client ',
                        style: subTitle.copyWith(fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      myDropdown(),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //amount
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      // hintText: 'Loan Amount',
                      labelText: 'Loan Amount',
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

                  //vertical space
                  SizedBox(
                    height: size.height * 0.10,
                  ),

                  /// Login Button
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

  Column myDropdown() {
    // List of items in our dropdown menu
    var loanClients = [
      'Joseph Annor',
      'Samuel Bicah',
      'Adu Bright',
      'Moses Annor',
      'Daniel Bicah',
      'Kasi Bright',
      'Joel Annor',
      'Azi Bicah',
      'Addo Bright',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          // Initial Value
          value: listOfClient,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: loanClients.map((String myclients) {
            return DropdownMenuItem(
              value: myclients,
              child: Text(myclients),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              listOfClient = newValue!;
            });
          },
        ),
      ],
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
          backgroundColor: MaterialStateProperty.all(kcolormix),
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
            mListOfClient = listOfClient;
            mAmount = int.parse(amountController.text);
            mDate = dateController.text;

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
              'Submit',
              style: kDefualtFontStyleBody(size),
            ),
          ],
        ),
      ),
    );
  }
}
