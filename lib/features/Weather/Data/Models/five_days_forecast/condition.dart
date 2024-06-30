import 'package:collection/collection.dart';

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Condition) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => text.hashCode ^ icon.hashCode ^ code.hashCode;
}
