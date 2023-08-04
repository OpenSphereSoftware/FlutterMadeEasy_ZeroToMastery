import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

mixin ToDoCollectionMapper {
  ToDoCollection toDoCollectionModelToEntity(ToDoCollectionModel model) {
    final entity = ToDoCollection(
      id: CollectionId.fromUniqueString(model.id),
      title: model.title,
      color: ToDoColor(colorIndex: model.colorIndex),
    );

    return entity;
  }

  ToDoCollectionModel toDoCollectionToModel(ToDoCollection collection) {
    final model = ToDoCollectionModel(
      id: collection.id.value,
      title: collection.title,
      colorIndex: collection.color.colorIndex,
    );

    return model;
  }
}
