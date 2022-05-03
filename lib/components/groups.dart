import 'package:flutter/material.dart';

class Group{
  String title;
  Group({ this.title});
}

class Groupslist extends StatelessWidget {

  final groups = <Group>[
    Group(title: 'ПРИ-311'),
    Group(title: 'ПРИ-312 гавно'),
    Group(title: 'ПРИ-321'),
    Group(title: 'ПРИ-331'),
    Group(title: 'ПРИ-341'),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, i){
                return Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical:4),
                    child: Container(
                        decoration: BoxDecoration(color: Color.fromRGBO(30, 30, 30, 1)),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Text(groups[i].title, style: TextStyle(color: Theme.of(context).textTheme.subtitle1.color, fontWeight: FontWeight.bold)),
                          trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).textTheme.subtitle1.color),
                        )
                    )
                );   //карточка групп(ы)
              }
          )
      ),
    );
  }
}