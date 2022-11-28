import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/container_navigation.dart';
import 'package:loanapp/controller/simple_ui_controller.dart';
import 'package:loanapp/theme.dart';
import 'package:loanapp/widgets/date_picker_textview.dart';
import 'package:loanapp/widgets/radio_gender.dart';
import 'package:loanapp/widgets/radio_id_type.dart';
import 'package:lottie/lottie.dart';

class LoanApplicationScreen extends StatefulWidget {
  const LoanApplicationScreen({super.key});

  @override
  State<LoanApplicationScreen> createState() => _LoanApplicationScreenState();
}

class _LoanApplicationScreenState extends State<LoanApplicationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController idTypeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termsController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController guarantorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    genderController.dispose();
    phoneController.dispose();
    idController.dispose();
    idTypeController.dispose();
    addressController.dispose();
    amountController.dispose();
    rateController.dispose();
    termsController.dispose();
    durationController.dispose();
    dateController.dispose();
    guarantorController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 4,
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
            flex: 5,
            child: _buildMainBody(
              size,
              simpleUIController,
            ),
          ),
        ],
      ),
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Column(
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
          flex: 7,
          child: _buildMainBody(
            size,
            simpleUIController,
          ),
        ),
      ],
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Column(
      children: [
        //Delete expanded widg
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.amber,
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Personal Details',
            style: kDefualtFontStyle(size),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Full name
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Full Name',
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
                  height: size.height * 0.02,
                ),

                //Gender
                const rbtnGender(),

                //Phone
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Phone Number',
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

                //id
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'ID Number',
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
                const rbtnIdType(),

                //Loan details
                Text(
                  'Loan Details',
                  style: subTitle.copyWith(fontWeight: FontWeight.w600),
                ),

                //amount
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Loan Amount',
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

                //rate
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Interest Rate',
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

                //terms
                myDropdown('Weekly'),

                // duration
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Durations',
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

                //date
                const DatePickerTextView(),

                //gurantor
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Guarantor',
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
                Text(
                  'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                  style: kLoginTermsAndPrivacyStyle(size),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// Login Button
                submitButton(),

                SizedBox(
                  height: size.height * 0.03,
                ),

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
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Initial Selected Value
  //String dropdownvalue = 'Weekly';

  Column myDropdown(String dropdownvalue) {
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
            // ... Navigate To your Home Page
            Navigator.push(context,
                CupertinoPageRoute(builder: (ctx) => const ContainerMainNav()));
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
