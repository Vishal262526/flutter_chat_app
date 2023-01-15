import 'package:chat_app/components/Button.dart';
import 'package:chat_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../components/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Hero(
                tag: 'dash',
                child: Icon(
                  Icons.chat,
                  size: 100,
                  color: Color(0xFFA555EC),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Log In",
                textAlign: TextAlign.start,
                style: kPrimaryHeading1TextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Login to Continue',
                style: kPrimaryHeading3TextStyle,
              ),
              const SizedBox(
                height: 33,
              ),
              Input(
                controller: _email,
                placeholder: 'Email or Phone',
              ),
              const SizedBox(
                height: 15,
              ),
              Input(
                controller: _password,
                placeholder: 'Password',
              ),
              const SizedBox(
                height: 33,
              ),
              Button(
                  color: kWhite,
                  label: 'Log In',
                  onPress: () {
                    print(_email.text);
                    print(_password.text);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
