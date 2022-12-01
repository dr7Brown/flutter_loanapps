import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loanapp/controller/simple_ui_controller.dart';
import 'package:loanapp/theme.dart';
import 'package:lottie/lottie.dart';

class LoanApplicationScreen extends StatefulWidget {
  const LoanApplicationScreen({super.key});

  @override
  State<LoanApplicationScreen> createState() => _LoanApplicationScreenState();
}

class _LoanApplicationScreenState extends State<LoanApplicationScreen> {
  TextEditingController nameController = TextEditingController();
  String gender = "Male"; //Values are Male, Female
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  String idType = "Voter"; //Values are: Voter, Ghana Card
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  String? termsOfLoan = "Weekly"; //Values are: Weekly, Bi Weekly, Monthly
  TextEditingController durationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController guarantorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? mName;
  String? mGender;
  String? mPhone;
  String? mId;
  String? mIdType;
  String? mAddress;
  int? mAmount;
  double? mRate;
  String? mTerms;
  int? mDuration;
  String? mDate;
  String? mGuarantor;

  @override
  void initState() {
    super.initState();

    dateController.text = "${DateTime.now().toLocal()}".split(' ')[0];

    nameController.addListener(() {
      // print('${nameController.text}');
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    gender = "Male"; //Default
    phoneController.dispose();
    idController.dispose();
    idType = "Voter"; //Default
    addressController.dispose();
    amountController.dispose();
    rateController.dispose();
    termsOfLoan = "Weekly"; //Default value
    durationController.dispose();
    dateController.dispose();
    guarantorController.dispose();
    super.dispose();
  }

  // Initial Selected Value
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
        appBar: AppBar(
          title: const Text('Loan Form'),
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

                  /// Full name
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      // hintText: 'Full Name',
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: nameController,
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

                  //Gender
                  radioBtnGender(),

                  //Phone
                  TextFormField(
                    keyboardType: TextInputType.phone,

                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      // hintText: 'Phone Number',
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: phoneController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone number';
                      } else if (value.length < 10) {
                        return 'Invalid Phone Number';
                      } else if (value.length > 14) {
                        return 'Invalid Phone Number';
                      }
                      return null;
                    },
                  ),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  //id
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_box),
                      // hintText: 'ID Number',
                      labelText: "ID Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: idController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter ID Number';
                      } else if (value.length < 6) {
                        return 'Number Invalid';
                      } else if (value.length > 13) {
                        return 'Number Invalid';
                      }
                      return null;
                    },
                  ),

                  //id type
                  radioBtnID(),

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
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      labelText: 'Durations',
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
                    height: size.height * 0.10,
                  ),

                  //Loan details++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  Text(
                    'Office Use Only',
                    style: kDefualtFontStyleBody(size),
                  ),
                  //vertical space
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  //date
                  DateWidgetTextView(),

                  //vertical space
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  //gurantor
                  TextFormField(
                    style: kTextFormFieldStyle(),
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

                  /*
                  /// Navigate To Login Screen
                  GestureDetector(
                    onTap: () {
                      //Navigator.push(
                      //  context,
                      //CupertinoPageRoute(
                      //    builder: (ctx) => const SignUpView()));
                      Navigator.pop(context);
                      //Clear controllers
                      nameController.clear();
                      genderController.clear();
                      phoneController.clear();
                      idController.clear();
                      idTypeController.clear();
                      addressController.clear();
                      amountController.clear();
                      rateController.clear();
                      termsController.clear();
                      durationController.clear();
                      dateController.clear();
                      guarantorController.clear();

                      _formKey.currentState?.reset();
                      simpleUIController.isObscure.value = true;
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: kHaveAnAccountStyle(size),
                        children: [
                          TextSpan(
                            text: " Sign up",
                            style: kLoginOrSignUpTextStyle(
                              size,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Initial Selected Value
  //String dropdownvalue = 'Weekly';

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
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
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
            mName = nameController.text;
            mGender = gender;
            mPhone = phoneController.text;
            mId = idController.text;
            mIdType = idType;
            mAddress = addressController.text;
            mAmount = int.parse(amountController.text);
            mRate = double.parse(rateController.text);
            mTerms = termsOfLoan;
            mDuration = int.parse(durationController.text);
            mDate = dateController.text;
            mGuarantor = guarantorController.text;

            print("success");
            print(mName);
            print(mGender);
            print(mPhone);
            print(mId);
            print(mIdType);
            print(mAddress);
            print(mAmount);
            print(mRate.toString());
            print(mTerms);
            print(mDuration.toString());
            print(mDate);
            print(mGuarantor);
          } else {
            print("Failed");
          }

          // ... Navigate To your Home Page
          /*         Navigator.push(context,
              CupertinoPageRoute(builder: (ctx) => const ContainerMainNav()));
*/
          //Or pop up parent screen
          //Navigator.pop(context);
          // }
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

//Gender Radio Gender
  int _groupValue = 0;
  radioBtnGender() {
    return Row(
      children: <Widget>[
        Text(
          'Gender',
          style: kDefualtFontStyleBody(size),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: _genderRadioButton(
            title: "Male",
            value: 0,
            //onChanged: (newValue) => setState(() => _groupValue = newValue),
          ),
        ),
        Expanded(
          flex: 1,
          child: _genderRadioButton(
            title: "Female",
            value: 1,
            //onChanged: (newValue) => setState(() => _groupValue = newValue),
          ),
        ),
      ],
    );
  }

  //Gender Radio Button Widget
  Widget _genderRadioButton({
    required String title,
    required int value,
    //required Function onChanged
  }) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: (newValue) => setState(() => {
            _groupValue = newValue!,
            if (newValue == 0)
              {
                gender = "Male",
              }
            else
              gender = "Female",
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(gender))),
          }),
      title: Text(title),
    );
  }

  //Id Radio ID type
  int _groupValueID = 0;
  radioBtnID() {
    return Row(
      children: <Widget>[
        Text(
          'ID Type',
          style: kDefualtFontStyleBody(size),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: _idRadioButton(
            title: "Voter",
            value: 0,
            //onChanged: (newValue) => setState(() => _groupValue = newValue),
          ),
        ),
        Expanded(
          flex: 1,
          child: _idRadioButton(
            title: "Ghana Card",
            value: 1,
            //onChanged: (newValue) => setState(() => _groupValue = newValue),
          ),
        ),
      ],
    );
  }

  //Id Radio Button Widget
  Widget _idRadioButton({
    required String title,
    required int value,
    //required Function onChanged
  }) {
    return RadioListTile(
      value: value,
      groupValue: _groupValueID,
      onChanged: (newValue) => setState(() => {
            _groupValueID = newValue!,
            if (newValue == 0)
              {
                idType = "Voter",
              }
            else
              idType = "Ghana Card",
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(idType))),
          }),
      title: Text(title),
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
}
