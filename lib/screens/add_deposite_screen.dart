import 'package:flutter/material.dart';
import 'package:loanapp/theme.dart';
import 'package:loanapp/widgets/add_deposite_form.dart';

class AddDepositeScreen extends StatelessWidget {
  const AddDepositeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Form'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(0.0),
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              AddDepositeForm(),
              const SizedBox(
                height: 40,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
