import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_response.g.dart';

@JsonSerializable()
class EditResponseModel {
  final String? status;
  final Data? data;

  EditResponseModel(this.status, this.data);

  factory EditResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'user')
  final UserData? userData;

  Data(this.userData);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? address;
  final List? favoritePlaces;
  final List? favoriteArticles;
  final List? userTrips;
  final String? avatar;

  UserData(this.id, this.name, this.email, this.address, this.favoritePlaces,
      this.favoriteArticles, this.userTrips, this.avatar);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
