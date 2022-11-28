import 'package:loanapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpensesForm extends StatefulWidget {
  @override
  State<AddExpensesForm> createState() => _AddExpensesFormState();
}

class _AddExpensesFormState extends State<AddExpensesForm> {
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
                  //******************DAte picker files */
                  TextFormField(
                    controller:
                        dateinput, //editing controller of this TextField4

                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today), //icon of text field
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
                  borderRadius: BorderRadius.circular(16), color: kAmberColor),
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
