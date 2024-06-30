import 'package:collection/collection.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class FiveDaysForecast {
  Location? location;
  Current? current;
  Forecast? forecast;

  FiveDaysForecast({this.location, this.current, this.forecast});

  factory FiveDaysForecast.fromJson(Map<String, dynamic> json) {
    return FiveDaysForecast(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FiveDaysForecast) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => location.hashCode ^ current.hashCode ^ forecast.hashCode;
}
