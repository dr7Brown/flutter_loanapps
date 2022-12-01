import 'package:loanapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/widgets/radio.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({super.key});

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Full Name', false, const Icon(Icons.person_outlined)),
        //ID type //radio
        const RadioBtn(),
        buildInputForm('ID Number', false, const Icon(Icons.confirmation_number)),
        buildInputForm('Phone', false, const Icon(Icons.phone_in_talk_outlined)),
        //Marital status //dropdown   //Single/ married/ divorced/ other
        buildInputForm('Address', false, const Icon(Icons.add_home_work_sharp)),
        //Gender //checkbox         //male/female
        const SizedBox(
          height: 10,
        ),
        Text(
          'Loan Details',
          style: subTitle.copyWith(fontWeight: FontWeight.w600),
          //textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 10,
        ),
        //Loan details
        buildInputForm('Loan Amount', false, const Icon(Icons.countertops)),
        buildInputForm('Rate', false, const Icon(Icons.rate_review_rounded)),
        buildInputForm('Duration', false, const Icon(Icons.timelapse)), //months only
        //Repayment Terms //dropdown
        Row(
          children: [
            Text(
              'Loan Terms',
              style: subTitle.copyWith(fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              width: 20,
            ),
            myDropdown(),
          ],
        )
      ],
    );
  }

  Padding buildInputForm(String label, bool pass, Icon prefix_ic) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            prefixIcon: prefix_ic,
            labelText: label,
            labelStyle: const TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? const Icon(
                            Icons.visibility_off,
                            color: kTextFieldColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ),
                  )
                : null),
      ),
    );
  }

  // Initial Selected Value
  String dropdownvalue = 'Weekly';

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
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        ),
      ],
    );
  }
}
