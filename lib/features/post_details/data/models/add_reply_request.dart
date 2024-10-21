import 'package:json_annotation/json_annotation.dart';
import 'package:tech_tide/core/network/timestamp_converter.dart';

part 'add_reply_request.g.dart';

@JsonSerializable(createFactory: false)
class AddReplyRequest {
  final String content;
  final String? userId;
  final List<String> likes = [];
  @TimestampConverter()
  final DateTime createdAt = DateTime.now();

  AddReplyRequest({required this.content, this.userId});

  Map<String, dynamic> toJson() => _$AddReplyRequestToJson(this);

  AddReplyRequest copyWith({String? content, String? userId}) {
    return AddReplyRequest(
      content: content ?? this.content,
      userId: userId ?? this.userId,
    );
  }
}
