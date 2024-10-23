import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request.g.dart';

@JsonSerializable(createFactory: false)
class UpdateProfileRequest {
  @JsonKey(includeIfNull: false)
  final String? username;
  @JsonKey(includeIfNull: false)
  final String? bio;
  @JsonKey(includeToJson: false)
  final File? image;

  UpdateProfileRequest({this.username, this.bio, this.image});

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
