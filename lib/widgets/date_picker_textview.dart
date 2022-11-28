import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerTextView extends StatefulWidget {
  const DatePickerTextView({super.key});

  @override
  State<DatePickerTextView> createState() => _DatePickerTextViewState();
}

class _DatePickerTextViewState extends State<DatePickerTextView> {
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
    return Container(
      child: TextFormField(
        controller: dateinput, //editing controller of this TextField4

        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.calendar_today), //icon of text field
            labelText: "Date yyyy/mm/dd" //label text of field
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
              dateinput.text =
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
