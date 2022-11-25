import 'package:loanapp/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'package:loanapp/widgets/primary_button.dart';

class AddDepositeForm extends StatefulWidget {
  @override
  State<AddDepositeForm> createState() => _AddDepositeFormState();
}

class _AddDepositeFormState extends State<AddDepositeForm> {
  DateTime selectedDate = DateTime.now();

/*
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kOffWhitcolor,
              ),
              child: Column(
                children: [
                  buildInputForm('Full Name', 'Enter your name here', '',
                      const Icon(Icons.person_outlined)),
                  buildInputForm('Amount', 'Enter amount', '',
                      const Icon(Icons.phone_in_talk_outlined)),
                  buildInputForm(
                      'Date',
                      'Click to change date',
                      "${selectedDate.toLocal()}".split(' ')[0],
                      const Icon(Icons.add_home_work_sharp)),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            //Submit button
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: kcolormix),
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  'Deposit',
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
          prefixIcon: prefixIc,
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
/*
  TextButton buildButton(buttonText, Future function) {
    Alignment.center;
    MediaQuery.of(context).size.height * 0.08;
    double.infinity;
    BoxDecoration(
        borderRadius: BorderRadius.circular(16), color: kPrimaryColor);

    return TextButton(
      child: Text(
        buttonText,
        style: textButton.copyWith(color: kSecondaryColor),
      ),
      onPressed: () => function,
    );
  }

  AddButtonPressed() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('This is a snackbar')));
  }
  */
}
