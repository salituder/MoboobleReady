import 'package:flutter/material.dart';

class Group {
  String uid;
  String title;

  Group({ this.uid, this.title});

  // Group.fromJson(String uid, Map<String, dynamic> data){
  //   uid = uid;
  //   title = data['title'];
  // }


 }

//  class StudentsChoice {
//   List<Student> students;
//
//   StudentsChoice({this.students});
//
//    StudentsChoice copy(){
//      var copiedStudents = students.map((w) => w.copy()).toList();
//      return StudentsChoice(students: copiedStudents);
//    }
//  }
//
// class Student{
//   String notes
//   List<Marks> mark;
//
//   Student({this.mark, this.notes});
//
//   Student copy(){
//     var copiedDays = mark.map((w) => w.copy()).toList();
//
//     return Student(mark: copiedDays, notes: notes);
//   }
//
//   // int get daysWithDrills => mark != null ? mark.where((d) => d.isSet).length : 0;
// }
//
// class Marks {
//   String notes;
//   String title;
//   List<Marksbox> box;
//
//
//   Marks({this.box, this.notes});
//
//   Marks copy() {
//     var copiedBlocks = box.map((w) => w.copy()).toList();
//     return Marks(notes: notes, box: copiedBlocks);
//   }
// }
//
// class Marksbox {
//   String title;
//   int grade;
//
//   Marksbox({this.title, this.grade});
//
//   Marksbox copy(){
//     return Marksbox(title: title, grade: grade);
//   }
// }
//
// enum Marksboxtype{
//   SINGLE
// }
//
// abstract class Marksboxblock{
//   Marksboxtype type;
//   List<Marksbox> grades;
//
//   Marksboxblock({this.type, this.grades});
//
//   void changeMarksCount(int count) {
//     var diff = count - grades.length;
//
//     if(diff == 0) return;
//
//     if(diff > 0){
//       for(int i = 0; i<diff; i++){
//         grades.add(Marksbox());
//       }
//     }else{
//       grades = grades.sublist(0, grades.length+diff);
//     }
//   }
//
//   Marksboxblock copy();
//
//   List<Marksbox> copyMarksbox(){
//     return grades.map((w) => w.copy()).toList();
//   }
// }
//
// class MarksSingleBoxBlock extends Marksboxblock
// {
//   MarksSingleBoxBlock(Marksbox grade)
//       : super(type: Marksboxtype.SINGLE, grades:[grade]);
//
//   MarksSingleBoxBlock copy(){
//     return MarksSingleBoxBlock(copyMarksbox()[0]);
//   }
// }

class Groupslist extends StatefulWidget {

  @override
  State<Groupslist> createState() => _GroupslistState();
}

class _GroupslistState extends State<Groupslist> {
  final groups = <Group>[
    Group(title: 'ПРИ-311'),
    Group(title: 'ПРИ-312 '),//ЗАГЛУШКИ НА ГРУППЫ
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