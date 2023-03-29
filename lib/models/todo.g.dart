part of 'todo.dart';


Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      name: json['name'] as String,
      time: json['time'] as String,
      date: json['date']as String,
      isDone:json['isDone'],
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'name': instance.name,
      'time': instance.time,
      'date': instance.date,
      'isDone': instance.isDone,
    };