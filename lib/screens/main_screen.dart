import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreenArgs {
  final String emailAddress;
  final String password;

  MainScreenArgs(this.emailAddress, this.password);
}

class MainScreen extends StatelessWidget {
  static const routeName = "/main";

  @override
  Widget build(BuildContext context) {
    final MainScreenArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Padding(
        padding: containerPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            verticalSeparator(),
            buildSubheader("With email:"),
            buildContentItem(args.emailAddress),
            verticalSeparator(),
            buildSubheader("With password:"),
            buildContentItem(args.password),
          ],
        ),
      ),
    );
  }

  EdgeInsets containerPadding() => const EdgeInsets.symmetric(horizontal: 26.0, vertical: 64.0);

  Text buildHeader() {
    return Text(
      "Successful login",
      style: buildHeaderStyle(),
    );
  }

  TextStyle buildHeaderStyle() => TextStyle(fontSize: 38, color: Colors.black, fontWeight: FontWeight.bold);

  Text buildSubheader(String text) {
    return Text(
      text,
      style: buildSubheaderStyle(),
    );
  }

  TextStyle buildSubheaderStyle() =>
      TextStyle(fontSize: 24, color: Colors.black87, fontWeight: FontWeight.bold);

  Padding buildContentItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.black45, fontWeight: FontWeight.bold),
      ),
    );
  }

  SizedBox verticalSeparator() {
    return SizedBox(
      height: 24,
    );
  }
}
