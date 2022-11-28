import 'package:flutter/material.dart';

import '../theme.dart';

class rbtnIdType extends StatefulWidget {
  const rbtnIdType({super.key});

  @override
  State<rbtnIdType> createState() => _rbtnIdTypeState();
}

class _rbtnIdTypeState extends State<rbtnIdType> {
  int _groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Id Type',
          style: subTitle.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: _myRadioButton(
            title: "Voter",
            value: 0,
            //onChanged: (newValue) => setState(() => _groupValue = newValue),
          ),
        ),
        Expanded(
          flex: 1,
          child: _myRadioButton(
            title: "Ghana Card",
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
