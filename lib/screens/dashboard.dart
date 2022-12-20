import 'package:flutter/material.dart';
import 'package:loanapp/screens/container_loanclient.dart';
import 'package:loanapp/screens/views/login_view.dart';
import 'package:loanapp/theme.dart';
import 'package:get/get.dart';
import 'package:loanapp/controller/simple_ui_controller.dart';
import 'package:lottie/lottie.dart';

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
    {'group': '1 Jan 2022', 'name': 'Evans'},
    {'group': '1 Jan 2022', 'name': 'Evans'},
    {'group': '1 Jan 2022', 'name': 'Evans'},
    {'group': '1 Jan 2022', 'name': 'Evans'},
    {'group': '4 Jan 2022', 'name': 'Evans'},
    {'group': '4 Jan 2022', 'name': 'Evans'},
    {'group': '4 Jan 2022', 'name': 'Evans'},
    {'group': '9 Jan 2022', 'name': 'Evans'},
    {'group': '9 Jan 2022', 'name': 'Evans'},
    {'group': '9 Jan 2022', 'name': 'Evans'},
    {'group': '9 Jan 2022', 'name': 'Evans'},
    {'group': '9 Jan 2022', 'name': 'Evans'},
    {'group': '9 Jan 2022', 'name': 'Evans'},
    {'group': '9 Jan 2022', 'name': 'Evans'},
    {'group': '9 Jan 2022', 'name': 'Evans'},
    {'group': '27 June 2022', 'name': 'Evans'},
    {'group': '27 June 2022', 'name': 'Evans'},
    {'group': '27 June 2022', 'name': 'Evans'},
    {'group': '27 June 2022', 'name': 'Evans'},
    {'group': '16 Aug 2022', 'name': 'Evans'},
    {'group': '16 Aug 2022', 'name': 'Evans'},
    {'group': '16 Aug 2022', 'name': 'Evans'},
    {'group': '16 Sep 2022', 'name': 'Evans'},
    {'group': '6 Dec 2022', 'name': 'Evans'},
    {'group': '8 Dec 2022', 'name': 'Evans'},
  ];

  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  String? termsOfLoan = "Weekly"; //Values are: Weekly, Bi Weekly, Monthly
  TextEditingController durationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Weekly';
  var size;
  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  int mAmount = 0;
  double mRate = 0;
  String? mTerms;
  int mDuration = 0;
  int numOfTimes = 0;

  //
  double repayment = 0;
  double interest = 0;
  double interestPlusPrincipal = 0;
  bool showCalculatorScreen = false;

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    rateController.dispose();
    termsOfLoan = "Weekly"; //Default value
    durationController.dispose();
    showCalculatorScreen = false;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.power_settings_new),
                tooltip: 'Log out',
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                },
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoanClientsContainer()));
        },
        label: const Text('Add Loan'),
        icon: const Icon(Icons.add),
        backgroundColor: kcolormix,
        heroTag: null,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
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
                                                overflow: TextOverflow.ellipsis,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: Icon(
                                              Icons.arrow_circle_down_outlined,
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 900) {
                      return _buildLargeScreen(size, simpleUIController);
                    } else {
                      return _buildSmallScreen(size, simpleUIController);
                    }
                  },
                ),
              ),
            ],
          ),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //vertical space
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  //Loan details
                  Text(
                    'Loan Calculator',
                    style: kDefualtFontStyleBody(size),
                  ),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.02,
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

                  //rate
                  TextFormField(
                    style: kTextFormFieldStyle(),
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
                        'Repayment Terms',
                        style: kDefualtFontStyleBody(size * 0.8),
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
                    height: size.height * 0.03,
                  ),

                  /// Login Button
                  submitButton(),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  showCalculatorScreen
                      ? CalculatorScreenView()
                      : SizedBox(
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
            termsOfLoan = newValue;

            setState(() {
              dropdownvalue = newValue!;
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
            mAmount = int.parse(amountController.text);
            mRate = double.parse(rateController.text);
            mTerms = termsOfLoan;
            mDuration = int.parse(durationController.text);
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
                numOfTimesRepay = mDuration * 4;
                repayments = interestPlusPrincipal / numOfTimesRepay;
                break;
              case 'Bi Weekly':
                numOfTimesRepay = mDuration * 2;
                repayments = interestPlusPrincipal / numOfTimesRepay;
                break;
              case 'Monthly':
                numOfTimesRepay = mDuration * 1;
                repayments = interestPlusPrincipal / numOfTimesRepay;
                break;
              default:
            }

            setState(() {
              //show calculator screen
              showCalculatorScreen = true;

              mAmount = int.parse(amountController.text);
              mRate = double.parse(rateController.text);
              mTerms = termsOfLoan;
              mDuration = int.parse(durationController.text);
              repayment = repayments;
              //num of times
              numOfTimes = numOfTimesRepay;
              //terms
              mTerms = termsOfLoan;
            });

            print("success");

            print(mAmount);
            print(mRate.toString());
            print(mTerms);
            print(mDuration.toString());
          } else {
            print("Failed");
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const Icon(Icons.email),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Calculate',
              style: kDefualtFontStyleBody(size),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox CalculatorScreenView() {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 210,
        width: MediaQuery.of(context).size.width,
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
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Loan Terms: ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      'Principal: ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      'Duration: ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      'Rate: ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      'Repayments: ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      'Number of times: ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$mTerms ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      '$mAmount ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      '$mDuration Months',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      '$mRate ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      '$repayment ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                    Text(
                      '$numOfTimes ',
                      style: kBankStatementFont(size * 0.8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
