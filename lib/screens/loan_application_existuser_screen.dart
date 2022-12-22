import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loanapp/controller/simple_ui_controller.dart';
import 'package:loanapp/theme.dart';
import 'package:lottie/lottie.dart';

class LoanAppExistUserScreen extends StatefulWidget {
  const LoanAppExistUserScreen({super.key});

  @override
  State<LoanAppExistUserScreen> createState() => _LoanAppExistUserScreenState();
}

class _LoanAppExistUserScreenState extends State<LoanAppExistUserScreen> {
  String nameOfApplicant = 'None';
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  String termsOfLoan = "Weekly"; //Values are: Weekly, Bi Weekly, Monthly
  TextEditingController durationController = TextEditingController();
  TextEditingController firstRepaymentDateController = TextEditingController();
  TextEditingController accNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController guarantorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String mUserID = '';
  String mNameOfApplicant = '';
  int mAmount = 0;
  double mRate = 0;
  String? mTerms;
  int mDuration = 0;
  String? mFirstRepaymentDate;
  String? mAccNumber = '';
  String? mDate;
  String mGuarantor = '';

  //
  int numOfTimes = 0;
  double repayment = 0;
  double interest = 0;
  double interestPlusPrincipal = 0;

  //date variables
  DateTime myFirstRepDate = DateTime.now();
  int week_days = 7;
  int biweek_days = 14;
  List repaymentDates = [];

  //Others
  late FocusNode genAccNumFocus;

  @override
  void initState() {
    super.initState();
    genAccNumFocus = FocusNode();
    firstRepaymentDateController.text =
        "${DateTime.now().toLocal()}".split(' ')[0];

    dateController.text = "${DateTime.now().toLocal()}".split(' ')[0];
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    rateController.dispose();
    termsOfLoan = "Weekly"; //Default value
    durationController.dispose();
    firstRepaymentDateController.dispose();
    accNumberController.dispose();
    dateController.dispose();
    guarantorController.dispose();
    genAccNumFocus.dispose();
  }

