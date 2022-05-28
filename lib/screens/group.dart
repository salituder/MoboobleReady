import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../domain/ivan.dart';

class GroupPage extends StatefulWidget {
  GroupPage(this.group);

  Group group;

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  // _getMarks(String name) async {
  //   List<DocumentSnapshot> secondaryData = data.data.docs;
  //   List<Marks> marks = [];
  //   for (int i = 0; i < secondaryData.length; i++) {
  //     Marks mark = Marks.fromMap(secondaryData[i].data());
  //     marks.add(mark);
  //   }
  //   double average = 0.0;
  //   marks.forEach((element) => average + element.mark);
  //   log(average.toString());
  //   return average / marks.length;
  //   // сумма всех элементов разделить на marks.length
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const FloatingActionButton.extended(
          label: Text("Добавить ученика"),
        ),
        backgroundColor: const Color.fromRGBO(83, 83, 83, 1.0),
        body: Container(

          width: MediaQuery.of(context).size.width * .95,
          child: Column(
            children: [

              FutureBuilder(
                /*
                future: Future.wait([FirebaseFirestore.instance
                    .collection("Students")
                    .where('group', isEqualTo: widget.group.title)
                    .get(), FirebaseFirestore.instance.collection("Mark").where('name', is)
                 */
                future: FirebaseFirestore.instance
                    .collection("Students")
                    .where('group', isEqualTo: widget.group.title)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> data = snapshot.data.docs;
                    List<Student> students = [];
                    for (int i = 0; i < data.length; i++) {
                      Student student = Student.fromMap(data[i].data());
                      students.add(
                          Student(student.group, student.name, id: data[i].id));
                    }
                    return ListView.separated(

                        itemCount: students.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          double average = 0.0;

                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('Mark')
                                .where('name', isEqualTo: students[index].name)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<DocumentSnapshot> secondaryData =
                                    snapshot.data.docs;
                                List<Marks> marks = [];
                                for (int i = 0; i < secondaryData.length; i++) {
                                  Marks mark =
                                      Marks.fromMap(secondaryData[i].data());
                                  marks.add(mark);
                                }
                                double average = 0.0;
                                for (var element in marks) {
                                  average += element.mark;
                                }
                                average /= marks.length;
                                return InkWell(

                                  onTap: () {
                                  },
                                  child: Container(
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width * .95,

                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(students[index].name, textScaleFactor: 2,),
                                        Text(average.toString(), textScaleFactor: 2,)
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  height: 80,
                                  width:
                                      MediaQuery.of(context).size.width * .95,
                                  child: Text(students[index].name),
                                );
                              }
                            },
                          );
                        });
                  } else {
                    return const Text('Нет учеников');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
