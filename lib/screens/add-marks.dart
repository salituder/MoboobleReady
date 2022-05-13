// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:mobooble/components/common/save-button.dart';
// import 'package:mobooble/components/common/toast.dart';
// import 'package:mobooble/components//-remove-alert.dart';
// import 'package:mobooble/components//.dart';
// import 'package:mobooble/core/constants.dart';
// import 'package:mobooble/components/groups.dart';
//
// class AddMarks extends StatefulWidget {
//   final Marks mark;
//   AddMarks({Key key, this.mark}) : super(key: key);
//
//   @override
//   _AddMarksState createState() => _AddMarksState();
// }
//
// class _AddMarksState extends State<AddMarks> {
//   Marks mark = Marks(box: []);
//
//   @override
//   void initState() {
//     if (widget.mark != null) {
//       mark = widget.mark.copy();
//     }
//
//     if (mark.box == null || mark.box.length == 0)
//       mark.box = [MarksSingleBoxBlock(Markbox())];
//
//     super.initState();
//   }
//
//   final _fbKey = GlobalKey<FormBuilderState>();
//   String _defaultNewType = 'Single ';
//
//   var _TypeMenuItems = <String>[
//     'Single ',
//   ]
//       .map((String value) => DropdownMenuItem<String>(
//     value: value,
//     child: Text(value),
//   ))
//       .toList();
//
//   void _addbox() {
//     Marksboxblock newBlock;
//     switch () {
//       case 'Single':
//         newBlock = MarksSingleBoxBlock(Marksbox());
//         break;
//     }
//
//     setState(() {
//       if (newBlock != null) mark.box.add(newBlock);
//     });
//   }
//
//   void _newTypeDialog() {
//     var alert = AlertDialog(
//       title: Text(""),
//       content: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 DropdownButtonFormField<String>(
//                   decoration: const InputDecoration(labelText: ''),
//                   items: _TypeMenuItems,
//                   value: _defaultType,
//                   onChanged: (String val) =>
//                       setState(() => _defaultType = val),
//                 ),
//               ],
//             );
//           }),
//       actions: <Widget>[
//         new FlatButton(
//             onPressed: () {
//               _addbox();
//               Navigator.pop(context);
//             },
//             child: Text('Select')),
//         new FlatButton(
//             onPressed: () => Navigator.pop(context), child: Text('Cancel'))
//       ],
//     );
//     showDialog(context: context, builder: (_) => alert);
//   }
//
//   void _savemarkPlan() {
//     if (_fbKey.currentState.saveAndValidate()) {
//       if (mark.box.length > 0) {
//         print(mark.box.where((d) => d is Block).length);
//         if (mark.box.where((d) => d is Block).length ==
//             mark.box.length) {
//           buildToast('');
//           return;
//         }
//       }
//
//       Navigator.of(context).pop(mark);
//     } else {
//       buildToast('Ooops! Something is not right');
//     }
//   }
//
//   void _removegroup(Marksboxblock block) {
//     setState(() {
//       mark.box.remove(block);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//         actions: <Widget>[
//           SaveButton(onPressed: _savegroup),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         backgroundColor: Theme.of(context).primaryColor,
//         foregroundColor: Colors.white,
//         onPressed: _newTypeDialog,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(color: bgColorWhite),
//           child: FormBuilder(
//             key: _fbKey,
//             // autovalidate: false,
//             initialValue: {},
//             readOnly: false,
//             child: Column(
//                 children: mark.Blocks.map((block) {
//                   var index = indexOf(block);
//                   return _Block(index, block);
//                 }).toList()),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBlock(int blockIndex, Block block) {
//     return Container(
//       child: Card(
//         elevation: 2.0,
//         margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//         child: Container(
//           decoration:
//           BoxDecoration(color: _getHeaderColor(context, block)),
//           child: Column(
//             children: <Widget>[
//               ListTile(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                 title: Row(children: <Widget>[
//                   Text(_getBlockHeader(block),
//                       style: TextStyle(
//                           color: Theme.of(context).textTheme.title.color,
//                           fontWeight: FontWeight.bold)),
//                   SizedBox(width: 20),
//                       ? DropdownButton(
//                     items: Iterable<int>.generate(5)
//                         .map((val) => DropdownMenuItem(
//                           ? val + 2
//                           : val + 1,
//                       child: Text(
//                     ))
//                         .toList(),
//                     onChanged: (val) {
//                       setState(() {
//                         block.changesCount(val);
//                       });
//                     },
//                     value: block.s.length,
//                     style: TextStyle(
//                         color: Colors.blue, fontWeight: FontWeight.bold),
//                   )
//                       : SizedBox.shrink()
//                 ]),
//                 trailing: IconButton(
//                   icon: Icon(Icons.remove_circle),
//                   color: Colors.red,
//                   onPressed: () async {
//                     var result = await showDialog(
//                         context: context,
//
//
//                   },
//                 ),
//               ),
//               Column(
//                 children: <Widget>[
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   isNumeric(string) =>
//       string != null && int.tryParse(string.toString().trim()) != null;
//   cleanInt(string) => int.parse(string.toString().trim());
//
//   Widget _buildgroups(int blockIndex, block) {
//     return Column(
//         children:
//         Iterable<int>.generate(length)
//             .map(
//               (ind) => (
//             isSingle: block.students.length <= 1,
//             Index: blockIndex,
//             index: ind,
//
//           ),
//         )
//             .toList()
//
//     );
//   }
//
//   Widget _buildBlockParams(int index,  block) {
//     if (block is Block) {
//       return Card(
//         child: Column(
//           children: <Widget>[
//
//           ],
//         ),
//       );
//     } else if (block is Block) {
//       return Card(
//         child: Column(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(left: 4, right: 4),
//               child: FormBuilderTextField(
//                 initialValue:
//                 block.timeCapMin == null ? '' : block.toString(),
//                 attribute: "timeCapMin_$index",
//                 decoration: InputDecoration(
//                   labelText: "",
//                 ),
//                 onChanged: (dynamic val) {
//                   if (isNumeric(val)) block.timeCapMin = cleanInt(val);
//                 },
//                 validators: [
//                   FormBuilderValidators.required(),
//                   FormBuilderValidators.max(100),
//                   FormBuilderValidators.numeric(),
//                 ],
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 4, right: 4),
//               child: FormBuilderTextField(
//                 initialValue:
//                 block.rounds == null ? '' : block.toString(),
//                 attribute: "rounds_$index",
//                 decoration: InputDecoration(
//                   labelText: "Rounds *",
//                 ),
//                 onChanged: (dynamic val) {
//                   if (isNumeric(val)) block.rounds = cleanInt(val);
//                 },
//                 validators: [
//                   FormBuilderValidators.required(),
//                   FormBuilderValidators.max(100),
//                   FormBuilderValidators.numeric(),
//                 ],
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//
//           ],
//         ),
//       );
//     } else if (block is EmomBlock) {
//
//       );
//     } else if (block is Block) {
//       return Card(
//         child: Column(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(left: 4, right: 4),
//               child: FormBuilderTextField(
//                 initialValue:
//                 block.timeMin == null ? '' : block.toString(),
//                 attribute: "timeMin_$index",
//                 decoration: InputDecoration(
//
//                 ),
//                 onChanged: (dynamic val) {
//                   if (isNumeric(val)) block.time = cleanInt(val);
//                 },
//                 validators: [
//                   FormBuilderValidators.required(),
//                   FormBuilderValidators.max(100),
//                   FormBuilderValidators.numeric(),
//                 ],
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return SizedBox.shrink();
//   }
//
//   Color _getBlockHeaderColor(
//       BuildContext context, Block block) {
//     if (block is Block) return Color.fromRGBO(80, 150, 70, 0.9);
//
//     return Color.fromRGBO(50, 65, 85, 0.9);
//   }
//
//
//     return '';
//   }
// }
