// import 'package:flutter/material.dart';
// import 'package:mobooble/components/common/save-button.dart';
// import 'package:mobooble/core/constants.dart';
// import 'package:mobooble/components/groups.dart';
// import 'package:mobooble/screens/add-marks.dart';
//
// class AddStudents extends StatefulWidget {
//   final Students student;
//   AddStudents({Key key, this.student}) : super(key: key);
//
//   @override
//   _AddStudentsState createState() => _AddStudentsState();
// }
//
// class _AddStudentsState extends State<AddStudents> {
//   Students student = Students();
//
//   @override
//   void initState() {
//     if (widget.student != null && widget.student.mark.length == 7)
//       student = widget.student.copy();
//     else
//       student.s = [
//         Marks(box: []),
//         Marks(box: []),
//         Marks(box: []),
//         Marks(box: []),
//         Marks(box: []),
//         Marks(box: []),
//         Marks(box: [])
//       ];
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//         actions: <Widget>[
//           SaveButton(
//             onPressed: () {
//               Navigator.of(context).pop(student);
//             },
//           )
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.all(5),
//         decoration: BoxDecoration(color: bgColorWhite),
//         child: ListView.builder(
//             itemCount: student.mark.length,
//             itemBuilder: (context, i) {
//               return Card(
//                 elevation: 2.0,
//                 margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 child: InkWell(
//                   onTap: () async {
//                     var  = student.s[i];
//                     var new = await Navigator.push<Marks>(
//                         context,
//                         MaterialPageRoute(
//                             builder: (ctx) => Add(: )));
//                     if (new != null)
//                       setState((){
//                         student.mark[i] = new;
//                       });
//                   },
//                   child: Container(
//                     decoration:
//                     BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
//                     child: ListTile(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                       leading: Container(
//                         padding: EdgeInsets.only(right: 12),
//                         child: student.mark[i].isSet
//                             ? Icon(
//                           Icons.check,
//                           color: Colors.green,
//                         )
//                             : Icon(
//                           Icons.hourglass_empty,
//                           color: Colors.blue,
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 right: BorderSide(
//                                     width: 1, color: Colors.white24))),
//                       ),
//                       title: Text(
//                           ' ${i + 1} - ' +
//                               (student.mark[i].isSet
//                                   ? '${student.mark[i].notBlocksCount} '
//                                   : ' '),
//                           style: TextStyle(
//                               color: Theme.of(context).textTheme.title.color,
//                               fontWeight: FontWeight.bold)),
//                       trailing: Icon(Icons.keyboard_arrow_right,
//                           color: Theme.of(context).textTheme.title.color),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
