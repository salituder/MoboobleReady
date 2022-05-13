import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String id;
  String title;

  Group(this.title, {this.id});
  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(map['title'], id: map['id']);
  }
}

class Student {
  String id;
  String group;
  String name;

  Student(this.group, this.name, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'group': group,
      'name': name,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(map['group'], map['name']);
  }
}

class Marks {
  Timestamp date;
  int mark;
  String name;
  Marks(this.name, this.mark, this.date);
  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'name': name,
      'mark': mark,
    };
  }
  factory Marks.fromMap(Map<String, dynamic> map) {
    return Marks(map['name'], map['mark'], map['date']);
  }
}