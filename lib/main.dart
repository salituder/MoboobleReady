import 'dart:ui';

import 'package:mobooble/domain/user.dart';
import 'package:mobooble/screens/landing.dart';
import 'package:flutter/material.dart';
import 'package:mobooble/services/auth.dart';
import 'package:provider/provider.dart';


void main() => runApp(MoboobleApp());

class MoboobleApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Mobooble',
        theme: ThemeData(
            //primaryColor: Color.fromRGBO(24, 23, 28, 1),
            //primaryColor: Color.fromRGBO(24, 23, 28, 1),
            primaryColor: Color.fromRGBO(10, 10, 10, 1),
          textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white))
        ),
        home: LandingPage() //ссылка на класс, который выполняет проверку на авторизацию
      ),
    );
  }
}
