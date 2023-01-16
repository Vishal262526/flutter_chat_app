import 'package:chat_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../components/Button.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: 'dash',
              child: Icon(
                Icons.chat,
                size: 80,
                color: Color(0xFFA555EC),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              " FlashChat",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFFA555EC)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              " Welcoe to FlashChat",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFD09CFA),
              ),
            ),
            const SizedBox(
              height: 77,
            ),
            Button(
              color: kWhite,
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              label: const Text(
                "LOGIN",
                style: kButtonLabel,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              color: kWhite,
              onPress: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              label: const Text(
                'Register Now',
                style: kButtonLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
