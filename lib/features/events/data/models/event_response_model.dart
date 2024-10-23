import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/timestamp_converter.dart';

part 'event_response_model.g.dart';

@JsonSerializable(createToJson: false)
class EventResponseModel {
  String? eventId;
  String? title;
  String? description;
  @TimestampConverter()
  DateTime? startDateTime;
  @TimestampConverter()
  DateTime? endDateTime;
  @JsonKey(includeFromJson: false)
  List<UserResponseModel>? going;
  String? governorate;
  String? imageUrl;
  String? address;

  EventResponseModel({
    this.eventId,
    this.title,
    this.description,
    this.startDateTime,
    this.endDateTime,
    this.going,
    this.governorate,
    this.imageUrl,
    this.address,
  });

  factory EventResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EventResponseModelFromJson(json);

  EventResponseModel copyWith(
      {String? eventId,
      String? title,
      String? description,
      DateTime? startDateTime,
      DateTime? endDateTime,
      List<UserResponseModel>? going,
      String? governorate,
      String? imageUrl,
      String? address}) {
    return EventResponseModel(
      eventId: eventId ?? this.eventId,
      title: title ?? this.title,
      description: description ?? this.description,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      going: going ?? this.going,
      governorate: governorate ?? this.governorate,
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
    );
  }
}
