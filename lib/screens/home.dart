import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobooble/components/groups.dart';
import 'package:mobooble/components/profile.dart';
import 'package:mobooble/services/auth.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
            backgroundColor: Colors.white12,
          title: Text('Mobooble'),
          leading: Icon(Icons.man_outlined),
          actions: <Widget>[
            FlatButton.icon(onPressed: (){
              AuthService().logOut();
            }, icon: Icon( Icons.arrow_forward, color: Colors.white),
            label: SizedBox.shrink())
          ], //ВЫХОД ИЗ АККАУНТА ЭКШОНС ВИДЖЕТ !!!!!! ПЕРЕМЕСТИТЬ!!!!!!!!
        ),
        body: _currentIndex == 0 ? Groupslist() : Profile() ,
    bottomNavigationBar: SalomonBottomBar(
    currentIndex: _currentIndex,
    onTap: (i) => setState(() => _currentIndex = i),
    items: [
    /// Home
    SalomonBottomBarItem(
    icon: Icon(Icons.home),
    title: Text("Группы"),
    selectedColor: Colors.purple,
    ),


    /// Profile
    SalomonBottomBarItem(
    icon: Icon(Icons.person),
    title: Text("Профиль"),
    selectedColor: Colors.teal,
    ),
    ],)

      ),
    );

  }
}
