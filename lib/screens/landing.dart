import 'package:flutter/material.dart';
import 'package:mobooble/domain/user.dart';
import 'package:mobooble/screens/auth.dart';
import 'package:mobooble/screens/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}