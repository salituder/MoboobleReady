// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:mobooble/components/common/save-button.dart';
// import 'package:mobooble/components/common/toast.dart';
// import 'package:mobooble/core/constants.dart';
// import 'package:mobooble/components/groups.dart';
// import 'package:mobooble/screens/add-students.dart';
//
// class AddGroup extends StatefulWidget {
//   final StudentsChoice studentschoice;
//
//   AddGroup({Key key, this.studentschoice}) : super(key: key);
//
//   @override
//   _AddGroupState createState() => _AddGroupState();
// }
//
// class _AddGroupState extends State<AddGroup> {
//   final _fbKey = GlobalKey<FormBuilderState>();
//
//   StudentsChoice group = StudentsChoice(students: []);
//
//   @override
//   void initState() {
//     if (widget.studentschoice != null) group = widget.studentschoice.copy();
//
//     super.initState();
//   }
//
//   void _saveGroup() {
//     if (_fbKey.currentState.saveAndValidate()) {
//       if(group.students == null || group.students.length == 0)
//       {
//         buildToast('Пожалуйста добавьте хотя бы одного студента');
//         return;
//       }
//
//       Navigator.of(context).pop(group);
//     } else {
//       buildToast('Упс! что-то пошло не так!');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Mobooble / создать группу'),
//           actions: <Widget>[
//             SaveButton(onPressed: _saveGroup)
//           ],
//         ),
//         body: Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(color: bgColorWhite),
//           child: Column(
//             children: <Widget>[
//               FormBuilder(
//                 // context,
//                 key: _fbKey,
//                 // autovalidate: false,
//                 initialValue: {},
//                 readOnly: false,
//                 child: Column(
//                   children: <Widget>[
//                     FormBuilderTextField(
//                       attribute: "title",
//                       decoration: InputDecoration(
//                         labelText: "Title*",
//                       ),
//                       onChanged: (dynamic val) {},
//                       validators: [
//                         FormBuilderValidators.required(),
//                         FormBuilderValidators.maxLength(100),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     'Студенты',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   FlatButton(
//                     child: Icon(Icons.add),
//                     onPressed: () async {
//                       var week = await Navigator.push<Student>(
//                           context,
//                           MaterialPageRoute(
//                               builder: (ctx) => AddStudents()));
//                       if (week != null)
//                         setState(() {
//                           group.students.add(student);
//                         });
//                     },
//                   )
//                 ],
//               ),
//               group.students.length <= 0
//                   ? Text(
//                 'Пожалуйста добавьте хотя бы одного студента',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               )
//                   : _buildWeeks()
//             ],
//           ),
//         ));
//   }
//
//   Widget _buildWeeks() {
//     return Expanded(
//       //padding: EdgeInsets.all(5),
//         child: Column(
//             children: group.students
//                 .map((week) => Card(
//               elevation: 2.0,
//               margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               child: InkWell(
//                 onTap: () async {
//                   var ind = group.students.indexOf(student);
//
//                   var modifiedStudent = await Navigator.push<Student>(
//                       context,
//                       MaterialPageRoute(
//                           builder: (ctx) =>
//                               AddStudents(student: student)));
//                   if (modifiedStudent != null) {
//                     setState(() {
//                       group.students[ind] = modifiedStudent;
//                     });
//                   }
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color.fromRGBO(50, 65, 85, 0.9)),
//                   child: ListTile(
//                     contentPadding:
//                     EdgeInsets.symmetric(horizontal: 10),
//                     leading: Container(
//                       padding: EdgeInsets.only(right: 12),
//                       child: Icon(
//                         Icons.check,
//                         color: Colors.green,
//                       ),
//                       decoration: BoxDecoration(
//                           border: Border(
//                               right: BorderSide(
//                                   width: 1, color: Colors.white24))),
//                     ),
//
//                   ),
//                 ),
//               ),
//             ))
//                 .toList()));
//   }
// }
