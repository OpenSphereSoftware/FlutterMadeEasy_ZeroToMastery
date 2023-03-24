// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoCollectionModel _$ToDoCollectionModelFromJson(Map<String, dynamic> json) =>
    ToDoCollectionModel(
      id: json['id'] as String,
      title: json['title'] as String,
      colorIndex: json['colorIndex'] as int,
    );

Map<String, dynamic> _$ToDoCollectionModelToJson(
        ToDoCollectionModel instance) =>
    <String, dynamic>{
      'colorIndex': instance.colorIndex,
      'title': instance.title,
      'id': instance.id,
    };
