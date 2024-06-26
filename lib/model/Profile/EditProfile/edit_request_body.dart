import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_request_body.g.dart';

@JsonSerializable()
class EditRequestBody {
  String? name;
  String? address;
  dynamic avatar;
  String? email;

  EditRequestBody({
    this.name,
    this.address,
    this.avatar,
    this.email,
  });
  Map<String, dynamic> toJson() => _$EditRequestBodyToJson(this);
  factory EditRequestBody.fromJson(Map<String, dynamic> json) =>
      _$EditRequestBodyFromJson(json);

  // Map<String, dynamic> clearedToJson() {
  //   final jsonMap = _$EditRequestBodyToJson(this);
  //   jsonMap.removeWhere(
  //       (key, value) => value == null || (value is String && value.isEmpty));
  //   return jsonMap;
  // }

  // // Optional: For convenience if you are updating from a Map<String, dynamic>
  // EditRequestBody copyWithCleanedJson(Map<String, dynamic> newValues) {
  //   return EditRequestBody.fromJson(
  //     newValues.map((key, value) => MapEntry(key,
  //         value == null || (value is String && value.isEmpty) ? null : value)),
  //   );
  // }
}
