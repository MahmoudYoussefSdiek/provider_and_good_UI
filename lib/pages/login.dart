import 'package:ecommerce_app/pages/register.dart';
import 'package:ecommerce_app/shared/colors.dart';
import 'package:flutter/material.dart';

import '../shared/custom_textfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                const MyTextField(
                  hinttext: 'Enter Your Email',
                  isPassword: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                const MyTextField(
                  hinttext: 'Enter your Password',
                  textInputType: TextInputType.text,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(btnGreen),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(12),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do not have an account ? ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      child: const Text(
                        'sign up ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
