import 'package:loanapp/theme.dart';
import 'package:flutter/material.dart';

class AddExpensesForm extends StatefulWidget {
  @override
  State<AddExpensesForm> createState() => _AddExpensesFormState();
}

class _AddExpensesFormState extends State<AddExpensesForm> {
  DateTime selectedDate = DateTime.now();

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
                  buildInputForm('Purpose', 'Enter Purpose for expense', '',
                      const Icon(Icons.person_outlined)),
                  buildInputForm('Amount', 'Enter amount', '',
                      const Icon(Icons.phone_in_talk_outlined)),
                  buildInputForm(
                      'Date',
                      '',
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
                  borderRadius: BorderRadius.circular(16),
                  color: kAmberColor),
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  'Expenses',
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

}
