import 'package:flutter/material.dart';
import 'package:loanapp/screens/login/login_screen.dart';
import 'package:loanapp/theme.dart';
import 'package:loanapp/widgets/checkbox.dart';
import 'package:loanapp/widgets/primary_button.dart';
import 'package:loanapp/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kcolormix,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/login2.png"), fit: BoxFit.cover),
            ),
            child: Center(
                child: Container(
              padding: kDefaultPadding,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: kOffWhitcolor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: kDefaultPadding,
                      child: Text(
                        'Create Account',
                        style: titleText,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: kDefaultPadding,
                      child: Row(
                        children: [
                          Text(
                            'Already a member?',
                            style: subTitle,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'Log In',
                              style: textButton.copyWith(
                                decoration: TextDecoration.underline,
                                decorationThickness: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: kDefaultPadding,
                      child: SignUpForm(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: kDefaultPadding,
                      child: CheckBox('Agree to terms and conditions.'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: kDefaultPadding,
                      child: CheckBox('I have at least 18 years old.'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: kDefaultPadding,
                      child: PrimaryButton(buttonText: 'Sign Up'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: kDefaultPadding,
                      child: Text(
                        'Or log in with:',
                        style: subTitle.copyWith(color: kBlackColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ))));
  }
}
