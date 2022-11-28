import 'dart:html';

import 'package:loanapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRepaymentForm extends StatefulWidget {
  @override
  State<AddRepaymentForm> createState() => _AddRepaymentFormState();
}

class _AddRepaymentFormState extends State<AddRepaymentForm> {
  //***********Date picker data ******8/
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = "${DateTime.now().toLocal()}"
        .split(' ')[0]; //set the initial value of text field
    super.initState();
  }
  //***************End of Date picker data */

  DateTime selectedDate = DateTime.now();
  String dropdownvalue = 'Joseph Annor';

  //Dammy data
  String mPaid = '2000.00';
  String mBalance = '2000.00';
  String mMonthly = '2000.00';
  String mTotal = '2000.00';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //width: MediaQuery.of(context).size.width * 0.8,
        //alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kOffWhitcolor,
              ),
              child: Column(
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
                                color: kDarkGreyColor,
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
                      ], /////////////////wooorking here
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
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
                  buildInputForm('Amount', 'Enter amount', '',
                      const Icon(Icons.phone_in_talk_outlined)),

                  //******************DAte picker files */
                  TextFormField(
                    controller:
                        dateinput, //editing controller of this TextField4

                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Date yyyy/mm/dd" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  //********************End of date picker files */
                ],
              ),
            ),

            //Loan Tenure widgets
            const SizedBox(
              height: 20.0,
            ),
            //Submit button
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: kAmberColor),
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  'Submit',
                  style: textButton.copyWith(color: kWhiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildInputForm(
      String label, String hintText, String initialText, Icon prefixIc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        initialValue: initialText,
        decoration: InputDecoration(
          icon: prefixIc,
          labelText: label,
          labelStyle: const TextStyle(
            color: kTextFieldColor,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          hintText: hintText,
          //enabled: false,
        ),
        onTap: () {},
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
          value: dropdownvalue,

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
              dropdownvalue = newValue!;
            });
          },
        ),
      ],
    );
  }
}
