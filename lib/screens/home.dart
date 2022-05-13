import 'package:flutter/material.dart';
import 'package:mobooble/components/groups.dart';
import 'package:mobooble/components/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';



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
          title: const Text('Mobooble'),
          leading: const Icon(Icons.man_outlined),
        ),
        body: _currentIndex == 0 ? Groupslist() : Profile() , //проверка на "состояние"
    bottomNavigationBar: SalomonBottomBar(
    currentIndex: _currentIndex,
    onTap: (i) => setState(() => _currentIndex = i),  //при нажатии состояние меняется от 0 до 1
    items: [
    /// Home
    SalomonBottomBarItem(
    icon: Icon(Icons.home),
    title: Text("Группы"),
    unselectedColor: Colors.white,
    selectedColor: Colors.purple,
    ),


    /// Profile
    SalomonBottomBarItem(
    icon: Icon(Icons.person),
    title: Text("Профиль"),
    unselectedColor: Colors.white,
    selectedColor: Colors.teal,
    ),
    ],)

      ),
    );

  }
}
