import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers/components/custom_button.dart';
import 'package:shoppers/components/custom_text_input.dart';
import 'package:shoppers/utils/application_state.dart';
import 'package:shoppers/utils/common.dart';
import 'package:shoppers/utils/custom_theme.dart';
import 'package:shoppers/utils/login_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoadingButton = false;

  Map<String, String> data = {};

  _LoginScreenState() {
    data = LoginData.signIn;
  }

  void switchLogin() {
    setState(() {
      if (mapEquals(data, LoginData.signUp)) {
        data = LoginData.signIn;
      } else {
        data = LoginData.signUp;
      }
    });
  }

  loginError(FirebaseException e) {
    if(e.message != "") {
      setState(() {
        _isLoadingButton = false;
      });

      CommonUtil.showAlert(context, "Error processing your request", e.message.toString());
    }
  }

  void loginButtonPressed() {
    setState(() {
      _isLoadingButton = true;
    });

    ApplicationState applicationState = Provider.of<ApplicationState>(context, listen: false);
    if(mapEquals(data, LoginData.signUp)) {
      applicationState.signUp(_emailController.text, _passwordController.text, loginError);
    } else {
      applicationState.signIn(_emailController.text, _passwordController.text, loginError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      data["heading"] as String,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Text(
                    data["subHeading"] as String,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            model(data, _emailController, _passwordController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: switchLogin,
                    child: Text(
                      data["footer"] as String,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  model(Map<String, String> data, TextEditingController emailController, TextEditingController passwordController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 56),
      decoration: CustomTheme.getCardDecoration(),
      child: Column(
        children: [
          CustomTextInput(
            label: "Your email address",
            placeHolder: "email@address.com",
            icon: Icons.person_outline,
            textEditingController: _emailController,
          ),
          CustomTextInput(
            label: "Your password",
            placeHolder: "password",
            icon: Icons.lock_outlined,
            isPassword: true,
            textEditingController: _passwordController,
          ),
          CustomButton(
            text: data["label"] as String,
            onPress: loginButtonPressed,
            isLoading: _isLoadingButton,
          ),
        ],
      ),
    );
  }
}
