import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_request_body.g.dart';

@JsonSerializable()
class EditRequestBody {
  String? name;
  String? address;
  String? avatar;

  EditRequestBody({
    this.name,
    this.address,
    this.avatar,
  });
  Map<String, dynamic> toJson() => _$EditRequestBodyToJson(this);
}