  // Initial Selected Value
  String userdropdownvalue = 'None';
  String dropdownvalue = 'Weekly';
  var size;
  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    //SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Personal Details',
                    style: kDefualtFontStyleBody(size),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //user selection dropdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Select Existing Client',
                        style: kDefualtFontStyleBody(size),
                      ),
                      //horizontal space
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      loanClientsDropdown(),
                    ],
                  ),
                  //vertical space
                  SizedBox(
                    height: size.height * 0.10,
                  ),

                  //Loan details
                  Text(
                    'Loan Details',
                    style: kDefualtFontStyleBody(size),
                  ),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  //amount
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      //FilteringTextInputFormatter.digitsOnly, cant use , or .
                      FilteringTextInputFormatter.allow((RegExp("[.,0-9]"))),
                    ],
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

                  //rate
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow((RegExp("[.,0-9]"))),
                    ],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.timeline),
                      labelText: 'Interest Rate',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: rateController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter interest rate';
                      }
                      return null;
                    },
                  ),
                  //vertical space
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  //Loan terms
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Loan Terms',
                        style: kDefualtFontStyleBody(size),
                      ),
                      //horizontal space
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      myDropdown(),
                    ],
                  ),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  // duration
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      labelText: 'Durations (Months)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: durationController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter duration of loan';
                      }
                      return null;
                    },
                  ),
                  //vertical space
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  //date
                  FirstRepaymtDateWidgetTextView(),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.10,
                  ),

                  //Loan details++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  Text(
                    'Official Use Only',
                    style: kDefualtFontStyleBody(size),
                  ),
                  //vertical space
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  //Account Number
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    focusNode: genAccNumFocus,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_box),
                      labelText: 'Account Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    readOnly: true,
                    controller: guarantorController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Account Number required';
                      } else if (value.length != 13) {
                        return 'Account Number invalid';
                      }
                      return null;
                    },
                  ),
                  //vertical space
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  //Loan terms
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      generateAccNumberButton(),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  //date
                  DateOfApplicationWidgetTextView(),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  //gurantor
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    keyboardType: TextInputType.name,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Guarantor',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: guarantorController,
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

                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  SizedBox(
                    height: size.height * 0.05,
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
    var items = [
      'Weekly',
      'Bi Weekly',
      'Monthly',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          // Initial Value
          value: dropdownvalue,
          hint: Container(
            child: Text('MY Dropdown', style: titleText),
          ),

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            termsOfLoan = newValue!;

            setState(() {
              dropdownvalue = newValue;
            });
          },
        ),
      ],
    );
  }

  Column loanClientsDropdown() {
    // List of items in our dropdown menu
    var items = [
      'None',
      'User 1',
      'User 2',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          // Initial Value
          value: userdropdownvalue,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            nameOfApplicant = newValue!;

            setState(() {
              userdropdownvalue = newValue;
            });
          },
        ),
      ],
    );
  }

  // Login Button
  Widget submitButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
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
            mNameOfApplicant = nameOfApplicant;
            mAmount = int.parse(amountController.text);
            mRate = double.parse(rateController.text);
            mTerms = termsOfLoan;
            mDuration = int.parse(durationController.text);
            mFirstRepaymentDate = firstRepaymentDateController.text;
            mDate = dateController.text;
            mGuarantor = guarantorController.text;

            int years = 0;
            //Interest is billed yearly
            if (mDuration <= 12) {
              years = 1;
            } else if (mDuration <= 24) {
              years = 2;
            } else if (mDuration <= 36) {
              years = 3;
            } else if (mDuration <= 48) {
              years = 4;
            } else if (mDuration <= 60) {
              years = 5;
            } else if (mDuration <= 72) {
              years = 6;
            }

            interest = (mAmount * years * mRate) / 100;
            interestPlusPrincipal = interest + mAmount;
            double repayments = 0.0;
            int numOfTimesRepay = 0;

            switch (termsOfLoan) {
              case 'Weekly':
                //Number of weeks in months entered
                numOfTimesRepay = mDuration * 4;
                //Amount to pay weekly.
                repayments = interestPlusPrincipal / numOfTimesRepay;
                //Clean list
                repaymentDates.clear();
                print('number of weeks: $numOfTimesRepay');
                //Get the repayment dates
                for (int i = 0; i < numOfTimesRepay; i++) {
                  var nextrepdate = nextRepaymentDate(myFirstRepDate, 7 * i, 0);
                  repaymentDates.add(nextrepdate);
                  print('${repaymentDates[i]}');
                }
                break;
              case 'Bi Weekly':
                //Number of weeks in months entered
                numOfTimesRepay = mDuration * 2;
                //Amount to pay Bi Weekly.
                repayments = interestPlusPrincipal / numOfTimesRepay;
                //Clean existing list
                repaymentDates.clear();
                print('number of Bi-weeks: $numOfTimesRepay');
                //Get the repayment dates
                for (int i = 0; i < numOfTimesRepay; i++) {
                  var nextrepdate =
                      nextRepaymentDate(myFirstRepDate, 14 * i, 0);
                  repaymentDates.add(nextrepdate);
                  print('${repaymentDates[i]}');
                }
                break;
              case 'Monthly':
                //Number of weeks in months entered
                numOfTimesRepay = mDuration * 1;
                //Amount to pay Bi monthly.
                repayments = interestPlusPrincipal / numOfTimesRepay;
                //Clean existing list
                repaymentDates.clear();
                print('number of Months: $numOfTimesRepay');
                //Get the repayment dates
                for (int i = 0; i < mDuration; i++) {
                  var nextrepdate = nextRepaymentDate(myFirstRepDate, 0, i);
                  repaymentDates.add(nextrepdate);
                  print('${repaymentDates[i]}');
                }
                break;
              default:
            }

            print('Name: $mNameOfApplicant');
            print('Principal: $mAmount');
            print('Rate: $mRate');
            print('Loan Terms: $mTerms');
            print('Duration $mDuration');
            print('First Repayment: $mFirstRepaymentDate');
            print('Date $mDate');
            print('Guarantor $mGuarantor');
            print('Number or repayment times: $numOfTimesRepay');
            print('Loan terms: $termsOfLoan');
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
              'Submit Request',
              style: kDefualtFontStyleBody(size),
            ),
          ],
        ),
      ),
    );
  }

  Widget generateAccNumberButton() {
    return SizedBox(
      //width: 30,
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
          genAccNumFocus.requestFocus();
          //0 show progress indicator
          //1 Get last acc number
          //2. Increase by 1
          //3. Display new Acc num
          //4. Dismiss progress indicator
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              'Generate Account Number',
              style: kDefualtFontStyleBody(size * 0.8),
            ),
          ],
        ),
      ),
    );
  }

  Container FirstRepaymtDateWidgetTextView() {
    return Container(
      child: TextFormField(
        controller:
            firstRepaymentDateController, //editing controller of this TextField4

        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.calendar_today), //icon of text field
          labelText: "First Repayment Date", //label text of field
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
            myFirstRepDate = pickedDate;

            nextRepaymentDate(pickedDate, 0, 2);

            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

            setState(() {
              firstRepaymentDateController.text =
                  formattedDate; //set output date to TextField value.
            });
          } else {
            //Date is not selected"
          }
        },
      ),
    );
  }

  Container DateOfApplicationWidgetTextView() {
    return Container(
      child: TextFormField(
        controller: dateController, //editing controller of this TextField4

        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.calendar_today), //icon of text field
          labelText: "Date of Loan Application", //label text of field
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

  nextRepaymentDate(DateTime pickedDate, int days, int months) {
    //From stackoverflow
    DateTime desiredDate = DateTime(
      pickedDate.year,
      pickedDate.month + months,
      pickedDate.day + days,
    );
    String formattedDate = DateFormat('yyyy-MM-dd').format(desiredDate);
    return formattedDate;
  }
}
