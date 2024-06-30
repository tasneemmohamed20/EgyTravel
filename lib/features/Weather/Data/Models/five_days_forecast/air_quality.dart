import 'package:collection/collection.dart';

class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
        co: (json['co'] as num?)?.toDouble(),
        no2: (json['no2'] as num?)?.toDouble(),
        o3: (json['o3'] as num?)?.toDouble(),
        so2: (json['so2'] as num?)?.toDouble(),
        pm25: (json['pm2_5'] as num?)?.toDouble(),
        pm10: (json['pm10'] as num?)?.toDouble(),
        usEpaIndex: json['us-epa-index'] as int?,
        gbDefraIndex: json['gb-defra-index'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'co': co,
        'no2': no2,
        'o3': o3,
        'so2': so2,
        'pm2_5': pm25,
        'pm10': pm10,
        'us-epa-index': usEpaIndex,
        'gb-defra-index': gbDefraIndex,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AirQuality) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      co.hashCode ^
      no2.hashCode ^
      o3.hashCode ^
      so2.hashCode ^
      pm25.hashCode ^
      pm10.hashCode ^
      usEpaIndex.hashCode ^
      gbDefraIndex.hashCode;
}
