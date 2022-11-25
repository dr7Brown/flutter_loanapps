import 'package:flutter/material.dart';
import 'package:loanapp/container_navigation.dart';
import 'package:loanapp/screens/login/login_screen.dart';
import 'package:loanapp/screens/repayment_screen.dart';
import 'package:loanapp/theme.dart';
import 'package:loanapp/widgets/application_form.dart';
import 'package:loanapp/widgets/primary_button.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Form'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
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
              Text(
                'Personal Details',
                style: subTitle.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              ApplicationForm(),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: () {
                    /*
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RepaymentScreen(),
                        ));
                    */
                  },
                  child: PrimaryButton(buttonText: 'Request Loan')),
            ],
          ),
        ),
      ),
    );
  }
}
