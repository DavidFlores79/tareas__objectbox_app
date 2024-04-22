// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1538615798397230940),
      name: 'Task',
      lastPropertyId: const IdUid(6, 496118746235548031),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 477797445001150420),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(4, 1772044119568249895),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2587332096969327667),
            name: 'status',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 496118746235548031),
            name: 'ownerId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 3539736307884998510),
            relationTarget: 'User')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 7630191406667593444),
      name: 'User',
      lastPropertyId: const IdUid(3, 3770105495536300319),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2542577521066630953),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 9094383772816296501),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3770105495536300319),
            name: 'email',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'tasks', srcEntity: 'Task', srcField: '')
      ])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 7630191406667593444),
      lastIndexId: const IdUid(1, 3539736307884998510),
      lastRelationId: const IdUid(1, 6137138831116308599),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [130953832102802972, 7707280218212920320],
      retiredRelationUids: const [6137138831116308599],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Task: EntityDefinition<Task>(
        model: _entities[0],
        toOneRelations: (Task object) => [object.owner],
        toManyRelations: (Task object) => {},
        getId: (Task object) => object.id,
        setId: (Task object, int id) {
          object.id = id;
        },
        objectToFB: (Task object, fb.Builder fbb) {
          final descriptionOffset = fbb.writeString(object.description);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(3, descriptionOffset);
          fbb.addBool(4, object.status);
          fbb.addInt64(5, object.owner.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Task(
              description: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              status: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 12, false))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.owner.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.owner.attach(store);
          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[1],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {
              RelInfo<Task>.toOneBacklink(
                      6, object.id, (Task srcObject) => srcObject.owner):
                  object.tasks
            },
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final emailOffset = fbb.writeString(object.email);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, emailOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = User(
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(
              object.tasks,
              store,
              RelInfo<Task>.toOneBacklink(
                  6, object.id, (Task srcObject) => srcObject.owner),
              store.box<User>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Task] entity fields to define ObjectBox queries.
class Task_ {
  /// see [Task.id]
  static final id = QueryIntegerProperty<Task>(_entities[0].properties[0]);

  /// see [Task.description]
  static final description =
      QueryStringProperty<Task>(_entities[0].properties[1]);

  /// see [Task.status]
  static final status = QueryBooleanProperty<Task>(_entities[0].properties[2]);

  /// see [Task.owner]
  static final owner =
      QueryRelationToOne<Task, User>(_entities[0].properties[3]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[1].properties[0]);

  /// see [User.name]
  static final name = QueryStringProperty<User>(_entities[1].properties[1]);

  /// see [User.email]
  static final email = QueryStringProperty<User>(_entities[1].properties[2]);
}
