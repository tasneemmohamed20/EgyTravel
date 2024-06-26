import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_request_body.g.dart';

@JsonSerializable()
class DeleteRequestBody {
  String password;

  DeleteRequestBody({
    required this.password,
  });
  Map<String, dynamic> toJson() => _$DeleteRequestBodyToJson(this);
}
