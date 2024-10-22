// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventResponseModel _$EventResponseModelFromJson(Map<String, dynamic> json) =>
    EventResponseModel(
      eventId: json['eventId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      dateTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['dateTime'], const TimestampConverter().fromJson),
      governorate: json['governorate'] as String?,
      imageUrl: json['imageUrl'] as String?,
      address: json['address'] as String?,
    );

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
