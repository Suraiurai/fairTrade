import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';

@JsonSerializable()
class Message{
  int? id;
  String? text;
  bool? received;
  String? timeStamp;

  Message({required this.id, required this.text, required this.received, required this.timeStamp});


  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

List<Message> messages = [
  Message(id: 0, text: "Hi", received: false, timeStamp: "16:30"),
  Message(id: 1, text: "hello ", received: true, timeStamp: "16:35"),
  Message(id: 1, text: "Reloaded 1 of 977 libraries in 137ms (compile: 15 ms, reload: 44 ms, reassemble: 69 ms). ", received: true, timeStamp: "16:35"),
  Message(id: 1, text: "Reloaded 1 of 977 libraries in 137ms (compile: 15 ms, reload: 44 ms, reassemble: 69 ms). ", received: false, timeStamp: "16:35"),

];