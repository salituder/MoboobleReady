import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobooble/screens/group.dart';

import '../domain/ivan.dart';

class Groupslist extends StatefulWidget {
  @override
  State<Groupslist> createState() => _GroupslistState();
}

class _GroupslistState extends State<Groupslist> {
  final TextEditingController _controller = TextEditingController();

  void _showCreateGroupDialog() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {

          return Padding(
            padding: MediaQuery.of(context).viewInsets,

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Введите название группы..',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      IconButton(

                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            Group grop = Group(_controller.text);
                            DocumentReference newGroup = FirebaseFirestore.instance.collection("Groups").doc(grop.title);
                            FirebaseFirestore.instance.runTransaction((transaction) async {
                              await transaction.set(newGroup, grop.toMap());
                            });
                            Navigator.of(context).pop();
                          }
                        },
                        icon: const Icon(Icons.check),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  inputText(_controller)
                ],
              ),
              decoration: const BoxDecoration(
                color: const Color.fromRGBO(101, 101, 101, 1.0),
              ),
            ),
          );
        });
  }

  Widget inputText(TextEditingController _controller) {
    return TextField(
      style: const TextStyle(color: Colors.black, fontSize: 30),
      controller: _controller,
      decoration: const InputDecoration.collapsed(
          hintText: "Введите название группы..."),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showCreateGroupDialog(),
          label: Text("Добавить группу") ,
        ),
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(10, 10, 10, 1)),
          width: MediaQuery.of(context).size.width * .95,
          height: MediaQuery.of(context).size.height * .95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(

                  stream: FirebaseFirestore.instance
                      .collection("Groups")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('Отсутствуют добавленные группы');
                    } else {

                      List<DocumentSnapshot> items = snapshot.data.docs;
                      List<Group> groups = [];
                      for (int i = 0; i < items.length; i++) {
                        groups.add(Group(Group.fromMap(items[i].data()).title,
                            id: items[i].id));
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: groups.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 5),
                        itemBuilder: (context, index) {

                          return InkWell(

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GroupPage(groups[index]),
                                ),
                              );
                            },
                            child: Container(
                              child: Text(groups[index].title),
                              height: 55,

                              width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Color.fromRGBO(
                                    191, 190, 190, 1.0)),

                            ),
                          );
                        },
                      );
                    }
                  }),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(10, 10, 10, 1),
        // child: ListView.builder(
        //     itemCount: groups.length,
        //     itemBuilder: (context, i){

        //       return Card(
        //           elevation: 2.0,
        //           margin: EdgeInsets.symmetric(horizontal: 8, vertical:4),
        //           child: Container(
        //               decoration: BoxDecoration(color: Color.fromRGBO(30, 30, 30, 1)),
        //               child: ListTile(
        //                 contentPadding: EdgeInsets.symmetric(horizontal: 10),
        //                 title: Text(groups[i].title, style: TextStyle(color: Theme.of(context).textTheme.subtitle1.color, fontWeight: FontWeight.bold)),
        //                 trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).textTheme.subtitle1.color),
        //               )
        //           )
        //       );   //карточка групп(ы)
        //     }
        // )
      ),
    );
  }
}
