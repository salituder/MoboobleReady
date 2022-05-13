// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:mobooble/components/groups.dart';
//
// class Drill extends StatelessWidget {
//   final bool isSingleDrill;
//   final int drillBlockIndex;
//   final int index;
//   final Marks drill;
//
//   Drill({Key key, this.drillBlockIndex, this.index, this.isSingleDrill, this.drill}) : super(key: key);
//
//   isNumeric(string) => string != null && int.tryParse(string.toString().trim()) != null;
//   cleanInt(string) => int.parse(string.toString().trim());
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         padding: EdgeInsets.only(left: 4, right: 4),
//         decoration: BoxDecoration(color: Colors.white54),
//         child: Column(
//           children: <Widget>[
//             FormBuilderTextField(
//               initialValue: drill.title,
//               attribute: "title_${drillBlockIndex}_$index",
//               decoration: InputDecoration(
//                 labelText: isSingleDrill ? "Drill *" : "Drill #${index+1} *",
//               ),
//               onChanged: (dynamic val) { drill.title = val; },
//               validators: [
//                 FormBuilderValidators.required(),
//                 FormBuilderValidators.maxLength(100),
//               ],
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
