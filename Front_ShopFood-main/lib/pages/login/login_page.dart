import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/api/api_shop.dart';

import '../../widget/decorate/backgroundLogin.dart';
import '../../widget/text_field_custom.dart';
import '../../widget/text_field_password.dart';
import '../Home/home_page.dart';
import '../Register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final tabs = [
    const HomePage(),
  ];
  void _incrementCounter() {
    setState(() {
      _usernameController.text = "";
      _passwordController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: BackgroundLogin(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldCustom(
                    controller: _usernameController,
                    hint: 'Enter Username',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldPassword(
                    controller: _passwordController,
                    hint: 'Enter Password',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _Mylogin,
                          child: Text("Login"),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _MySignIn,
                          child: Text("Sign Up"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _Mylogin() async {
    bool isVerify = await ApiCustomer.veifyCustomer(
        _usernameController.text, _passwordController.text);
    if (isVerify) {
      print("Success");
      Get.to(const HomePage());
    } else {
      print("Not True Verify");
    }
  }

  void _MySignIn() {
    Get.to(const RegisterPage());
  }
}
