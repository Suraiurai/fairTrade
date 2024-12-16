// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      received: json['received'] as bool?,
      timeStamp: json['timeStamp'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'received': instance.received,
      'timeStamp': instance.timeStamp,
    };
