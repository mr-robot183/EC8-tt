import 'package:flutter/cupertino.dart';

class Period{
  String id;
  String name;
  String code;
  String teacher;
  String start;
  String end;
  String link;
  String day;
  String type;
  Period({@required this.name, @required this.code, this.teacher, @required this.start, this.end, @required this.link, this.id, this.day, this.type});

  factory Period.fromMap(Map<String, dynamic> data, String documentID) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final String code = data['code'];
    final String teacher = data['teacher'];
    final String start = data['start'];
    final String end = data['end'];
    final String link = data['link'];
    final String type = data['type'];
    return Period(
        name: name,
        code: code,
        teacher: teacher,
        start: start,
        end: end,
        link: link,
        type: type,
        id: documentID
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'teacher': teacher,
      'start': start,
      'end': end,
      'link': link,
      'type': type,
    };
  }

}