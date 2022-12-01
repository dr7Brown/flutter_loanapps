import 'package:flutter/material.dart';

import '../theme.dart';

class RadioBtn extends StatefulWidget {
  const RadioBtn({super.key});

  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  int _groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Gender',
          style: subTitle.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
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
