import 'package:tech_tide/core/data/models/chats/message_response_model.dart';

class Chat {
  String? id;
  List<String>? participants;
  List<Message>? messages;

  Chat({
    required this.id, 
    required this.participants, 
    required this.messages
  });

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['ChatID'];
    participants = List<String>.from(json['Participants']);
    messages = List<Message>.from(json['messages'].map((x) => Message.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ChatID'] = id;
    data['Participants'] = participants;
    data['messages'] = messages?.map((x) => x.toJson()).toList();
    return data;
  }
}
