import 'package:flutter/material.dart';
import 'package:login/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  String _email = "";
  String _password = "";

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buildUsernameTextField(), buildPasswordTextField(), buildLoginButton(context)],
          ),
        ),
      ),
    );
  }

  Padding buildUsernameTextField() {
    return Padding(
      padding: buildFormElementPadding(),
      child: TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "Enter your email address", labelText: "Email"),
          validator: (value) => !value.contains("@") ? "Please enter a valid email address" : null,
          autofillHints: [AutofillHints.username, AutofillHints.email],
          onChanged: (value) {
            setState(() {
              _email = value;
            });
          }),
    );
  }

  Padding buildPasswordTextField() {
    return Padding(
      padding: buildFormElementPadding(),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your password",
            labelText: "Password",
            helperText: "Make sure no one else is looking at the screen",
            suffixIcon: IconButton(
              icon: Icon(_passwordVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: _togglePasswordVisibility,
            )),
        validator: (value) => value.length < 9 ? "Password too short" : null,
        autofillHints: [AutofillHints.password],
        obscureText: !_passwordVisible,
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
      ),
    );
  }

  EdgeInsets buildFormElementPadding() => const EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0);

  Container buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64.0),
        child: OutlineButton(
          child: Text(
            "LOG IN",
          ),
          color: Colors.blueGrey,
          onPressed: () {
            // Handle press
            if (_formKey.currentState.validate()) {
              Navigator.pushNamed(context, MainScreen.routeName,
                  arguments: MainScreenArgs(_email, _password));
            }
          },
        ),
      ),
    );
  }
}
