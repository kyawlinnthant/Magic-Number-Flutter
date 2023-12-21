import 'package:magic_number/features/date/domain/model/date_vo.dart';

class DateDto {
  DateDto(
      {required this.text,
      required this.year,
      required this.number,
      required this.found,
      required this.type});

  String? text;
  num? year;
  num? number;
  bool? found;
  String? type;

  DateDto.fromJson(dynamic json) {
    text = json['text'];
    year = json['year'];
    number = json['number'];
    found = json['found'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['year'] = year;
    map['number'] = number;
    map['found'] = found;
    map['type'] = type;
    return map;
  }

  DateVo toVo() => DateVo(
      description: text ?? "",
      year: year?.toInt() ?? 0,
      number: number?.toInt() ?? 0,
      found: found ?? false,
      type: type ?? '');
}
