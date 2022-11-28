import 'package:flutter/material.dart';

import '../theme.dart';

class rbtnGender extends StatefulWidget {
  const rbtnGender({super.key});

  @override
  State<rbtnGender> createState() => _rbtnGenderState();
}

class _rbtnGenderState extends State<rbtnGender> {
  int _groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Gender',
          style: subTitle.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: _myRadioButton(
            title: "Male",
            value: 0,
            //onChanged: (newValue) => setState(() => _groupValue = newValue),
          ),
        ),
        Expanded(
          flex: 1,
          child: _myRadioButton(
            title: "Female",
            value: 1,
            //onChanged: (newValue) => setState(() => _groupValue = newValue),
          ),
        ),
      ],
    );
  }

  Widget _myRadioButton({
    required String title,
    required int value,
    //required Function onChanged
  }) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: (newValue) => setState(() => {
            _groupValue = newValue!,
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(newValue.toString()))),
          }),
      title: Text(title),
    );
  }
}
