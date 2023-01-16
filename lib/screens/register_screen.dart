import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/input.dart';
import '../utilities/constants.dart';
import '../components/Button.dart';
import '../firebase/auth_methods.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const id = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Uint8List? _image;
  bool isloading = false;

  void selectimage() async {
    final image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
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
        alignment: Alignment.center,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'dash',
              child: GestureDetector(
                  onTap: () {
                    selectimage();
                  },
                  child: _image != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 50,
                          backgroundColor: kPrimaryColor,
                        )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Register",
              textAlign: TextAlign.start,
              style: kPrimaryHeading1TextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Welcome to FlashChat',
              style: kPrimaryHeading3TextStyle,
            ),
            const SizedBox(
              height: 33,
            ),
            Input(
              controller: _fName,
              placeholder: 'First Name',
            ),
            const SizedBox(
              height: 15,
            ),
            Input(
              controller: _lName,
              placeholder: 'Last Name',
            ),
            const SizedBox(
              height: 15,
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
                label: isloading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'REGUSTER NOW',
                        style: kButtonLabel,
                      ),
                onPress: () async {
                  setState(() {
                    isloading = true;
                  });
                  final Authmethods auth = Authmethods();
                  final user = await auth.SignupUser(
                      email: _email.text,
                      password: _password.text,
                      fName: _fName.text,
                      lName: _lName.text,
                      file: _image);
                  if (user != 'success') {
                    setState(() {
                      isloading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text(user),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text('User Successfully SignUp'),
                    ));
                  }
                  setState(() {
                    isloading = false;
                  });
                })
          ],
        ),
      ),
    );
  }
}
