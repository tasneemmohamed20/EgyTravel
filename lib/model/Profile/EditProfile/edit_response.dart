import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_response.g.dart';

@JsonSerializable()
class EditResponseModel {
  final String? status;
  @JsonKey(name: 'data')
  final UserData? userData;

  EditResponseModel(this.status, this.userData);

  factory EditResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditResponseModelFromJson(json);
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
