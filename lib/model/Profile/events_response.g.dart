// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../Home/events_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventsResponseModel _$EventsResponseModelFromJson(Map<String, dynamic> json) =>
    EventsResponseModel(
      json['status'] as String?,
      (json['results'] as num?)?.toInt(),
    )..data = json['data'] == null
        ? null
        : EvData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$EventsResponseModelToJson(
        EventsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

EvData _$EvDataFromJson(Map<String, dynamic> json) => EvData(
      (json['events'] as List<dynamic>?)
          ?.map((e) => EventsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EvDataToJson(EvData instance) => <String, dynamic>{
      'events': instance.eventsData,
    };

EventsData _$EventsDataFromJson(Map<String, dynamic> json) => EventsData(
      json['name'] as String?,
      json['description'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['location'] as String?,
      json['startAt'] as String?,
      json['endAt'] as String?,
    );

Map<String, dynamic> _$EventsDataToJson(EventsData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'location': instance.location,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
    };
