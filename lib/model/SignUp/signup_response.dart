import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final String? token;
  final String? status;
  @JsonKey(name: 'data')
  final UserData? userData;

  SignUpResponseModel(this.userData, this.token, this.status);

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? address;
  final List? favoritePlaces;
  final List? favoriteArticles;
  final List? userTrips;
  final String? avatar;

  UserData(this.id, this.name, this.email, this.password, this.address,
      this.favoritePlaces, this.favoriteArticles, this.userTrips, this.avatar);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
