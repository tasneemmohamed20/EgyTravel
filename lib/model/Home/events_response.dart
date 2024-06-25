import 'package:freezed_annotation/freezed_annotation.dart';
part '../Profile/events_response.g.dart';

@JsonSerializable()
class EventsResponseModel {
  final String? status;
  final int? results;
  EvData? data;
  EventsResponseModel(this.status, this.results);

  factory EventsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseModelFromJson(json);
}

@JsonSerializable()
class EvData {
  @JsonKey(name: 'events')
  final List<EventsData>? eventsData;

  EvData(this.eventsData);

  factory EvData.fromJson(Map<String, dynamic> json) => _$EvDataFromJson(json);
}

@JsonSerializable()
class EventsData {
  final String? name;
  final String? description;
  final List<String>? images;
  final String? location;
  final String? startAt;
  final String? endAt;

  EventsData(this.name, this.description, this.images, this.location,
      this.startAt, this.endAt);
  factory EventsData.fromJson(Map<String, dynamic> json) =>
      _$EventsDataFromJson(json);
}
